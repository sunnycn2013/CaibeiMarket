//
//  CMUniversalJump.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/16.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMUniversalJump.h"
#import "LoginViewController.h"

@interface CMUniversalJump ()

//@property (nonatomic, strong) NSPointerArray * 

@property (nonatomic, strong) UINavigationController * navigationController;

@property (nonatomic, strong) UIViewController * currentController;

@end

@implementation CMUniversalJump

SINGLETON_FOR_CLASS(CMUniversalJump);

+ (void)openURL:(NSString *)url
{
    
}


- (void)natvigationTo:(NSString *)url params:(NSDictionary *)parameters
{
    UIViewController * viewController = nil;
    self.navigationController = [self navigationController];
    if ([url isEqualToString:CMUJmupLogin]) {
        viewController = [[RootViewController alloc] initWithParams:parameters];
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)presentTo:(NSString *)url params:(NSDictionary *)parameters
{
    UIViewController * viewController = nil;
    self.currentController = [self currentViewController];
    if ([url isEqualToString:CMUJmupLogin]) {
        viewController = [[LoginViewController alloc] initWithParams:parameters];
    }
    
    [self.currentController presentViewController:viewController animated:YES completion:nil];
}

- (UINavigationController *)navigationController
{
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController * tabBarViewController = appDelegate.window.rootViewController;
    UINavigationController * navigationController = nil;
    if([tabBarViewController isKindOfClass:[UITabBarController class]]){
        navigationController = [(UITabBarController *)tabBarViewController selectedViewController];
        return navigationController;
    }
    return nil;
}

- (UIViewController *)currentViewController
{
    UINavigationController * navigationController = [self navigationController];
    return (UIViewController *)[[navigationController viewControllers] lastObject];
}

@end
