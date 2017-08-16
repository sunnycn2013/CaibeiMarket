//
//  CMValidationCodeViewController.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMPersonInfoSetingViewController.h"
#import "CMTextFieldView.h"

@interface CMPersonInfoSetingViewController ()

@property (nonatomic, strong) NSString * userName;

@property(nonatomic, strong) UIView          * phoneNumBgView;
@property(nonatomic, strong) CMTextFieldView *veriCodeTextField;
@property(nonatomic, strong) UIButton        *verificationButton;
@property(nonatomic, strong) UIView          * conformPwdBgView;
@property(nonatomic, strong) CMTextFieldView *pwdTextFiled;
@property(nonatomic, strong) UIButton        *nextButton;
@property(nonatomic, strong) YYTimer         *timer;
@property(nonatomic, assign) NSInteger timeCount;
@property(nonatomic, strong) UAHTTPSessionManager * veriRequest;
@property(nonatomic, strong) UAHTTPSessionManager * registRequest;
@property(nonatomic, strong) UAHTTPSessionManager * sendVerfiCoderequest;

@end

@implementation CMPersonInfoSetingViewController

- (instancetype)initWithUserName:(NSString *)userName
{
    self = [super init];
    if (self) {
        self.userName = userName;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置密码";
    self.timeCount = 60;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    [self.view addSubview:self.phoneNumBgView];
    [self.view addSubview:self.veriCodeTextField];
    [self.view addSubview:self.verificationButton];

    [self.view addSubview:self.conformPwdBgView];
    [self.view addSubview:self.pwdTextFiled];
    [self.view addSubview:self.nextButton];
    self.verificationButton.enabled = YES;
    [self.timer fire];
}

- (void)nextAction:(UIButton *)sender
{
    NSCharacterSet * character = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString * verfiCode = [self.veriCodeTextField.text stringByTrimmingCharactersInSet:character];
    
    NSDictionary * params = @{
                              @"phone":self.userName ? : @"",
                              @"code": @"123456",
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
            [weakSelf execRegistActionWith:dic[@"token"]];
        }else{
            [MBProgressHUD showErrorMessage:message];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        [MBProgressHUD showErrorMessage:@"服务异常"];
    }];
}

- (void)execRegistActionWith:(NSString *)token
{
    NSCharacterSet * character = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString * password = [self.pwdTextFiled.text stringByTrimmingCharactersInSet:character];
    
    NSDictionary * params = @{
                              @"password":password ? : @"",
                              @"token":token ? : @"",
                              };
    self.registRequest = [UAHTTPSessionManager manager];
    [self.registRequest POST:@"register.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        
        if ([resultCode isEqualToString:@"0000"]) {
            KPostNotification(KNotificationLoginStateChange, @YES);
        }else{
            [MBProgressHUD showErrorMessage:message];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        [MBProgressHUD showErrorMessage:@"服务异常"];
    }];

}


- (void)resendVerifiCodeAction:(UIButton *)button
{
    NSCharacterSet * character = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString * pwd01 = [self.userName stringByTrimmingCharactersInSet:character];
    
    NSDictionary * params = @{@"phone":self.userName ? : @"",
                              @"type": @"2"};
    
    self.sendVerfiCoderequest = [UAHTTPSessionManager manager];
    [self.sendVerfiCoderequest POST:@"resetPassword.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        
        if ([resultCode isEqualToString:@"0000"]) {
            KPostNotification(KNotificationLoginStateChange, @YES);
        }else{
            [MBProgressHUD showErrorMessage:message];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        [MBProgressHUD showErrorMessage:@"服务异常"];
    }];
}

- (void)doIntervalAction:(YYTimer *)timer
{
    NSString * title = nil;
    self.timeCount --;
    if (self.timeCount >= 0) {
        self.verificationButton.enabled = NO;
        title = [NSString stringWithFormat:@"获取验证码(%ld秒)",self.timeCount];
    }else
    {
        title = @"从新发送";
        self.verificationButton.enabled = YES;
    }
    [_verificationButton setTitle:title forState:UIControlStateNormal];

}
#pragma mark -  set get

- (UIView *)phoneNumBgView
{
    if (!_phoneNumBgView) {
        _phoneNumBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 84, KScreenWidth, 35)];
        _phoneNumBgView.backgroundColor = [UIColor whiteColor];
    }
    return _phoneNumBgView;
}

- (CMTextFieldView *)veriCodeTextField
{
    if (!_veriCodeTextField) {
        _veriCodeTextField = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20, _phoneNumBgView.top, KScreenWidth-120, 35)];
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
        CGFloat width = KScreenWidth - _veriCodeTextField.right - 10;
        _verificationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _verificationButton.frame = CGRectMake(_veriCodeTextField.right, _veriCodeTextField.top+2, width, 30);
        _verificationButton.backgroundColor = CMThemeColor;
        _verificationButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_verificationButton setTitle:@"获取验证码(60秒)" forState:UIControlStateNormal];
        [_verificationButton addTarget:self action:@selector(resendVerifiCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _verificationButton;
}

- (UIView *)conformPwdBgView
{
    if (!_conformPwdBgView) {
        _conformPwdBgView = [[UIView alloc] initWithFrame:CGRectMake(0, _veriCodeTextField.bottom + kIPhone6Scale(13), KScreenWidth, 35)];
        _conformPwdBgView.backgroundColor = [UIColor whiteColor];
    }
    return _conformPwdBgView;
}

- (CMTextFieldView *)pwdTextFiled
{
    if (!_pwdTextFiled) {
        _pwdTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20, _conformPwdBgView.top, KScreenWidth-120, 35)];
        _pwdTextFiled.placeholder = @"请确认密码";
        _pwdTextFiled.showRoundedCorner = NO;
        _pwdTextFiled.fontSize = 14;
        _pwdTextFiled.secureTextEntry = YES;
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

- (YYTimer *)timer
{
    if (!_timer) {
        _timer = [YYTimer timerWithTimeInterval:1 target:self selector:@selector(doIntervalAction:) repeats:YES];
    }
    return _timer;
}
@end
