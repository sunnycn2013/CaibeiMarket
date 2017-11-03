//
//  CMFindItem.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/10/29.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFindItem.h"
@implementation CMFindWare

- (CMJump *)jump
{
    CMJump * jp = [[CMJump alloc] init];
    jp.url = self.url;
    jp.type = @"h5";
    jp.title = self.title;
    return jp;
}

@end

@implementation CMFindItem
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"productList" : @"CMFindWare"
             };
}

- (NSInteger)itemCount
{
    if ([self.pattern isEqualToString:@"credit"]) {
        return self.secondList.count;
    }
    return self.productList.count;
}

- (void)mj_keyValuesDidFinishConvertingToObject
{
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0; i<= (NSInteger)self.productList.count/2; i++) {
        NSMutableArray * temp = [NSMutableArray array];
        CMFindWare * firstItem = [self.productList objectAtIndex:i];
        CMFindWare * secondItem = [self.productList objectAtIndex:i+1];
        [temp addObject:firstItem];
        [temp addObject:secondItem];
        [array addObject:temp];
    }
    self.secondList = array;
    DLog(@"aa");
}

- (NSInteger)numberOfRowsInFloor
{
    if ([self.pattern isEqualToString:@"credit"]) {
        return self.secondList.count;
    }
    return self.productList.count;
}

- (id)floorModelAtIndex:(NSInteger)index
{
    if ([self.pattern isEqualToString:@"credit"]) {
        return [self.secondList objectAtIndex:index];
    }
    return [self.productList objectAtIndex:index];
}
@end
