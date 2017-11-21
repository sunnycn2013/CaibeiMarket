//
//  CMFindNexNoteView.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/14.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFindNexNoteView.h"

@interface CMFindNexNoteView ()
//底部白色背景
@property (nonatomic,strong) UILabel     * nextMonthMoneyLabel;
@property (nonatomic,strong) UILabel     * nextMonthMoneyTagLabel;
@property (nonatomic,strong) CALayer     * centerYLayer;
@property (nonatomic,strong) UILabel     * nextMonthTimeLabel;
@property (nonatomic,strong) UILabel     * nextMonthTimeTagLabel;

@end


@implementation CMFindNexNoteView

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
    [self addSubview:self.nextMonthMoneyLabel];
    [self addSubview:self.nextMonthMoneyTagLabel];
    [self.layer addSublayer:self.centerYLayer];
    [self addSubview:self.nextMonthTimeLabel];
    [self addSubview:self.nextMonthTimeTagLabel];
    
//    self.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _centerYLayer.frame = CGRectMake(self.width/2, kIPhone6Scale(15), 1, kIPhone6Scale(46));

}

- (UILabel *)nextMonthMoneyLabel
{
    if (!_nextMonthMoneyLabel) {
        _nextMonthMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6Scale(50), kIPhone6Scale(20), kIPhone6Scale(100), kIPhone6Scale(20))];
        _nextMonthMoneyLabel.textAlignment = NSTextAlignmentCenter;
        _nextMonthMoneyLabel.font = [UIFont systemFontOfSize:20];
        _nextMonthMoneyLabel.textColor = [UIColor blueColor];
        _nextMonthMoneyLabel.text = @"1080.0";
//        _nextMonthMoneyLabel.backgroundColor = [UIColor redColor];
    }
    return _nextMonthMoneyLabel;
}

- (UILabel *)nextMonthMoneyTagLabel
{
    if (!_nextMonthMoneyTagLabel) {
        _nextMonthMoneyTagLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nextMonthMoneyLabel.left, _nextMonthMoneyLabel.bottom, kIPhone6Scale(100), kIPhone6Scale(20))];
        _nextMonthMoneyTagLabel.textAlignment = NSTextAlignmentCenter;
        _nextMonthMoneyTagLabel.font = [UIFont systemFontOfSize:14];
        _nextMonthMoneyTagLabel.textColor = [UIColor lightGrayColor];
        _nextMonthMoneyTagLabel.text = @"下月应还";
//        _nextMonthMoneyTagLabel.backgroundColor = [UIColor redColor];
    }
    return _nextMonthMoneyTagLabel;
}

- (CALayer *)centerYLayer
{
    if (!_centerYLayer) {
        _centerYLayer = [[CALayer alloc] init];
        _centerYLayer.frame = CGRectMake(kIPhone6Scale(163), kIPhone6Scale(15), 1, kIPhone6Scale(46));
        _centerYLayer.centerX = self.centerX;
        _centerYLayer.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"].CGColor;
//        _centerYLayer.backgroundColor = [UIColor redColor].CGColor;
    }
    return _centerYLayer;
}

- (UILabel *)nextMonthTimeLabel
{
    if (!_nextMonthTimeLabel) {
        _nextMonthTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_centerYLayer.right + kIPhone6Scale(10), kIPhone6Scale(20), kIPhone6Scale(110), kIPhone6Scale(20))];
        _nextMonthTimeLabel.textAlignment = NSTextAlignmentCenter;
        _nextMonthTimeLabel.font = [UIFont systemFontOfSize:20];
        _nextMonthTimeLabel.textColor = [UIColor blackColor];
        _nextMonthTimeLabel.text = @"2017-10-1";
//        _nextMonthTimeLabel.backgroundColor = [UIColor redColor];
    }
    return _nextMonthTimeLabel;
}

- (UILabel *)nextMonthTimeTagLabel
{
    if (!_nextMonthTimeTagLabel) {
        _nextMonthTimeTagLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nextMonthTimeLabel.left,_nextMonthTimeLabel.bottom, kIPhone6Scale(110), kIPhone6Scale(20))];
        _nextMonthTimeTagLabel.textAlignment = NSTextAlignmentCenter;
        _nextMonthTimeTagLabel.font = [UIFont systemFontOfSize:14];
        _nextMonthTimeTagLabel.textColor = [UIColor lightGrayColor];
        _nextMonthTimeTagLabel.text = @"还款日期";
//        _nextMonthTimeTagLabel.backgroundColor = [UIColor redColor];

    }
    return _nextMonthTimeTagLabel;
}


@end
