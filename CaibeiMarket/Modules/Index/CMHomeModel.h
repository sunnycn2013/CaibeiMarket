//
//  CMHomeModel.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/21.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMHomeDataProtocol.h"


extern NSString * CMHomeActionTypeBanner;
extern NSString * CMHomeActionTypeApp;
extern NSString * CMHomeActionTypeContent;

@interface CMHomeInfo : NSObject

@property (nonatomic,strong)NSString * createDate;
@property (nonatomic,strong)NSString * lendMoney;
@property (nonatomic,strong)NSString * phone;
@property (nonatomic,strong)NSString * servicePersonTime;
@property (nonatomic,strong)NSString * totalLendMoney;

@end

@interface CMHomeModel : NSObject

@property (nonatomic,strong)NSString * message;

@property (nonatomic,strong)NSMutableArray * homeModels;

@property (nonatomic,strong)NSArray * properties;

@property (nonatomic,strong)NSNumber * resultCode;

@property (nonatomic,strong)CMHomeInfo * homeInfo;

@end


/*
 message = "\U64cd\U4f5c\U6210\U529f";
 properties =     (
 {
 createDate = 1501840949000;
 lendMoney = 2000;
 phone = "1****85858";
 servicePersonTime = 18;
 totalLendMoney = 25000;
 }
 );
 resultCode = 0000;
 */
