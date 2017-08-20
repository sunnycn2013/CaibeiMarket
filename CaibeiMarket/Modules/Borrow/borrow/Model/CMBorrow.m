//
//  CMBorrow.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrow.h"

@implementation CMBorrowCrads

@end

@implementation CMBorrow

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"listData" : @"CMBorrowCrads"
             };
}

- (void)mj_keyValuesDidFinishConvertingToObject
{
    NSInteger count = (self.listData.count > 3) ? 3 : self.listData.count;
    for (int i = 0; i< count; i++) {
        CMBorrowCrads * card = [self.listData objectAtIndex:i];
        card.showStar = YES;
    }
}
@end
