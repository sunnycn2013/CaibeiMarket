//
//  CMMineHeaderView.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/27.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMMineHeaderView.h"

@interface CMMineHeaderView ()

@property (nonatomic,strong) UIView * picBgView;

@property (nonatomic,strong) UIImageView * picImageView;
@property (nonatomic,strong) UILabel * phoneNumLabel;
@property (nonatomic,strong) UILabel * desprictionLabel;
@property (nonatomic,strong) UIImageView * nextImageView;
@end

@implementation CMMineHeaderView

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
    self.backgroundColor = [UIColor colorWithHexString:@"#6F5CD5"];
    [self addSubview:self.picBgView];
    [self addSubview:self.picImageView];
    [self addSubview:self.phoneNumLabel];
    [self addSubview:self.desprictionLabel];
    [self addSubview:self.nextImageView];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taped:)];
    [self addGestureRecognizer:tap];
}

- (void)taped:(UITapGestureRecognizer *)gesture
{
    if ([self.delegate respondsToSelector:@selector(headerView:didTaped:)]) {
        [self.delegate headerView:self didTaped:nil];
    }
}

- (void)refreashData
{
    CMUserInfo * userInfo = [CMUserManager sharedInstance].curUserInfo;
    self.phoneNumLabel.text = userInfo.userName ? : @"点击登录";
}

#pragma mark -  set get
- (UIView *)picBgView
{
    if (!_picBgView) {
        _picBgView = [[UIView alloc] initWithFrame:CGRectMake(kIPhone6PScale(29), kIPhone6PScale(65), kIPhone6PScale(77), kIPhone6PScale(77))];
        _picBgView.layer.cornerRadius = kIPhone6PScale(77)/2;
        _picBgView.layer.masksToBounds = YES;
        _picBgView.backgroundColor = [UIColor whiteColor];
        _picBgView.alpha = 0.5;
    }
    return _picBgView;
}

- (UIImageView *)picImageView
{
    if (!_picImageView) {//79
        _picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kIPhone6PScale(31), kIPhone6PScale(67), kIPhone6PScale(73), kIPhone6PScale(73))];
        _picImageView.image = [UIImage imageNamed:@"touxiang"];
        _picImageView.layer.cornerRadius = 33.0;
        _picImageView.layer.masksToBounds = YES;
    }
    return _picImageView;
}

- (UILabel *)phoneNumLabel
{
    if (!_phoneNumLabel) {
        _phoneNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(_picImageView.right+16, 80, kIPhone6PScale(300), kIPhone6PScale(28))];
        _phoneNumLabel.text = @"立即登录";
        _phoneNumLabel.font = [UIFont systemFontOfSize:18];
        _phoneNumLabel.textColor = [UIColor whiteColor];
    }
    return _phoneNumLabel;
}

- (UILabel *)desprictionLabel
{
    if (!_desprictionLabel) {
        _desprictionLabel = [[UILabel alloc] initWithFrame:CGRectMake(_phoneNumLabel.left, _phoneNumLabel.bottom +5, _phoneNumLabel.width, kIPhone6PScale(25))];
        _desprictionLabel.text = @"资料未设置";
        _desprictionLabel.font = [UIFont systemFontOfSize:13];
        _desprictionLabel.textColor = [UIColor whiteColor];
    }
    return _desprictionLabel;
}

- (UIImageView *)nextImageView
{
    if (!_nextImageView) {
        _nextImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth - 42, _phoneNumLabel.top + 5, kIPhone6PScale(8), kIPhone6PScale(16))];
        _nextImageView.image = [UIImage imageNamed:@"next_light"];
    }
    return _nextImageView;
}

@end
