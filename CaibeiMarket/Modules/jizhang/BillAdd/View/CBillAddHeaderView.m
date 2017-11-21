//
//  CBillAddHeaderView.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/17.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CBillAddHeaderView.h"

@interface CBillAddHeaderView ()

@property (nonatomic,strong)UISegmentedControl * segmentControl;

@end

@implementation CBillAddHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    [self addSubview:self.segmentControl];
}

- (UISegmentedControl *)segmentControl
{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"一般贷款",@"消费分期",@"房贷"]];
        _segmentControl.centerX = self.centerX;
    }
    return _segmentControl;
}
@end
