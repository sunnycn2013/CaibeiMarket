//
//  AppDelegate.m
//  CaibeiMarket
//
//  Created by ccguo on 2017/7/19.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "AppDelegate.h"
#import "XGManager.h"
#import "MTAManager.h"
#import "BuglyManager.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <UISplitViewControllerDelegate,UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //初始化window
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    [XGManager initXG];
    [XGManager handleLaunching:launchOptions];
    [BuglyManager initBugly];
    [MTAManager initMTA];
    [MTAManager trackCustomEvent:@"icaibei_start_ios" args:@[@""]];

    [self initWindow];
    
    //UMeng初始化
    [self initUMeng];

    //初始化app服务
    [self initService];
    
    //初始化用户系统
    [self initUserManager];
    
    //网络监听
    [self monitorNetworkStatus];
    
    //广告页
    [AppManager appStart];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [XGManager registerAPNSToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [XGManager handleReceiveNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler
{
    [XGManager handleLaunching:response.notification.request.content.userInfo];
    completionHandler();
}

@end
