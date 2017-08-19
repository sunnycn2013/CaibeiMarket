//
//  XGManager.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/19.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XGManager : NSObject

+ (void)initXG;

+ (void)registerAPNSToken:(NSData *)deviceToken;
+ (void)setTag:(NSString *)tag;
+ (void)delTag:(NSString *)tag;
+ (void)setAccount:(NSString *)account;
+ (void)delAccount;
+ (void)unRegisterDevice;
+ (void)handleLaunching:(NSDictionary *)launchOptions;
+ (void)handleReceiveNotification:(NSDictionary *)userInfo;
+ (void)handleReceiveNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler;

@end
