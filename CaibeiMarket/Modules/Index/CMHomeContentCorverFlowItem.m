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

- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
        _numberLabel.text = @"28";
        _numberLabel.layer.cornerRadius = 22.5;
        _numberLabel.layer.masksToBounds = YES;
        _numberLabel.layer.borderWidth = 0.5;
        _numberLabel.layer.borderColor = CMThemeColor.CGColor;
        _numberLabel.backgroundColor = [UIColor whiteColor];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.textColor = CMThemeColor;
    }
    return _numberLabel;
}

@end
