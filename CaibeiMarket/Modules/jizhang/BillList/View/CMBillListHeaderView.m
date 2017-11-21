//
//  CMBillListHeaderView.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBillListHeaderView.h"

@interface CMBillListHeaderView()

@property (nonatomic,strong)UILabel * noteLable;
@end

@implementation CMBillListHeaderView

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
    [self addSubview:self.noteLable];
}

- (UILabel *)noteLable
{
    if (!_noteLable) {
        _noteLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 30)];
        _noteLable.font = [UIFont systemFontOfSize:14];
        _noteLable.text = @"待还项目";
        _noteLable.textColor = [UIColor grayColor];
    }
    return _noteLable;
}
@end
