//
//  CMShareManager.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/18.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMShareManager : NSObject

//+ (void)shareInfo:(NSDictionary *)params;
+ (void)shareView:(UIView *)view info:(NSDictionary *)params;

@end
