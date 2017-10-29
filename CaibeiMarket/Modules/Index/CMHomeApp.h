//
//  CMHomeApp.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMHomeDataProtocol.h"

@interface CMHomeApp : NSObject<CMHomeDataProtocol>

@property (nonatomic,strong)NSString * img;
@property (nonatomic,strong)NSString * url;
@property (nonatomic,strong)NSString * title;

@end
