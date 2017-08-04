//
//  CMTextFieldView.m
//  CaibeiMarket
//
//  Created by ccguo on 2017/8/3.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMTextFieldView.h"

@interface CMTextFieldView ()

@property (nonatomic, strong)UIView * bgView;
@property (nonatomic, strong)UITextField * textField;

@end

@implementation CMTextFieldView

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
    self.backgroundColor = [UIColor greenColor];
    [self addSubview:self.bgView];
    [self addSubview:self.textField];
    self.backgroundColor = [UIColor whiteColor];
    self.clipsToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.bgView setFrame:CGRectMake(0, 0, self.width, self.height)];
    [self.textField setFrame:CGRectMake(self.height/2, 0, self.width - self.height, self.height)];
    self.layer.cornerRadius = self.height/2;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _textField.placeholder = placeholder;
}

- (void)setTextFieldBgColor:(UIColor *)textFieldBgColor
{
//    self.bgView.backgroundColor = textFieldBgColor;
//    self.textField.backgroundColor = textFieldBgColor;
}

#pragma mark - set get
- (UIView *)bgView
{
    if (!_bgView) {
//        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UITextField *)textField
{
    if (!_textField) {
//        _textField = [[UITextField alloc] initWithFrame:CGRectMake(self.height/2, 0, self.width, self.height)];
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor whiteColor];
    }
    return _textField;
}

@end
