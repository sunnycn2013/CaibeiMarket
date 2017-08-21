//
//  CMBorrowChooseFooterView.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/8/21.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowChooseFooterView.h"

@interface CMBorrowChooseFooterView ()

@property (nonatomic,strong)UIButton * resetButton;
@property (nonatomic,strong)UIButton * submitButton;

@end

@implementation CMBorrowChooseFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    self.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    [self addSubview:self.resetButton];
    [self addSubview:self.submitButton];
}

- (void)resetAction:(UIButton *)button
{
    if([self.delegate respondsToSelector:@selector(footView:didResetCondition:)]){
        [self.delegate footView:self didResetCondition:nil];
    }
}

- (void)submitAction:(UIButton *)button
{
    if([self.delegate respondsToSelector:@selector(footView:didCommitCondition:)]){
        [self.delegate footView:self didCommitCondition:nil];
    }
}

#pragma  mark -  set
- (UIButton *)resetButton
{
    if (!_resetButton) {
        _resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _resetButton.frame = CGRectMake(0, 0, KScreenWidth/2, 44);
        [_resetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_resetButton setTitle:@"重置" forState:UIControlStateNormal];
        [_resetButton addTarget:self action:@selector(resetAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resetButton;
}

- (UIButton *)submitButton
{
    if (!_submitButton) {
        _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitButton.backgroundColor = CMThemeColor;
        _submitButton.frame = CGRectMake(_resetButton.right, 0, KScreenWidth/2, 44);
        [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submitButton setTitle:@"完成" forState:UIControlStateNormal];
        [_submitButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitButton;
}
@end
