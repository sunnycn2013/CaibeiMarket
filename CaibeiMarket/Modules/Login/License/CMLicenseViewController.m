//
//  CMLicenseViewController.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/10/30.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMLicenseViewController.h"

@interface CMLicenseViewController ()<UIWebViewDelegate>

@property (nonatomic,strong)UIWebView    * webView;

@end

@implementation CMLicenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
//    NSURL * url = [NSURL fileURLWithPath:path];
    NSURL * url = [NSURL URLWithString:@"http://www.icaibei.com/about/web01/index.html"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL * url = [NSURL fileURLWithPath:path];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
        _webView.delegate = self;
        _webView.scalesPageToFit = YES;
    }
    return _webView;
}
@end
