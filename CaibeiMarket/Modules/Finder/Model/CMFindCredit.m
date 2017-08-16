//
//  CMFindCredit.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFindCredit.h"

@implementation CMFindCreditCard


@end

@implementation CMFindCreditItem

@end

@implementation CMFindCredit

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"listData" : @"CMFindCreditCard"
             };
}

- (void)mj_keyValuesDidFinishConvertingToObject
{
    self.listCreditData = [NSMutableArray array];
    NSInteger count = (NSInteger)(self.listData.count / 2);
    for (int i =0; i< count; i++) {
        CMFindCreditItem * item = [[CMFindCreditItem alloc] init];
        item.leftItem = [self.listData objectAtIndex:i];
        item.rightItem = [self.listData objectAtIndex:i+1];
        [self.listCreditData addObject:item];
    }
}
@end
