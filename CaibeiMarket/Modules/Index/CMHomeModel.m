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

NSString * CMHomeActionTypeBanner = @"home_banner";
NSString * CMHomeActionTypeApp = @"home_app";
NSString * CMHomeActionTypeContent = @"home_content";

@implementation CMHomeInfo

- (void)mj_keyValuesDidFinishConvertingToObject
{
    self.servicePersonTime = [self formattingByString:self.servicePersonTime];
    self.totalLendMoney = [self formattingByString:self.totalLendMoney];

}

- (NSString *)formattingByString:(NSString *)string
{
    NSInteger length = string.length;
    NSInteger totoalMoneyCount = string.length / 3;
    NSInteger lastMoneyCount = string.length % 3;
    
    NSMutableString * contentStr = [NSMutableString string];
    for (int i=0; i<totoalMoneyCount; i++) {
        [contentStr appendString:[string substringWithRange:NSMakeRange(3 * i, 3)]];
        [contentStr appendString:@","];
    }
    if (string.length > 3) {
        [contentStr appendString:[string substringWithRange:NSMakeRange(length - lastMoneyCount, lastMoneyCount)]];
    }
    return [contentStr copy];
}
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
    banner.actionType = CMHomeActionTypeBanner;
    CMHomeApp * app = [CMHomeApp new];
    app.actionType = CMHomeActionTypeApp;
    
    CMHomeContent  * content = [CMHomeContent new];
    content.actionType = CMHomeActionTypeContent;
    
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
    [self.homeModels addObject:_homeInfo];

}
@end
