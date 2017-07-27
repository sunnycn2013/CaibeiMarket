//
//  CMMineHeaderView.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/27.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMMineHeaderView.h"

@interface CMMineHeaderView ()

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
    self.backgroundColor = CMThemeColor;
}
@end
