//
//  MTAManager.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/19.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTA.h"
#import "MTAConfig.h"
#import "MTADefine.h"

@interface MTAManager : NSObject

+ (void)initMTA;

/**
 页面进入

 @param page pageName
 */
+(void) trackPageViewBegin:(NSString*) page;

/**
 页面离开

 @param page pageName
 */
+(void) trackPageViewEnd:(NSString*) page;

/**
 上报异常code

 @param exception code
 @return code
 */
+ (MTAErrorCode)trackException:(NSException *)exception;

#pragma mark - -----【次数统计】----
/**
 【次数统计】Key-Value参数的事件
 @param event_id key
 @param kvs des
 */
+ (void) trackCustomKeyValueEvent:(NSString*)event_id props:( NSDictionary *) kvs;

/**
 【次数统计】字符串参数的事件

 @param event_id event_id description
 @param array array description
 */
+ (void) trackCustomEvent:(NSString*)event_id args:(NSArray*) array;

#pragma mark - -----【时长统计】----
/**
 时长统计】的Key-Value参数的事件
 可以指定事件的开始和结束时间，来上报一个带有统计时长的事件。
 
 @param event_id event_id description
 @param kvs kvs description
 */
+ (void) trackCustomKeyValueEventBegin:(NSString*)event_id props:( NSDictionary *) kvs;
+ (void) trackCustomKeyValueEventEnd:(NSString*)event_id props:( NSDictionary *) kvs;

/**
 【时长统计】字符串参数的事件
 可以指定事件的开始和结束时间，来上报一个带有统计时长的事件

 @param event_id event_id description
 @param array array description
 */
+ (void) trackCustomEventBegin:(NSString*)event_id args:(NSArray*) array;
+ (void) trackCustomEventEnd:(NSString*)event_id args:(NSArray*) array;

#pragma mark - -----【接口监控】----
+ (void)reportAppMonitorStat: (MTAAppMonitorStat *)stat;
@end

/*
 
 -(void) viewDidAppear:(BOOL)animated
 {
 NSString* page = @"Page1";
 [MTA trackPageViewBegin:page];
 }
 
 -(void) viewWillDisappear:(BOOL)animated
 {
 NSString* page = @"Page1";
 [MTA trackPageViewEnd:page];
 }
 
 NSDictionary* kvs=[NSDictionary  dictionaryWithObject:@"Value" forKey:@"Key"]；
 [MTA trackCustomKeyValueEvent:@"KVEvent" props:kvs];
 
 [MTA trackCustomEvent:@"NormalEvent" args:[NSArray arrayWithObject:@"arg0"]];

 
 -(IBAction) clickStartButton:(id)sender{
 NSDictionary* kvs = [NSDictionary dictionaryWithObject:@"Value" forKey:@"TimeKey"];
 [MTA trackCustomKeyValueEventBegin :@"KVEvent" props:kvs];……
 }
 -(IBAction) clickEndButton:(id)sender{
 NSDictionary* kvs = [NSDictionary dictionaryWithObject:@"Value" forKey:@"TimeKey"];
 [MTA trackCustomKeyValueEventEnd :@"KVEvent" props:kvs];
 ……
 }
 
 -(IBAction) clickStartButton:(id)sender{
 [MTA trackCustomEventBegin:@"TimeEvent" args:nil];
 ……
 }
 -(IBAction) clickEndButton:(id)sender{
 [MTA trackCustomEventEnd:@"TimeEvent" args:nil];
 ……
 }
 */
