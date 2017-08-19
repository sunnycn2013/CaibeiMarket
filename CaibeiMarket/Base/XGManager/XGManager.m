//
//  XGManager.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/19.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "XGManager.h"
#import <QQ_XGPush/XGPush.h>
#import <QQ_XGPush/XGSetting.h>

#define XGAppID  2200265349
#define XGAppKey @"IMN94E2Z97EL"

@implementation XGManager

+ (void)initXG
{
    //打开debug开关
    XGSetting *setting = [XGSetting getInstance];
#ifdef DEBUG
    [setting enableDebug:YES];
#endif
    //查看debug开关是否打开
    [XGPush startApp:XGAppID appKey:XGAppKey];
}

+ (void)registerAPNSToken:(NSData *)deviceToken
{
    NSString *deviceTokenStr = [XGPush registerDevice:deviceToken
                                              account:nil
                                      successCallback:^{
                                          DLog(@"[XGPush Demo] register push success");
                                      } errorCallback:^{
                                          DLog(@"[XGPush Demo] register push error");
                                      }];
    DLog(@"[XGPush Demo] device token is %@", deviceTokenStr);
}

+ (void)setTag:(NSString *)tag
{
    [XGPush setTag:@"myTag" successCallback:^{
        DLog(@"[XGDemo] Set tag success");
    } errorCallback:^{
        DLog(@"[XGDemo] Set tag error");
    }];
}

+ (void)delTag:(NSString *)tag
{
    [XGPush delTag:@"myTag" successCallback:^{
        DLog(@"[XGDemo] Del tag success");
    } errorCallback:^{
        DLog(@"[XGDemo] Del tag error");
    }];
}

+ (void)setAccount:(NSString *)account
{
    [XGPush setAccount:@"myAccount" successCallback:^{
        DLog(@"[XGDemo] Set account success");
    } errorCallback:^{
        DLog(@"[XGDemo] Set account error");
    }];
}

+ (void)delAccount
{
    [XGPush delAccount:^{
        DLog(@"[XGDemo] Del account success");
    } errorCallback:^{
        DLog(@"[XGDemo] Del account error");
    }];
}

+ (void)unRegisterDevice
{
    [XGPush unRegisterDevice:^{
        DLog(@"[XGDemo] unregister success");
    } errorCallback:^{
        DLog(@"[XGDemo] unregister error");
    }];
}

//统计打开
+ (void)handleLaunching:(NSDictionary *)launchOptions
{
    [XGPush handleLaunching:launchOptions successCallback:^{
        DLog(@"[XGDemo] Handle launching success");
    } errorCallback:^{
        DLog(@"[XGDemo] Handle launching error");
    }];
}

//统计点击
+ (void)handleReceiveNotification:(NSDictionary *)userInfo
{
    DLog(@"[XGPush Demo] receive Notification");
    [XGPush handleReceiveNotification:userInfo
                      successCallback:^{
                          DLog(@"[XGDemo] Handle receive success");
                      } errorCallback:^{
                          DLog(@"[XGDemo] Handle receive error");
                      }];
}

//ios 10
+ (void)handleReceiveNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
{
    [XGPush handleReceiveNotification:userInfo
                      successCallback:^{
                          DLog(@"[XGDemo] Handle receive success");
                      } errorCallback:^{
                          DLog(@"[XGDemo] Handle receive error");
                      }];
    
    completionHandler();
}
@end
