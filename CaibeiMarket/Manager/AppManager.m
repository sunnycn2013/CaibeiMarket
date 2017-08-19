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
        RootWebViewController * viewController = [[RootWebViewController alloc] initWithUrl:@"http://www.hao123.com"];
        viewController.showSingleBackButtom = YES;
        RootNavigationController *loginNavi =[[RootNavigationController alloc] initWithRootViewController:viewController];
        [kRootViewController presentViewController:loginNavi animated:YES completion:nil];
    }];
    adView = adView;
}
#pragma mark ————— FPS 监测 —————
+(void)showFPS{
    YYFPSLabel *_fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = KScreenHeight - 55;
    _fpsLabel.right = KScreenWidth - 10;
    //    _fpsLabel.alpha = 0;
    [kAppWindow addSubview:_fpsLabel];
}

@end
