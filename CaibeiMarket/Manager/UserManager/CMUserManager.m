//
//  UserManager.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/22.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "CMUserManager.h"
#import "LoginViewController.h"

@interface CMUserManager ()

@property(nonatomic,strong) UAHTTPSessionManager * request;

@end

@implementation CMUserManager

SINGLETON_FOR_CLASS(CMUserManager);

-(instancetype)init
{
    self = [super init];
    if (self) {
        //被踢下线
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onKick)
                                                     name:KNotificationOnKick
                                                   object:nil];
        [self loadUserInfo];
    }
    return self;
}

#pragma mark ————— 三方登录 —————
-(void)login:(UserLoginType )loginType completion:(loginBlock)completion
{
    [self login:loginType params:nil completion:completion];
}

#pragma mark ————— 带参数登录 —————
-(void)login:(UserLoginType )loginType params:(NSDictionary *)params completion:(loginBlock)completion
{
//    [[CMUniversalJump sharedInstance] pushViewController:CMUJmupLogin params:nil];
    [[CMUniversalJump sharedInstance] presentTo:CMUJmupLogin params:nil];

}


-(void)saveLoginInfo:(NSDictionary *)params completion:(loginBlock)completion
{
    CMUserInfo * info = [[CMUserInfo alloc] init];
    info.userName = params[@"phone"];
    self.curUserInfo = info;
    self.isLogined = YES;
    if (self.curUserInfo) {
        YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
        NSDictionary *dic = [self.curUserInfo modelToJSONObject];
        [cache setObject:dic forKey:KUserModelCache];
    }
    
}

#pragma mark ————— 手动登录到服务器 —————
-(void)loginToServer:(NSDictionary *)params completion:(loginBlock)completion
{
    [MBProgressHUD showActivityMessageInView:@"登录中..."];
    if([self loadUserInfo]){
        NSDictionary * params = @{@"phone":self.curUserInfo.userName ? : @"",
                                  @"password": self.curUserInfo.passWord ? : @""};
        
        [self.request POST:@"login.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
           [self LoginSuccess:responseObject completion:completion];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
            [MBProgressHUD showErrorMessage:@"服务异常"];
        }];
    }
}

#pragma mark ————— 自动登录到服务器 —————
-(void)autoLoginToServer:(loginBlock)completion{
    if([self loadUserInfo])
    {
        NSDictionary * params = @{@"phone":self.curUserInfo.userName ? : @"",
                                  @"password": self.curUserInfo.passWord ? : @""};
        [self.request POST:@"login.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
            [self LoginSuccess:responseObject completion:completion];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
            [MBProgressHUD showErrorMessage:@"服务异常"];
            completion(NO,error.description);
        }];
    }
}

#pragma mark ————— 登录成功处理 —————
-(void)LoginSuccess:(id )responseObject completion:(loginBlock)completion
{
    if (ValidDict(responseObject))
    {
        NSString *code = responseObject[@"resultCode"];
        if ([code isEqualToString:@"0000"]) {
            KPostNotification(KNotificationLoginStateChange, @YES);
            completion(YES,nil);
        }
    }else{
        if (completion) {
            completion(NO,@"登录返回数据异常");
        }
        KPostNotification(KNotificationLoginStateChange, @NO);
    }
}
#pragma mark ————— 储存用户信息 —————
-(void)saveUserInfo
{
    if (self.curUserInfo) {
        YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
        NSDictionary *dic = [self.curUserInfo modelToJSONObject];
        [cache setObject:dic forKey:KUserModelCache];
    }
}
#pragma mark ————— 加载缓存的用户信息 —————
-(BOOL)loadUserInfo
{
    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
    NSDictionary * userDic = (NSDictionary *)[cache objectForKey:KUserModelCache];
    if (userDic) {
        self.curUserInfo = [CMUserInfo modelWithJSON:userDic];
        self.isLogined = YES;
        return YES;
    }
    return NO;
}

-(void)onKick
{
    [self logout:nil];
}

- (void)logout:(void (^)(BOOL, NSString *))completion
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
    
    self.curUserInfo = nil;
    self.isLogined = NO;

//移除缓存
    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
    [cache removeAllObjectsWithBlock:^{
        if (completion) {
            completion(YES,nil);
        }
    }];
    
//    KPostNotification(KNotificationLoginStateChange, @NO);
}
@end
