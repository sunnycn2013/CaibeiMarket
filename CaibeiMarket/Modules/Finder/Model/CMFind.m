//
//  CMFind.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/10/29.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFind.h"
#import "CMFindItem.h"

NSString * CMHomeActionTypeCredit = @"credit";
NSString * CMHomeActionTypeSafe = @"safe";
NSString * CMHomeActionTypeJiZhang = @"jizhang";

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

//- (void)mj_keyValuesDidFinishConvertingToObject
//{
//    NSMutableArray * array = [NSMutableArray array];
//    CMFindItem * wareInfo = [[CMFindItem alloc] init];
//    wareInfo.pattern = @"jizhang";
//    [array addObject:wareInfo];
//    [array addObjectsFromArray:self.listData];
//
//    self.listData = [array copy];
//    NSLog(@"aa");
//}

- (NSInteger)numberOfSections
{
    return self.listData.count;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    CMFindItem * item = [self.listData objectAtIndex:section];
    return [item itemCount];
}

- (NSString *)floorIdentifierAtIndexPath:(NSIndexPath *)indexPath
{
    CMFindItem * item = [self.listData objectAtIndex:indexPath.section];
    return item.pattern;
}

- (id)floorModelAtIndexPath:(NSIndexPath *)indexPath
{
    id<CMFindDataProtocol> item = [self.listData objectAtIndex:indexPath.section];
    return [item floorModelAtIndex:indexPath.row];
}

@end
