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

NSString * CMHomeActionTypeBanner = @"banner";
NSString * CMHomeActionTypeApp = @"entrance";
NSString * CMHomeActionTypeContent = @"product";
NSString * CMHomeActionTypeContentNone = @"productNone";
NSString * CMHomeActionTypeContent1_3 = @"product1_3";

NSString * CMHomeActionTypeSeperate = @"Seperate";

@implementation CMHomeInfo

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"bannerList" : @"CMHomeBanner",
             @"entranceList" : @"CMHomeApp",
             };
}

- (CGFloat)heightForRowCell
{

    
    if ([self.pattern isEqualToString:@"banner"]) {
        return kIPhone6Scale(194);
    }else if ([self.pattern isEqualToString:@"entrance"])
    {
        NSInteger row = (NSInteger)self.entranceList.count/5;
        row = 1;
        if (row == 2) {
            return kIPhone6Scale(95.0*2);
        }
        return (105.0);
    }else if ([self.pattern isEqualToString:@"product"])
    {
//        CGSize titleSize = [self.title sizeForFont:[UIFont boldSystemFontOfSize:(15)] size:CGSizeMake(kIPhone6PScale(230), 50) mode:NSLineBreakByWordWrapping];
//        CGFloat height = (titleSize.height > 50) ? 50 : titleSize.height;
        return 114.0;
    }else if ([self.pattern isEqualToString:@"productNone"])
    {
//        CGSize titleSize = [self.title sizeForFont:[UIFont boldSystemFontOfSize:(15)] size:CGSizeMake(kIPhone6PScale(230), 50) mode:NSLineBreakByWordWrapping];
//        CGFloat height = (titleSize.height > 50) ? 50 : titleSize.height;
        return 100.0;
    }else if ([self.pattern isEqualToString:@"product1_3"])
    {
//        CGSize titleSize = [self.title sizeForFont:[UIFont boldSystemFontOfSize:(15)] size:CGSizeMake(kIPhone6PScale(230), 50) mode:NSLineBreakByWordWrapping];
//        CGFloat height = (titleSize.height > 50) ? 50 : titleSize.height;
        return 189.0;
    }else if ([self.pattern isEqualToString:@"Seperate"])
    {
        return 4.0;
    }
    return kIPhone6Scale(0.0);
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

- (CMJump *)jump
{
    CMJump * jp = [[CMJump alloc] init];
    jp.url = self.url;
    jp.type = @"h5";
    jp.title = self.title;
    return jp;
}
@end

@implementation CMHomeModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"listData" : @"CMHomeInfo"
             };
}

- (void)mj_keyValuesDidFinishConvertingToObject
{
    CMHomeInfo * sep = [CMHomeInfo new];
    sep.pattern = @"Seperate";
    NSMutableArray * temArray = [NSMutableArray arrayWithArray:self.listData];
    if (temArray.count >=2) {
        [temArray insertObject:sep atIndex:2];
    }
   
    self.listData = temArray;
}

- (NSString *)getModelWithPattern:(NSString *)pattern
{
    if ([pattern isEqualToString:CMHomeActionTypeBanner]) {
        return @"CMHomeInfo";
    }
    if ([pattern isEqualToString:CMHomeActionTypeApp]) {
        return @"CMHomeInfo";
    }
    if ([pattern isEqualToString:CMHomeActionTypeContent]) {
        return @"CMHomeInfo";
    }
    if ([pattern isEqualToString:CMHomeActionTypeContentNone]) {
        return @"CMHomeInfo";
    }
    if ([pattern isEqualToString:CMHomeActionTypeContent1_3]) {
        return @"CMHomeInfo";
    }
    return nil;
}

@end
