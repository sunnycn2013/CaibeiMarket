//
//  CMFind.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/10/29.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFind.h"

NSString * CMHomeActionTypeCredit = @"credit";
NSString * CMHomeActionTypeSafe = @"safe";

@implementation CMFind

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"listData" : @"CMFindItem"
             };
}

- (NSInteger)numberOfRowsInFloor
{
    return self.listData.count;
}

@end
