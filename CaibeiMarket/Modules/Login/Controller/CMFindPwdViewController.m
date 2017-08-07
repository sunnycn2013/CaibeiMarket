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

@property (nonatomic, strong) UIView * pwdBgView;
@property (nonatomic, strong) CMTextFieldView  * pwdTextFiled;
@property (nonatomic, strong) UIButton *verificationButton;
@property (nonatomic, strong) UIView * conformPwdBgView;
@property (nonatomic, strong) CMTextFieldView  * conformPwdTextFiled;

@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation CMFindPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"重置密码";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    
    [self.view addSubview:self.pwdBgView];
    [self.view addSubview:self.pwdTextFiled];
    [self.view addSubview:self.verificationButton];
    [self.view addSubview:self.conformPwdBgView];
    [self.view addSubview:self.conformPwdTextFiled];
    [self.view addSubview:self.nextButton];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)reSetPassWordAction:(id)sender
{
    [MBProgressHUD showSuccessMessage:@"注册成功!!"];
}

- (void)nextAction:(UIButton *)sender
{
    KPostNotification(KNotificationLoginStateChange, @YES);
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

- (CMTextFieldView *)pwdTextFiled
{
    if (!_pwdTextFiled) {
        _pwdTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20, _pwdBgView.top, KScreenWidth-120, 35)];
        _pwdTextFiled.placeholder = @"请输入手机号";
        _pwdTextFiled.textFieldBgColor = [UIColor lightGrayColor];
        _pwdTextFiled.showRoundedCorner = NO;
        _pwdTextFiled.fontSize = 14;
    }
    return _pwdTextFiled;
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
        [_verificationButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
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

- (CMTextFieldView *)conformPwdTextFiled
{
    if (!_conformPwdTextFiled) {
        _conformPwdTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(20,_conformPwdBgView.top, KScreenWidth-120, 35)];
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
