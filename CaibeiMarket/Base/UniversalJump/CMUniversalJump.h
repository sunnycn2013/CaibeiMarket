//
//  CMUniversalJump.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/16.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMUniversalJumpDefine.h"

@interface CMUniversalJump : NSObject

SINGLETON_FOR_HEADER(CMUniversalJump)

+ (void)openURL:(NSString *)url;

- (void)natvigationTo:(NSString *)url params:(NSDictionary *)parameters;

- (void)presentTo:(NSString *)url params:(NSDictionary *)parameters;

- (UINavigationController *)navigationController;

- (UIViewController *)currentViewController;

@end
