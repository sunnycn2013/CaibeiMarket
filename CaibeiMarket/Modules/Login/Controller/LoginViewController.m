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
#import "CMLicenseViewController.h"
#import "CMFindPwdViewController.h"
#import "CMPersonInfoSetingViewController.h"

@interface LoginViewController ()

@property(nonatomic,strong) UIImageView  * headerImageView;

@property(nonatomic,strong) UIButton         * areaTextButton;
@property(nonatomic,strong) CMTextFieldView  * telephoneTextFiled;
@property(nonatomic,strong) CMTextFieldView  * pwdTextFiled;
@property(nonatomic,strong) UIButton     * forgetPWDButton;
@property(nonatomic,strong) UIButton     * loginButton;
@property(nonatomic,strong) UIButton     * licenseButton;
@property(nonatomic,strong) UIButton     * registButton;
@property(nonatomic,strong) UAHTTPSessionManager * request;
@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    
    [self.view addSubview:self.areaTextButton];
    [self.view addSubview:self.telephoneTextFiled];
    [self.view addSubview:self.pwdTextFiled];

    [self.view addSubview:self.licenseButton];
    [self.view addSubview:self.loginButton];
    
    [self.view addSubview:self.forgetPWDButton];
    [self.view addSubview:self.registButton];

    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoard:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

//如果仅设置当前页导航透明，需加入下面方法
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
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
    __weak typeof(self) weakSelf = self;
    [self.request POST:@"login.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        if ([resultCode isEqualToString:@"0000"]) {
            [[CMUserManager sharedInstance] saveLoginInfo:params completion:nil];
            KPostNotification(KNotificationLoginStateChange, @YES);
            [MBProgressHUD showInfoMessage:@"登录成功"];
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
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

- (void)cancelAction:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)acceptLicense:(UIButton *)sender
{
    CMLicenseViewController * license = [[CMLicenseViewController alloc] init];
    [self.navigationController pushViewController:license animated:YES];
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

- (UIButton *)areaTextButton
{
    if (!_areaTextButton) {
        CGFloat top = [UIApplication sharedApplication].statusBarFrame.size.height +44;
        _areaTextButton = [[UIButton alloc] initWithFrame:CGRectMake(0, top +kIPhone6Scale(8), 75, kIPhone6PScale(40))];
        [_areaTextButton setTitle:@"+86" forState:UIControlStateNormal];
        [_areaTextButton setTitleColor:CMThemeColor forState:UIControlStateNormal];
        _areaTextButton.backgroundColor = [UIColor whiteColor];
    }
    return _areaTextButton;
}

- (CMTextFieldView *)telephoneTextFiled
{
    if (!_telephoneTextFiled) {
        CGFloat top = [UIApplication sharedApplication].statusBarFrame.size.height +44;
        CGFloat width = KScreenWidth - 77;
        _telephoneTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(_areaTextButton.right+2, top +kIPhone6Scale(8), width, kIPhone6PScale(40))];
        _telephoneTextFiled.placeholder = @"请输入手机号";
        _telephoneTextFiled.backgroundColor = [UIColor whiteColor];
        _telephoneTextFiled.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _telephoneTextFiled;
}

- (CMTextFieldView *)pwdTextFiled
{
    if (!_pwdTextFiled) {
        CGFloat height = kIPhone6Scale(40);
        _pwdTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(0, _telephoneTextFiled.bottom + kIPhone6Scale(10), KScreenWidth, height)];
        _pwdTextFiled.placeholder = @"请输入密码";
        _pwdTextFiled.backgroundColor = [UIColor whiteColor];
        _pwdTextFiled.secureTextEntry = YES;
    }
    return _pwdTextFiled;
}

- (UIButton *)licenseButton
{
    if (!_licenseButton) {
        _licenseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _licenseButton.frame = CGRectMake(7, _pwdTextFiled.bottom + kIPhone6Scale(5), kIPhone6Scale(230), kIPhone6Scale(20));
        _licenseButton.backgroundColor = [UIColor clearColor];
        _licenseButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_licenseButton setTitle:@"登录即表示阅读并同意《采贝协议》" forState:UIControlStateNormal];
        [_licenseButton setTitleColor:CMThemeColor forState:UIControlStateNormal];
        [_licenseButton addTarget:self action:@selector(acceptLicense:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _licenseButton;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        CGFloat width = KScreenWidth - kIPhone6Scale(40);
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(kIPhone6PScale(20), _pwdTextFiled.bottom + kIPhone6Scale(49), width, kIPhone6Scale(40));
        _loginButton.backgroundColor = CMThemeColor;
        _loginButton.layer.cornerRadius = 5.0;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)forgetPWDButton
{
    if (!_forgetPWDButton) {
        CGFloat width = kIPhone6Scale(80);
        _forgetPWDButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetPWDButton.frame = CGRectMake(_pwdTextFiled.right - width-10, _loginButton.bottom +kIPhone6Scale(10) , width, kIPhone6Scale(20));
//        _forgetPWDButton.backgroundColor = [UIColor redColor];
        _forgetPWDButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_forgetPWDButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [_forgetPWDButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_forgetPWDButton addTarget:self action:@selector(forgetPwdAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPWDButton;
}

- (UIButton *)registButton
{
    if (!_registButton) {
        _registButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registButton.frame = CGRectMake(0, KScreenHeight - 40, kIPhone6Scale(108), kIPhone6Scale(20));
        _registButton.backgroundColor = [UIColor clearColor];
        _registButton.centerX = KScreenWidth/2;
        _registButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_registButton setTitle:@"新用户注册" forState:UIControlStateNormal];
        [_registButton setTitleColor:CMThemeColor forState:UIControlStateNormal];
        [_registButton addTarget:self action:@selector(registAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registButton;
}
//
//- (UIButton *)cancelButton
//{
//    if (!_cancelButton) {
//        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _cancelButton.frame = CGRectMake(KScreenWidth - kIPhone6Scale(65), kIPhone6Scale(30), kIPhone6Scale(45), kIPhone6Scale(45));
//        [_cancelButton setImage:[UIImage imageNamed:@"alertview_btn_close_highlight"] forState:UIControlStateSelected];
//        [_cancelButton setImage:[UIImage imageNamed:@"alertview_btn_close_normal"] forState:UIControlStateNormal];
//        [_cancelButton addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _cancelButton;
//}

@end
