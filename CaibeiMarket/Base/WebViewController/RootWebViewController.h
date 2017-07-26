//
//  RootWebViewController.h
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "RootViewController.h"
//#import "RxWebViewController.h"
/**
 WebView 基类
 */
@interface RootWebViewController : RootViewController
/**
 *  origin url
 */
@property (nonatomic)NSString* url;

/**
 *  embed webView
 */
//@property (nonatomic)UIWebView* webView;

/**
 *  tint color of progress view
 */
@property (nonatomic)UIColor* progressViewColor;

/**
 *  get instance with url
 *
 *  @param url url
 *
 *  @return instance
 */
-(instancetype)initWithUrl:(NSString *)url;


-(void)reloadWebView;


@end
