//
//  CMBorrow.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrow.h"

@implementation CMBorrowCrads

- (void)mj_keyValuesDidFinishConvertingToObject
{
    
}

@end

@implementation CMBorrow

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
    NSString * path = [[NSBundle mainBundle] pathForResource:@"choose.json" ofType:nil];
    NSString * string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    if (string) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        self.borrowChoose = [CMBorrowChoose mj_objectWithKeyValues:dict];
        DLog(@"parise succes");
    }
}

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
        card.index = i;
    }
}

- (void)resetSearchConditions
{
    [self.borrowChoose resetSearchConditions];
}

- (NSDictionary *)searchConditions
{
    return [self.borrowChoose searchConditions];
}

- (void)updateCondition:(NSString *)value style:(CMBorrowChooseItemType)style
{
    [self.borrowChoose updateCondition:value style:style];
}

@end
