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
@end
