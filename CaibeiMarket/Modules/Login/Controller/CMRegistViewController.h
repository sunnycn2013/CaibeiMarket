//
//  CMRegistViewController.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,CMRegistActionType) {
    CMRegistActionTypeRegist = 2,
    CMRegistActionTypeResetPwd = 3
};

@interface CMRegistViewController : RootViewController

@property (nonatomic ,assign)CMRegistActionType registType;

- (instancetype)initWithActionType:(CMRegistActionType)type;

@end
