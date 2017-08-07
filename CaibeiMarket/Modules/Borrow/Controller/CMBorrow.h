//
//  CMBorrow.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMBorrow : NSObject

@property (nonatomic,strong)NSString * image;
@property (nonatomic,strong)NSString * companyName;
@property (nonatomic,strong)NSString * applyNum;
@property (nonatomic,strong)NSString * descriptionInfo;

@property (nonatomic,strong)NSString * borrowLines; //额度
@property (nonatomic,strong)NSNumber * isCashBorrow;
@property (nonatomic,strong)NSNumber * isCreditBorrow;
@property (nonatomic,strong)NSNumber * isPromotion;

@end
