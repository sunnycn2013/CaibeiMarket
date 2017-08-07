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

@property (nonatomic, strong) UIView * phoneNumBgView;
@property (nonatomic, strong) CMTextFieldView *phoneNumTextField;
@property (nonatomic, strong) UIButton *verificationButton;

//@property(nonatomic,strong) CMTextFieldView  * verificationCodeTextFiled;
@property (nonatomic, strong) UIView * conformPwdBgView;

@property(nonatomic,strong) CMTextFieldView  * conformPwdTextFiled;
@property(nonatomic,strong) UIButton *nextButton;

@end

@implementation CMPersonInfoSetingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置密码";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    [self.view addSubview:self.phoneNumBgView];
    [self.view addSubview:self.phoneNumTextField];
    [self.view addSubview:self.verificationButton];

//    [self.view addSubview:self.verificationCodeTextFiled];
    [self.view addSubview:self.conformPwdBgView];
    [self.view addSubview:self.conformPwdTextFiled];
    [self.view addSubview:self.nextButton];
}

- (void)nextAction:(UIButton *)sender
{
    KPostNotification(KNotificationLoginStateChange, @YES);
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

- (CMTextFieldView *)phoneNumTextField
{
    if (!_phoneNumTextField) {
        _phoneNumTextField = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20, _phoneNumBgView.top, KScreenWidth-120, 35)];
        _phoneNumTextField.placeholder = @"请输入手机号";
        _phoneNumTextField.textFieldBgColor = [UIColor lightGrayColor];
        _phoneNumTextField.showRoundedCorner = NO;
        _phoneNumTextField.fontSize = 14;
    }
    return _phoneNumTextField;
}

- (UIButton *)verificationButton
{
    if (!_verificationButton) {
        CGFloat width = KScreenWidth - _phoneNumTextField.right - 10;
        _verificationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _verificationButton.frame = CGRectMake(_phoneNumTextField.right, _phoneNumTextField.top+2, width, 30);
        _verificationButton.backgroundColor = CMThemeColor;
        _verificationButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_verificationButton setTitle:@"获取验证码(60秒)" forState:UIControlStateNormal];
        [_verificationButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _verificationButton;
}





//- (CMTextFieldView *)verificationCodeTextFiled
//{
//    if (!_verificationCodeTextFiled) {
//        CGFloat width = KScreenWidth - kIPhone6Scale(96);
//        CGFloat height = kIPhone6Scale(45);
//        CGFloat margin = kIPhone6Scale(96) / 2.0;
//        _verificationCodeTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(margin, 120, width, height)];
//        _verificationCodeTextFiled.placeholder = @"请输入验证码";
//        _verificationCodeTextFiled.backgroundColor = [UIColor whiteColor];
//    }
//    return _verificationCodeTextFiled;
//}

- (UIView *)conformPwdBgView
{
    if (!_conformPwdBgView) {
        _conformPwdBgView = [[UIView alloc] initWithFrame:CGRectMake(0, _phoneNumTextField.bottom + kIPhone6Scale(13), KScreenWidth, 35)];
        _conformPwdBgView.backgroundColor = [UIColor whiteColor];
    }
    return _conformPwdBgView;
}

- (CMTextFieldView *)conformPwdTextFiled
{
    if (!_conformPwdTextFiled) {
        _conformPwdTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20, _conformPwdBgView.top, KScreenWidth-120, 35)];
        _conformPwdTextFiled.placeholder = @"请确认密码";
        _conformPwdTextFiled.showRoundedCorner = NO;
        _conformPwdTextFiled.fontSize = 14;
    }
    return _conformPwdTextFiled;
}

- (UIButton *)nextButton
{
    if (!_nextButton) {
        CGFloat margin = kIPhone6Scale(96) / 2.0;
        CGFloat marginTop = _conformPwdTextFiled.bottom + 20;
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
