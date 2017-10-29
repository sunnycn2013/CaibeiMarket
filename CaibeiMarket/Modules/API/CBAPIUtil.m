//
//  CBAPIUtil.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/10/26.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CBAPIUtil.h"

@implementation CBAPIUtil

+ (NSDictionary *)getAPIDataWith:(NSString *)file
{
    NSDictionary * params = nil;
    NSString * path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    NSString * string = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    if (string) {
        params = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        return params;
    }
    return nil;
}
@end
