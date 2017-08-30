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
    self.showRoundedCorner = YES;;
    self.clipsToBounds = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat top = kIPhone6Scale(5);
    CGFloat height = self.height - kIPhone6Scale(10);

    [self.bgView setFrame:CGRectMake(0, top, self.width, height)];
    [self.textField setFrame:CGRectMake(self.height/2, top, self.width - height, height)];
}

#pragma mark - public
- (void)setPlaceholder:(NSString *)placeholder
{
    _textField.placeholder = placeholder;
}

- (void)setTextFieldBgColor:(UIColor *)textFieldBgColor
{
//    self.bgView.backgroundColor = textFieldBgColor;
//    self.textField.backgroundColor = textFieldBgColor;
}

- (void)setShowRoundedCorner:(BOOL)showRoundedCorner
{
    if (showRoundedCorner) {
        self.layer.cornerRadius = self.height/2;
    }else{
        self.layer.cornerRadius = 0;
    }
    _showRoundedCorner = showRoundedCorner;
}

- (void)setFontSize:(CGFloat)fontSize
{
    self.textField.font = [UIFont systemFontOfSize:fontSize];
    _fontSize = fontSize;
}

- (NSString *)text
{
    return self.textField.text;
}

- (void)setSecureTextEntry:(BOOL)secureTextEntry
{
    _textField.secureTextEntry = secureTextEntry;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [self.delegate textFieldShouldBeginEditing:textField];
    }
    return YES;

}
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
//- (void)textFieldDidEndEditing:(UITextField *)textField;
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[AppDelegate shareAppDelegate].window endEditing:YES];
    if ([self.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [self.delegate textFieldShouldReturn:textField];
    }
    return YES;
}

#pragma mark - set get
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.font = [UIFont systemFontOfSize:kIPhone6Scale(14)];
//        _textField.backgroundColor = [UIColor redColor];
    }
    return _textField;
}

@end
