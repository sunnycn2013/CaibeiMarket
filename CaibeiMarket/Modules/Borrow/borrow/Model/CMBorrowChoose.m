//
//  CMBorrowChoose.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/11.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowChoose.h"

@implementation CMBorrowChooseItem


@end

@implementation CMBorrowChoose

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    CMBorrowChooseItem * item1 = [CMBorrowChooseItem new];
    item1.title = @"3个月";
    
    CMBorrowChooseItem * item2 = [CMBorrowChooseItem new];
    item2.title = @"6个月";
    
    CMBorrowChooseItem * item3 = [CMBorrowChooseItem new];
    item3.title = @"12个月";
    
    CMBorrowChooseItem * item4 = [CMBorrowChooseItem new];
    item4.title = @"24个月";
    
    self.conditions = @[item1,item2,item3,item4];
}
@end
