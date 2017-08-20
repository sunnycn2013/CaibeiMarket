//
//  CMHomeModel.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/21.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeModel.h"
#import "CMHomeBanner.h"
#import "CMHomeApp.h"
#import "CMHomeContent.h"

@implementation CMHomeInfo


@end

@implementation CMHomeModel

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
    CMHomeBanner * banner = [CMHomeBanner new];
    CMHomeApp * app = [CMHomeApp new];
    CMHomeContent  * content = [CMHomeContent new];
    
    self.homeModels = [NSMutableArray array];
    [self.homeModels addObject:banner];
    [self.homeModels addObject:app];
    [self.homeModels addObject:content];

}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"properties" : @"CMHomeInfo"
             };
}

- (void)mj_keyValuesDidFinishConvertingToObject
{
    self.homeInfo = self.properties.firstObject;
}
@end
