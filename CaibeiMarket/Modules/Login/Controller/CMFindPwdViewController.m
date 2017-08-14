//
//  CMConfirmPwdViewController.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFindPwdViewController.h"
#import "CMTextFieldView.h"

@interface CMFindPwdViewController ()

@property (nonatomic, strong) NSString * userName;

@property (nonatomic, strong) UIView           *pwdBgView;
@property (nonatomic, strong) CMTextFieldView  *veriCodeTextField;
@property (nonatomic, strong) UIButton         *verificationButton;
@property (nonatomic, strong) UIView           *conformPwdBgView;
@property (nonatomic, strong) CMTextFieldView  *pwdTextFiled;
@property (nonatomic, strong) UIButton         *nextButton;

@property(nonatomic, strong) UAHTTPSessionManager * veriRequest;
@property(nonatomic, strong) UAHTTPSessionManager * resetPwdRequest;
@property(nonatomic, strong) UAHTTPSessionManager * sendVerfiCoderequest;
@end

@implementation CMFindPwdViewController

- (instancetype)initWithUserName:(NSString *)userName
{
    self = [super init];
    if (self) {
        self.userName = userName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"重置密码";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    
    [self.view addSubview:self.pwdBgView];
    [self.view addSubview:self.veriCodeTextField];
    [self.view addSubview:self.verificationButton];
    [self.view addSubview:self.conformPwdBgView];
    [self.view addSubview:self.pwdTextFiled];
    [self.view addSubview:self.nextButton];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reSetPassWordAction:(id)sender
{
    [MBProgressHUD showSuccessMessage:@"注册成功!!"];
}

- (void)nextAction:(UIButton *)sender
{
    NSCharacterSet * character = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString * verfiCode = [self.veriCodeTextField.text stringByTrimmingCharactersInSet:character];
    
    NSDictionary * params = @{
                              @"phone":self.userName ? : @"",
                              @"code":verfiCode ? : @"",
                              @"type": @"2",
                              };
    __weak typeof(self) weakSelf = self;
    self.veriRequest = [UAHTTPSessionManager manager];
    [self.veriRequest POST:@"veriCodes/verifyCode.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        NSArray * propertys = [responseObject objectForKey:@"properties"];
        if ([resultCode isEqualToString:@"0000"]) {
            NSDictionary * dic = [propertys objectAtIndex:0];
            [weakSelf resetPasswordToken:dic[@"token"]];
        }else{
            [MBProgressHUD showErrorMessage:message];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        [MBProgressHUD showErrorMessage:@"服务异常"];
    }];
}

- (void)sendVerificationCodeAction:(UIButton *)button
{
    
}

- (void)resetPasswordToken:(NSString *)token
{
    NSCharacterSet * character = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString * password = [self.pwdTextFiled.text stringByTrimmingCharactersInSet:character];
    NSDictionary * params = @{
                              @"password":password ? : @"",
                              @"token":token ? : @"",
                              };
    __weak typeof(self) weakSelf = self;
    self.veriRequest = [UAHTTPSessionManager manager];
    [self.veriRequest POST:@"resetPassword.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        NSArray * propertys = [responseObject objectForKey:@"properties"];
        if ([resultCode isEqualToString:@"0000"]) {
            NSDictionary * dic = [propertys objectAtIndex:0];
            [weakSelf resetPasswordToken:dic[@"token"]];
        }else{
            [MBProgressHUD showErrorMessage:message];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        [MBProgressHUD showErrorMessage:@"服务异常"];
    }];

}
#pragma mark -  set get

- (UIView *)pwdBgView
{
    if (!_pwdBgView) {
        _pwdBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 84, KScreenWidth, 35)];
        _pwdBgView.backgroundColor = [UIColor whiteColor];
    }
    return _pwdBgView;
}

- (CMTextFieldView *)veriCodeTextField
{
    if (!_veriCodeTextField) {
        _veriCodeTextField = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20, _pwdBgView.top, KScreenWidth-120, 35)];
        _veriCodeTextField.placeholder = @"请输入手机号";
        _veriCodeTextField.textFieldBgColor = [UIColor lightGrayColor];
        _veriCodeTextField.showRoundedCorner = NO;
        _veriCodeTextField.fontSize = 14;
    }
    return _veriCodeTextField;
}

- (UIButton *)verificationButton
{
    if (!_verificationButton) {
        CGFloat width = KScreenWidth - _pwdTextFiled.right - 10;
        _verificationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _verificationButton.frame = CGRectMake(_pwdTextFiled.right, _pwdTextFiled.top+2, width, 30);
        _verificationButton.backgroundColor = CMThemeColor;
        _verificationButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_verificationButton setTitle:@"获取验证码(60秒)" forState:UIControlStateNormal];
        [_verificationButton addTarget:self action:@selector(sendVerificationCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _verificationButton;
}

- (UIView *)conformPwdBgView
{
    if (!_conformPwdBgView) {
        _conformPwdBgView = [[UIView alloc] initWithFrame:CGRectMake(0, _pwdTextFiled.bottom + kIPhone6Scale(13), KScreenWidth, 35)];
        _conformPwdBgView.backgroundColor = [UIColor whiteColor];
    }
    return _conformPwdBgView;
}

- (CMTextFieldView *)pwdTextFiled
{
    if (!_pwdTextFiled) {
        _pwdTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20,_conformPwdBgView.top, KScreenWidth-120, 35)];
        _pwdTextFiled.placeholder = @"请确认密码";
        _pwdTextFiled.showRoundedCorner = NO;
        _pwdTextFiled.fontSize = 14;
    }
    return _pwdTextFiled;
}

- (UIButton *)nextButton
{
    if (!_nextButton) {
        CGFloat margin = kIPhone6Scale(96) / 2.0;
        CGFloat marginTop = _pwdTextFiled.bottom + 20;
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.frame = CGRectMake(margin, marginTop, KScreenWidth-90, 45);
        _nextButton.backgroundColor = CMThemeColor;
        _nextButton.layer.cornerRadius = 22.5;
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}
@end
