//
//  CMRegistViewController.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMRegistViewController.h"
#import "CMTextFieldView.h"

@interface CMRegistViewController ()

@property (nonatomic, strong) CMTextFieldView *phoneNumTextField;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation CMRegistViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.phoneNumTextField];
    [self.view addSubview:self.nextButton];
}

#pragma mark - set get

- (CMTextFieldView *)phoneNumTextField
{
    if (!_phoneNumTextField) {
        _phoneNumTextField = [[CMTextFieldView alloc] initWithFrame:CGRectMake(45, 150, KScreenWidth-90, 45)];
        _phoneNumTextField.placeholder = @"请输入手机号";
        _phoneNumTextField.textFieldBgColor = [UIColor lightGrayColor];
//        _phoneNumTextField.backgroundColor = [UIColor redColor];
    }
    return _phoneNumTextField;
}

- (UIButton *)nextButton
{
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.frame = CGRectMake(_phoneNumTextField.left, _phoneNumTextField.bottom + 10, KScreenWidth-90, 45);
        _nextButton.backgroundColor = CMThemeColor;
        _nextButton.layer.cornerRadius = 22.5;
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    }
    return _nextButton;
}
@end
