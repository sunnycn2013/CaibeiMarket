//
//  CMHomeContentCorverFlowItem.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/1.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeContentCorverFlowItem.h"

@interface CMHomeContentCorverFlowItem ()

@property (nonatomic,strong)UILabel * numberLabel;

@end

@implementation CMHomeContentCorverFlowItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self addSubview:self.numberLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.numberLabel.centerX = self.centerX;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
        _numberLabel.text = @"28";
        _numberLabel.layer.cornerRadius = 22.5;
        _numberLabel.layer.masksToBounds = YES;
        _numberLabel.backgroundColor = [UIColor purpleColor];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _numberLabel;
}

@end
