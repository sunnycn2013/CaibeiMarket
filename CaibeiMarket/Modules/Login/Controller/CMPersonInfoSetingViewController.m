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

@property (nonatomic, strong) UILabel          *noteLabel;

@property (nonatomic, strong) UIView           *phoneBgView;
@property (nonatomic, strong) UIButton         * areaTextButton;
@property (nonatomic, strong) CMTextFieldView  * phoneTextField;
@property (nonatomic, strong) UIButton         * verificationButton;

@property (nonatomic, strong) UIView           *veriCodeBgView;
@property (nonatomic, strong) CMTextFieldView  *veriCodeTextField;

@property (nonatomic, strong) UIView           *conformPwdBgView;
@property (nonatomic, strong) CMTextFieldView  *pwdTextFiled;

@property(nonatomic, strong) UIButton        *nextButton;
@property(nonatomic, strong) YYTimer         *timer;
@property(nonatomic, assign) NSInteger timeCount;
@property(nonatomic, assign) CMRegistActionType type;
@property(nonatomic, strong) UAHTTPSessionManager * veriRequest;
@property(nonatomic, strong) UAHTTPSessionManager * registRequest;
@property(nonatomic, strong) UAHTTPSessionManager * sendVerfiCoderequest;
@property(nonatomic, strong) UAHTTPSessionManager * resetPwdRequest;



@end

@implementation CMPersonInfoSetingViewController

- (instancetype)initWithUserName:(NSString *)userName type:(CMRegistActionType)type
{
    self = [super init];
    if (self) {
        self.userName = userName;
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置密码";
    self.timeCount = 60;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    
    [self.view addSubview:self.noteLabel];
    [self.view addSubview:self.phoneBgView];
    [self.view addSubview:self.areaTextButton];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.verificationButton];
    
    [self.view addSubview:self.veriCodeBgView];
    [self.view addSubview:self.veriCodeTextField];

    [self.view addSubview:self.conformPwdBgView];
    [self.view addSubview:self.pwdTextFiled];
    [self.view addSubview:self.nextButton];
    self.verificationButton.enabled = YES;
    [self.timer fire];
    
    self.phoneTextField.text = self.userName;
    [self.phoneTextField setUserInteractionEnabled:NO];
}

