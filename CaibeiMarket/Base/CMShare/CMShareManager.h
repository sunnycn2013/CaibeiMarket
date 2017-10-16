//
//  CMShareManager.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/18.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * CBShareTitle = @"title";
static NSString * CBShareDes = @"description";
static NSString * CBShareURL = @"url";
static NSString * CBShareImageURL = @"imageUrl";

@interface CMShareManager : NSObject

+ (void)shareView:(UIView *)view info:(NSDictionary *)params;

@end
