//
//  AppManager.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/21.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "AppManager.h"
#import "AdPageView.h"
#import "RootWebViewController.h"
#import "LoginViewController.h"
#import "YYFPSLabel.h"

@implementation AppManager


+(void)appStart{
    //加载广告
    AdPageView *adView = [[AdPageView alloc] initWithFrame:kScreen_Bounds withTapBlock:^{
//        RootWebViewController * viewController = [[RootWebViewController alloc] initWithUrl:@"http://www.hao123.com"];
//        UITabBarController * tabBarViewController = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
//        if ([tabBarViewController isKindOfClass:[UITabBarController class]]) {
//            [(UINavigationController *)tabBarViewController.selectedViewController pushViewController:viewController animated:YES];
//        }
    }];
    adView = adView;
}
#pragma mark ————— FPS 监测 —————
+(void)showFPS{
#ifdef DEBUG
    YYFPSLabel *_fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = KScreenHeight - 55;
    _fpsLabel.right = KScreenWidth - 10;
    //    _fpsLabel.alpha = 0;
    [kAppWindow addSubview:_fpsLabel];
#endif
}

@end
