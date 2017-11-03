//
//  CMRegistViewController.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMPersonInfoSetingViewController.h"

@interface CMRegistViewController : RootViewController

@property (nonatomic ,assign)CMRegistActionType registType;

- (instancetype)initWithActionType:(CMRegistActionType)type;

@end
