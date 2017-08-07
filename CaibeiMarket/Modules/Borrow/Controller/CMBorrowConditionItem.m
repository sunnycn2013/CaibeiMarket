//
//  CMBorrowConditionItem.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowConditionItem.h"

NSInteger CMBorrowConditionItemTag = 500;

@interface CMBorrowConditionItem ()

@property (nonatomic,strong) UILabel * conditionTextLabel;
@property (nonatomic,strong) UIImageView * conditionHigh;
@property (nonatomic,strong) UIImageView * conditionLow;

@property (nonatomic,strong) UITapGestureRecognizer * tapGesture;


@end

@implementation CMBorrowConditionItem

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
    [self addSubview:self.conditionTextLabel];
    [self addSubview:self.conditionHigh];
    [self addSubview:self.conditionLow];
    [self addGestureRecognizer:self.tapGesture];
}

- (void)setConditionText:(NSString *)conditionText
{
    _conditionTextLabel.text = conditionText;
}

- (void)tapGestureAction:(UITapGestureRecognizer *)gesture
{
    NSInteger index = gesture.view.tag - CMBorrowConditionItemTag;
    if ([self.delegate respondsToSelector:@selector(borrowConditionItem:selectedAtIndex:)]) {
        [self.delegate borrowConditionItem:self selectedAtIndex:index];
    }
}

#pragma mark -  set get
- (UITapGestureRecognizer *)tapGesture
{
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    }
    return _tapGesture;
}

- (UILabel *)conditionTextLabel
{
    if (!_conditionTextLabel) {
        CGFloat width = self.width;
        _conditionTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, width * 0.6, 30)];
        _conditionTextLabel.text = @"额度";
        _conditionTextLabel.font = [UIFont systemFontOfSize:14];
        _conditionTextLabel.textColor = [UIColor lightGrayColor];
        _conditionTextLabel.textAlignment = NSTextAlignmentRight;
    }
    return _conditionTextLabel;
}

- (UIImageView *)conditionHigh
{
    if (!_conditionHigh) {
        _conditionHigh = [[UIImageView alloc] initWithFrame:CGRectMake(_conditionTextLabel.right, _conditionTextLabel.top+10, 6, 4)];
        _conditionHigh.image = [UIImage imageNamed:@"condition_light_high"];
    }
    return _conditionHigh;
}

- (UIImageView *)conditionLow
{
    if (!_conditionLow) {
        _conditionLow = [[UIImageView alloc] initWithFrame:CGRectMake(_conditionTextLabel.right, _conditionHigh.bottom + 3, 6, 4)];
        _conditionLow.image = [UIImage imageNamed:@"condition_light_low"];
    }
    return _conditionLow;
}
@end
