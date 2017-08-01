//
//  LoginViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property(nonatomic,strong) UIImageView  * headerImageView;

@property(nonatomic,strong) UITextField  * telephoneTextFiled;
@property(nonatomic,strong) UITextField  * pwdTextFiled;
@property(nonatomic,strong) UIButton     * loginButton;
@property (weak, nonatomic) UIButton     * registButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    [self.view addSubview:self.headerImageView];
    [self.view addSubview:self.telephoneTextFiled];
    [self.view addSubview:self.pwdTextFiled];
    
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registButton];
    _loginButton.layer.cornerRadius = 15.0;
    _registButton.layer.cornerRadius = 15.0;
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoard:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewWillAppear:(BOOL)animated{
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
    KPostNotification(KNotificationLoginStateChange, @YES);
}

- (void)registAction:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (UITextField *)telephoneTextFiled
{
    if (!_telephoneTextFiled) {
        CGFloat width = KScreenWidth - kIPhone6Scale(96);
        CGFloat height = kIPhone6Scale(45);
        CGFloat margin = kIPhone6Scale(96) / 2.0;
        _telephoneTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(margin, kIPhone6Scale(285), width, height)];
        _telephoneTextFiled.placeholder = @"请输入手机号";
        _telephoneTextFiled.layer.cornerRadius = height/2;
        _telephoneTextFiled.backgroundColor = [UIColor whiteColor];
    }
    return _telephoneTextFiled;
}

- (UITextField *)pwdTextFiled
{
    if (!_pwdTextFiled) {
        CGFloat width = KScreenWidth - kIPhone6Scale(96);
        CGFloat height = kIPhone6Scale(45);
        _pwdTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(_telephoneTextFiled.left, _telephoneTextFiled.bottom + kIPhone6Scale(23), width, height)];
        _pwdTextFiled.placeholder = @"请输入手机号";
        _pwdTextFiled.layer.cornerRadius = height/2;
        _pwdTextFiled.backgroundColor = [UIColor whiteColor];
    }
    return _pwdTextFiled;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        CGFloat width = KScreenWidth - kIPhone6Scale(96);
        CGFloat height = kIPhone6Scale(45);
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(_pwdTextFiled.left, _pwdTextFiled.bottom + kIPhone6Scale(49), width, height);
        _loginButton.backgroundColor = CMThemeColor;
        _loginButton.layer.cornerRadius = 22;
        _loginButton.layer.masksToBounds = YES;
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
        _registButton.backgroundColor = CMThemeColor;
        [_registButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _registButton;
}

@end
