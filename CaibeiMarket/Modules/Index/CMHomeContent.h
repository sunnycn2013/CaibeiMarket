//
//  CMHomeContent.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMHomeDataProtocol.h"

@interface CMHomeContent : NSObject<CMHomeDataProtocol>

@property (nonatomic,strong)NSString * actionType;

@property (nonatomic,strong)NSString * totalMoney;

@property (nonatomic,strong)NSString * time;

@end
