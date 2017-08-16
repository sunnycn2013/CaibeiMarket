//
//  CMHomeAppIcon.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMHomeApp.h"

@interface CMHomeAppIcon : UIView

@property (nonatomic,strong)CMHomeApp * data;

@property (nonatomic ,copy)void(^tapBlock)(id obj);

@property (nonatomic ,strong)id model;

@end
