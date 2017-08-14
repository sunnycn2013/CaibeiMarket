//
//  UAHTTPSessionManager.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/10.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "UAHTTPSessionManager.h"
#import "UAUtil.h"
#import "UAHttpRequestModel.h"
#import "UAHttpRequestModelManager.h"

@interface UAHTTPSessionManager ()

@property (nonatomic, strong) AFHTTPSessionManager *httpSessionManager;
@property (nonatomic, strong) NSURL *baseURL;

@end

@implementation UAHTTPSessionManager

+ (instancetype _Nullable )manager
{
    return [[self alloc] initWithBaseURL:nil];
}

- (instancetype _Nullable )initWithBaseURL:(nullable NSString *)urlString
{
    return [self initWithBaseURL:urlString sessionConfiguration:nil];
}

- (instancetype _Nullable )initWithBaseURL:(nullable NSString *)urlString
                      sessionConfiguration:(nullable NSURLSessionConfiguration *)configuration
{
    self = [super init];
    if (self) {
        NSURL * url = nil;
        if (urlString) {
             url = [NSURL URLWithString:urlString];
        }
        self.baseURL = url;
        self.httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url sessionConfiguration:configuration];
        self.httpSessionManager.requestSerializer =  [AFHTTPRequestSerializer serializer];
        self.httpSessionManager.responseSerializer =  [AFHTTPResponseSerializer serializer];
        self.httpSessionManager.securityPolicy.allowInvalidCertificates =  YES;
        self.httpSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/javascript",nil];//设置相应内容类型
    }
    return self;
}

- (nullable NSURLSessionDataTask *)GET:(NSString *_Nullable)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress * _Nullable downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure
{
    NSString * urlstring = [self rebuildRequestUrlByAPIMethod:URLString];
    return [self.httpSessionManager GET:urlstring parameters:parameters progress:downloadProgress success:success failure:failure];
}

- (nullable NSURLSessionDataTask *)POST:(NSString *_Nullable)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
{
    NSString * urlstring = [self rebuildRequestUrlByAPIMethod:URLString];
    return [self.httpSessionManager POST:urlstring parameters:parameters progress:uploadProgress
                                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                     if (success) {
                                         success(task,[UAUtil objectFromData:responseObject]);
                                     }
                                 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                     if (failure) {
                                         failure(task,error);
                                     }
                                 }];

}

- (nullable NSURLSessionDataTask *)POST:(NSString *_Nullable)URLString
                             parameters:(nullable id)parameters
              constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> _Nullable formData))block
                               progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure
{
    NSString * urlstring = [self rebuildRequestUrlByAPIMethod:URLString];
    return [self.httpSessionManager POST:urlstring parameters:parameters progress:uploadProgress success:success failure:failure];
}

- (void)setRequestSerializer:(AFHTTPRequestSerializer<AFURLRequestSerialization> *)requestSerializer
{
    self.httpSessionManager.requestSerializer = requestSerializer;
}

- (void)setResponseSerializer:(AFHTTPResponseSerializer<AFURLResponseSerialization> *)responseSerializer
{
    self.httpSessionManager.responseSerializer = responseSerializer;
}

- (NSString *)rebuildRequestUrlByAPIMethod:(NSString *)apiName
{
    UAHttpRequestModel * model = [[UAHttpRequestModel alloc] init];
    model.method = apiName;
    return [UAHttpRequestModelManager getServerURL:model];
}

@end
