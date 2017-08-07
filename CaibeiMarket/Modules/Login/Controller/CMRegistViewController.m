//
//  CMRegistViewController.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMRegistViewController.h"
#import "CMTextFieldView.h"
#import "CMPersonInfoSetingViewController.h"

@interface CMRegistViewController ()

@property (nonatomic, strong) UIView * pwdBgView;
@property (nonatomic, strong) CMTextFieldView *phoneNumTextField;
@property (nonatomic, strong) UIButton *verificationButton;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation CMRegistViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    [self.view addSubview:self.pwdBgView];
    [self.view addSubview:self.phoneNumTextField];
//    [self.view addSubview:self.verificationButton];
    [self.view addSubview:self.nextButton];
}

- (void)nextAction:(UIButton *)sender
{
    CMPersonInfoSetingViewController * viewController = [[CMPersonInfoSetingViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - set get
- (UIView *)pwdBgView
{
    if (!_pwdBgView) {
        _pwdBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 84, KScreenWidth, 35)];
        _pwdBgView.backgroundColor = [UIColor whiteColor];
    }
    return _pwdBgView;
}

- (CMTextFieldView *)phoneNumTextField
{
    if (!_phoneNumTextField) {
        _phoneNumTextField = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20, _pwdBgView.top, KScreenWidth-120, 35)];
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

- (UIButton *)nextButton
{
    if (!_nextButton) {
        CGFloat margin = kIPhone6Scale(96) / 2.0;
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.frame = CGRectMake(margin, _phoneNumTextField.bottom + 10, KScreenWidth-90, 45);
        _nextButton.backgroundColor = CMThemeColor;
        _nextButton.layer.cornerRadius = 22.5;
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}
@end
