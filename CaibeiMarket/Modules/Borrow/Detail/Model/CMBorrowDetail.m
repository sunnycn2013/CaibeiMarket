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
//    NSString * des = @"%";
    NSString * content = [NSString stringWithFormat:@"%@",_monthlyInterestRate];
    NSString * string = [NSString stringWithFormat:@"%@",content];
    return string;
}

- (NSString *)throughputRate
{
    NSString * string = [NSString stringWithFormat:@"%@",_throughputRate];
    return string;
}

- (NSNumber *)loanTime
{
    return _loanTime ? : @(1000);
}
    
- (NSNumber *)totalApply
{
    return _totalApply ? : @(1000);
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
