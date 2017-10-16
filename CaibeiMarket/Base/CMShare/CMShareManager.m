//
//  CMShareManager.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/18.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMShareManager.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import "MOBShareSDKHelper.h"
#import <ShareSDK/ShareSDK+Base.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

@implementation CMShareManager

+ (void)shareView:(UIView *)view info:(NSDictionary *)params
{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    
    NSString * title = params[@"title"] ? : @"采贝";
    NSString * des = params[@"description"] ? : @"采贝借款";
    NSString * url = params[@"url"] ? : @"http://www.icaibei.com/";
    NSString * imageURL = params[@"imageUrl"] ? : @"";;
    NSArray* imageArray = @[(imageURL ? : @"icon_04")];

    [shareParams SSDKSetupShareParamsByText:des
                                     images:imageArray
                                        url:[NSURL URLWithString:url]
                                      title:title
                                       type:SSDKContentTypeWebPage];
    [ShareSDK showShareActionSheet:view
                             items:[MOBShareSDKHelper shareInstance].platforems
                       shareParams:shareParams
               onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                   
                   switch (state) {
                           
                       case SSDKResponseStateBegin:
                       {
                           //设置UI等操作
                           break;
                       }
                       case SSDKResponseStateSuccess:
                       {
                           //Instagram、Line等平台捕获不到分享成功或失败的状态，最合适的方式就是对这些平台区别对待
                           if (platformType == SSDKPlatformTypeInstagram)
                           {
                               break;
                           }
                           
                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                               message:nil
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"确定"
                                                                     otherButtonTitles:nil];
                           [alertView show];
                           break;
                       }
                       case SSDKResponseStateFail:
                       {
                           NSLog(@"%@",error);
                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                           message:[NSString stringWithFormat:@"%@",error]
                                                                          delegate:nil
                                                                 cancelButtonTitle:@"OK"
                                                                 otherButtonTitles:nil, nil];
                           [alert show];
                           break;
                       }
                       case SSDKResponseStateCancel:
                       {
                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享已取消"
                                                                               message:nil
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"确定"
                                                                     otherButtonTitles:nil];
                           [alertView show];
                           break;
                       }
                       default:
                           break;
                   }
               }];

}

@end
