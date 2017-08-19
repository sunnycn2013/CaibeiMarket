//
//  MTAManager.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/19.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "MTAManager.h"
#import "MTA.h"
#import "MTAConfig.h"

#define MTA_App_Key @"IM57U5LLZ1BJ"

@implementation MTAManager

+ (void)initMTA
{
//    [MTA startWithAppkey:MTAKey];
    [MTA startWithAppkey:MTA_App_Key checkedSdkVersion:MTA_SDK_VERSION];
    [[MTAConfig getInstance] setReportStrategy:MTA_STRATEGY_INSTANT];
    [[MTAConfig getInstance] setSessionTimeoutSecs:60];
    [[MTAConfig getInstance] setAutoExceptionCaught:FALSE];
    
#ifdef DEBUG
    [[MTAConfig getInstance] setDebugEnable:YES];
#endif
}

+ (void)trackPageViewBegin:(NSString*) page
{
    [MTA trackPageViewBegin:page];
}

/**
 页面离开
 
 @param page pageName
 */
+ (void)trackPageViewEnd:(NSString*) page
{
    [MTA trackPageViewEnd:page];
}

/**
 上报异常code
 */
+ (MTAErrorCode)trackException:(NSException *)exception
{
    return [MTA trackException:exception];
}

/**
 【次数统计】Key-Value参数的事件
 */
+ (void)trackCustomKeyValueEvent:(NSString*)event_id props:( NSDictionary *) kvs
{
    [MTA trackCustomKeyValueEvent:event_id props:kvs];
}

/**
 【次数统计】字符串参数的事件
 */
+ (void)trackCustomEvent:(NSString*)event_id args:(NSArray*) array
{
    [MTA trackCustomEvent:event_id args:array];
}

/**
 时长统计】的Key-Value参数的事件
 可以指定事件的开始和结束时间，来上报一个带有统计时长的事件。
 */
+ (void)trackCustomKeyValueEventBegin:(NSString*)event_id props:( NSDictionary *) kvs
{
    [MTA trackCustomKeyValueEventBegin:event_id props:kvs];
}

+ (void)trackCustomKeyValueEventEnd:(NSString*)event_id props:( NSDictionary *) kvs
{
    [MTA trackCustomKeyValueEventEnd:event_id props:kvs];
}

/**
 【时长统计】字符串参数的事件
 可以指定事件的开始和结束时间，来上报一个带有统计时长的事件
 */
+ (void)trackCustomEventBegin:(NSString*)event_id args:(NSArray*) array
{
    [MTA trackCustomEventBegin:event_id args:array];
}

+ (void)trackCustomEventEnd:(NSString*)event_id args:(NSArray*) array
{
    [MTA trackCustomEventEnd:event_id args:array];
}

+ (void)reportAppMonitorStat:(MTAAppMonitorStat *)stat
{
    [MTA reportAppMonitorStat:stat];
}

@end
