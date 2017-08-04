//
//  CMBorrowConditionView.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowConditionView.h"
#import "CMBorrowConditionItem.h"
#import "UIColor+CMColor.h"

static NSInteger CMBorrowConditionNum = 4;

@implementation CMBorrowConditionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    CGFloat width  = KScreenWidth/CMBorrowConditionNum;
    CGFloat height = 46.0;
    NSArray * array = @[@"额度",@"期限",@"月利率",@"筛选"];
    
    for (int i = 0; i< CMBorrowConditionNum; i++) {
        CMBorrowConditionItem * item = [[CMBorrowConditionItem alloc] initWithFrame:CGRectMake(width * i, 0, width, height)];
        [item setConditionText:array[i]];
        [self addSubview:item];
    }
}

- (UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
