//
//  LoginViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "LoginViewController.h"
#import "CMRegistViewController.h"
#import "CMTextFieldView.h"

@interface LoginViewController ()

@property(nonatomic,strong) UIImageView  * headerImageView;

@property(nonatomic,strong) CMTextFieldView  * telephoneTextFiled;
@property(nonatomic,strong) CMTextFieldView  * pwdTextFiled;
@property(nonatomic,strong) UIButton     * forgetPWDButton;
@property(nonatomic,strong) UIButton     * loginButton;
@property(nonatomic,strong) UIButton     * registButton;
@property(nonatomic,strong) UAHTTPSessionManager * request;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    
    [self.view addSubview:self.headerImageView];
    [self.view addSubview:self.telephoneTextFiled];
    [self.view addSubview:self.pwdTextFiled];
    [self.view addSubview:self.forgetPWDButton];

    [self.view addSubview:self.loginButton];

    [self.view addSubview:self.registButton];
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoard:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

//如果仅设置当前页导航透明，需加入下面方法
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)skipAction
{
    KPostNotification(KNotificationLoginStateChange, @YES);
}

- (void)closeKeyBoard:(UITapGestureRecognizer *)ges
{
    [kAppDelegate.window endEditing:NO];
}

- (void)loginAction:(id)sender
{
    NSCharacterSet * character = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString * userName = [self.telephoneTextFiled.text stringByTrimmingCharactersInSet:character];
    NSString * pwd = [self.pwdTextFiled.text stringByTrimmingCharactersInSet:character];
    
    NSDictionary * params = @{@"phone":userName ? : @"",
                              @"password": pwd ? : @""};
    
    self.request = [UAHTTPSessionManager manager];
    [self.request POST:@"login.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        if ([resultCode isEqualToString:@"0000"]) {
            [[CMUserManager sharedCMUserManager] saveLoginInfo:params completion:nil];
            KPostNotification(KNotificationLoginStateChange, @YES);
        }else{
            [MBProgressHUD showErrorMessage:message];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        [MBProgressHUD showErrorMessage:@"服务异常"];
    }];
}

- (void)registAction:(id)sender
{
    CMRegistViewController * regist = [[CMRegistViewController alloc] initWithActionType:CMRegistActionTypeRegist];
    [self.navigationController pushViewController:regist animated:YES];
}

- (void)forgetPwdAction:(UIButton *)sender
{
    CMRegistViewController * regist = [[CMRegistViewController alloc] initWithActionType:CMRegistActionTypeResetPwd];
    [self.navigationController pushViewController:regist animated:YES];
}

#pragma mark - set get
- (UIImageView *)headerImageView
{
    if (!_headerImageView) {//231 97
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kIPhone6Scale(212/2), kIPhone6Scale(330/2), kIPhone6Scale(231/2), kIPhone6Scale(97/2))];
        _headerImageView.image = [UIImage imageNamed:@"header"];
        
    }
    return _headerImageView;
}

- (CMTextFieldView *)telephoneTextFiled
{
    if (!_telephoneTextFiled) {
        CGFloat width = KScreenWidth - kIPhone6Scale(96);
        CGFloat height = kIPhone6Scale(45);
        CGFloat margin = kIPhone6Scale(96) / 2.0;
        _telephoneTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(margin, kIPhone6Scale(285), width, height)];
        _telephoneTextFiled.placeholder = @"请输入手机号";
        _telephoneTextFiled.layer.cornerRadius = height/2;
        _telephoneTextFiled.backgroundColor = [UIColor whiteColor];
    }
    return _telephoneTextFiled;
}

- (CMTextFieldView *)pwdTextFiled
{
    if (!_pwdTextFiled) {
        CGFloat width = KScreenWidth - kIPhone6Scale(96);
        CGFloat height = kIPhone6Scale(45);
        _pwdTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(_telephoneTextFiled.left, _telephoneTextFiled.bottom + kIPhone6Scale(23), width, height)];
        _pwdTextFiled.placeholder = @"请输入手机号";
        _pwdTextFiled.layer.cornerRadius = height/2;
        _pwdTextFiled.backgroundColor = [UIColor whiteColor];
    }
    return _pwdTextFiled;
}

- (UIButton *)forgetPWDButton
{
    if (!_forgetPWDButton) {
        CGFloat width = kIPhone6Scale(60);
        _forgetPWDButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetPWDButton.frame = CGRectMake(_pwdTextFiled.right - width, _pwdTextFiled.bottom +kIPhone6Scale(10) , width, kIPhone6Scale(20));
        _forgetPWDButton.backgroundColor = [UIColor clearColor];
        _forgetPWDButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _forgetPWDButton.titleLabel.textAlignment = NSTextAlignmentRight;
        [_forgetPWDButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetPWDButton setTitleColor:CMThemeColor forState:UIControlStateNormal];
        [_forgetPWDButton addTarget:self action:@selector(forgetPwdAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPWDButton;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        CGFloat width = KScreenWidth - kIPhone6Scale(96);
        CGFloat height = kIPhone6Scale(45);
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(_pwdTextFiled.left, _pwdTextFiled.bottom + kIPhone6Scale(49), width, height);
        _loginButton.backgroundColor = CMThemeColor;
        _loginButton.layer.cornerRadius = height/2;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)registButton
{
    if (!_registButton) {
        _registButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registButton.frame = CGRectMake(_loginButton.left, _loginButton.bottom + kIPhone6Scale(22), kIPhone6Scale(38), kIPhone6Scale(20));
        _registButton.backgroundColor = [UIColor clearColor];
        _registButton.centerX = KScreenWidth/2;
        _registButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_registButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registButton setTitleColor:CMThemeColor forState:UIControlStateNormal];
        [_registButton addTarget:self action:@selector(registAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registButton;
}


@end
