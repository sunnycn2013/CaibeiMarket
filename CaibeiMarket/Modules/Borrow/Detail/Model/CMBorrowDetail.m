//
//  CMBorrowDetail.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowDetail.h"

@implementation CMBorrowProduct

- (NSString *)monthlyInterestRate
{
    NSString * des = @"%";
    NSString * content = [NSString stringWithFormat:@"%@",_monthlyInterestRate];
    NSString * string = [NSString stringWithFormat:@"%@%@/月",content,des];
    return string;
}

@end

@implementation CMBorrowDetail
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"properties" : @"CMBorrowProduct"
             };
}


@end
