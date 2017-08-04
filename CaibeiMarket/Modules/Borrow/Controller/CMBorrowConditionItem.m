//
//  CMBorrowConditionItem.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowConditionItem.h"

@interface CMBorrowConditionItem ()

@property (nonatomic,strong) UILabel * conditionTextLabel;
@property (nonatomic,strong) UIImageView * conditionHigh;
@property (nonatomic,strong) UIImageView * conditionLow;

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

- (void)setUI{
    [self addSubview:self.conditionTextLabel];
    [self addSubview:self.conditionHigh];
    [self addSubview:self.conditionLow];
}

- (void)setConditionText:(NSString *)conditionText
{
    _conditionTextLabel.text = conditionText;
}

#pragma mark -  set get
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