- (void)nextAction:(UIButton *)sender
{
    NSCharacterSet * character = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString * verfiCode = [self.veriCodeTextField.text stringByTrimmingCharactersInSet:character];
    if (verfiCode.length==0 && verfiCode.length > 6) {
        [MBProgressHUD showErrorMessage:@"验证码格式错误"];
        return;
    }
    NSDictionary * params = @{
                              @"phone":self.userName ? : @"",
                              @"code": verfiCode,
                              @"type": [NSString stringWithFormat:@"%d",(int)self.type],
                              };
    __weak typeof(self) weakSelf = self;
    self.veriRequest = [UAHTTPSessionManager manager];
    [self.veriRequest POST:@"veriCodes/verifyCode.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        NSArray * propertys = [responseObject objectForKey:@"properties"];
        if ([resultCode isEqualToString:@"0000"]) {
            NSDictionary * dic = [propertys objectAtIndex:0];
            if (weakSelf.type == CMRegistActionTypeRegist) {
                [weakSelf execRegistActionWith:dic[@"token"]];
            }else{
                [weakSelf resetPasswordToken:dic[@"token"]];
            }
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
    NSDictionary * params = @{@"phone":self.userName ? : @"",
                              @"type": [NSString stringWithFormat:@"%d",(int)self.type]
                              };
    
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

- (void)resetPasswordToken:(NSString *)token
{
    NSCharacterSet * character = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString * password = [self.pwdTextFiled.text stringByTrimmingCharactersInSet:character];
    NSDictionary * params = @{
                              @"password":password ? : @"",
                              @"token":token ? : @"",
                              };
    __weak typeof(self) weakSelf = self;
    self.resetPwdRequest = [UAHTTPSessionManager manager];
    [self.resetPwdRequest POST:@"resetPassword.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        NSArray * propertys = [responseObject objectForKey:@"properties"];
        if ([resultCode isEqualToString:@"0000"]) {
            [MBProgressHUD showErrorMessage:message];
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
- (UILabel *)noteLabel
{
    if (!_noteLabel) {
        _noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 84, KScreenWidth, kIPhone6PScale(10))];
        _noteLabel.text = @"  请输入手机号验证码，请设置新的登录密码";
        _noteLabel.font = [UIFont systemFontOfSize:12];
        _noteLabel.textColor = [UIColor lightGrayColor];
        _noteLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _noteLabel;
}

- (UIView *)phoneBgView
{
    if (!_phoneBgView) {
        _phoneBgView = [[UIView alloc] initWithFrame:CGRectMake(77, _noteLabel.bottom+13, KScreenWidth, kIPhone6PScale(40))];
        _phoneBgView.backgroundColor = [UIColor whiteColor];
    }
    return _phoneBgView;
}

- (UIButton *)areaTextButton
{
    if (!_areaTextButton) {
        _areaTextButton = [[UIButton alloc] initWithFrame:CGRectMake(0, _phoneBgView.top, 75, kIPhone6PScale(40))];
        [_areaTextButton setTitle:@"+86" forState:UIControlStateNormal];
        [_areaTextButton setTitleColor:CMThemeColor forState:UIControlStateNormal];
        _areaTextButton.backgroundColor = [UIColor whiteColor];
    }
    return _areaTextButton;
}

- (CMTextFieldView *)phoneTextField
{
    if (!_phoneTextField) {
        
        _phoneTextField = [[CMTextFieldView alloc] initWithFrame:CGRectMake(_areaTextButton.right+2, _phoneBgView.top, KScreenWidth-120-77, kIPhone6PScale(40))];
        _phoneTextField.placeholder = @"请输入手机号";
        _phoneTextField.textFieldBgColor = [UIColor lightGrayColor];
        _phoneTextField.textColor = [UIColor lightGrayColor];
        _phoneTextField.showRoundedCorner = NO;
        _phoneTextField.fontSize = 14;
    }
    return _phoneTextField;
}

- (UIButton *)verificationButton
{
    if (!_verificationButton) {
        CGFloat width = 100;
        _verificationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _verificationButton.frame = CGRectMake(KScreenWidth - width-20, _phoneTextField.top+5, width, 30);
        _verificationButton.backgroundColor = CMThemeColor;
        _verificationButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_verificationButton setTitle:@"获取验证码(60秒)" forState:UIControlStateNormal];
        [_verificationButton addTarget:self action:@selector(resendVerifiCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _verificationButton;
}






- (UIView *)veriCodeBgView
{
    if (!_veriCodeBgView) {
        _veriCodeBgView = [[UIView alloc] initWithFrame:CGRectMake(0, _phoneBgView.bottom + kIPhone6Scale(13), KScreenWidth, kIPhone6Scale(40))];
        _veriCodeBgView.backgroundColor = [UIColor whiteColor];
    }
    return _veriCodeBgView;
}

- (CMTextFieldView *)veriCodeTextField
{
    if (!_veriCodeTextField) {
        _veriCodeTextField = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20,_veriCodeBgView.top, KScreenWidth-120, kIPhone6Scale(40))];
        _veriCodeTextField.placeholder = @"请输入验证码";
        _veriCodeTextField.showRoundedCorner = NO;
        _veriCodeTextField.fontSize = 14;
    }
    return _veriCodeTextField;
}

- (UIView *)conformPwdBgView
{
    if (!_conformPwdBgView) {
        _conformPwdBgView = [[UIView alloc] initWithFrame:CGRectMake(0, _veriCodeBgView.bottom + kIPhone6Scale(13), KScreenWidth, kIPhone6Scale(40))];
        _conformPwdBgView.backgroundColor = [UIColor whiteColor];
    }
    return _conformPwdBgView;
}

- (CMTextFieldView *)pwdTextFiled
{
    if (!_pwdTextFiled) {
        _pwdTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20,_conformPwdBgView.top, KScreenWidth-120, kIPhone6Scale(40))];
        _pwdTextFiled.placeholder = @"请输入密码";
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

- (YYTimer *)timer
{
    if (!_timer) {
        _timer = [YYTimer timerWithTimeInterval:1 target:self selector:@selector(doIntervalAction:) repeats:YES];
    }
    return _timer;
}
@end
