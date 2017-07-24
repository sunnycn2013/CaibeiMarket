//
//  LoginViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property(nonatomic,strong)IBOutlet UITextField  * telephoneNum;
@property(nonatomic,strong)IBOutlet UIButton     * loginButton;
@property (weak, nonatomic) IBOutlet UIButton    * registButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";    
    [_telephoneNum setPlaceholder:@"请输入手机号"];
    _loginButton.layer.cornerRadius = 15.0;
    _registButton.layer.cornerRadius = 15.0;
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoard:)];
    [self.view addGestureRecognizer:tapGesture];
}

-(void)WXLogin{
    [userManager login:kUserLoginTypeWeChat completion:^(BOOL success, NSString *des) {
        if (success) {
            DLog(@"登录成功");
        }else{
            DLog(@"登录失败：%@", des);
        }
    }];
}
-(void)QQLogin{
    [userManager login:kUserLoginTypeQQ completion:^(BOOL success, NSString *des) {
        if (success) {
            DLog(@"登录成功");
        }else{
            DLog(@"登录失败：%@", des);
        }
    }];
}

-(void)skipAction
{
    KPostNotification(KNotificationLoginStateChange, @YES);
}

- (void)closeKeyBoard:(UITapGestureRecognizer *)ges
{
    [kAppDelegate.window endEditing:NO];
}

- (IBAction)loginAction:(id)sender
{
    KPostNotification(KNotificationLoginStateChange, @YES);
}

- (IBAction)registAction:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
