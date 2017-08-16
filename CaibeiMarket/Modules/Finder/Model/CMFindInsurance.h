//
//  CMFindInsurance.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMFindInsuranceCard : NSObject

@property (nonatomic,strong)NSString * identifier;
@property (nonatomic,strong)NSString * safeName;
@property (nonatomic,strong)NSString * safePicUrl;
@property (nonatomic,strong)NSString * safeSpecial;
@property (nonatomic,strong)NSString * safeUrl;

@end

@interface CMFindInsurance : NSObject

@property (nonatomic,strong)NSString * message;
@property (nonatomic,strong)NSNumber * pageCount;
@property (nonatomic,strong)NSNumber * pageNumber;

@property (nonatomic,strong)NSNumber * pageSize;
@property (nonatomic,strong)NSString * properties;

@property (nonatomic,strong)NSString * resultCode;
@property (nonatomic,strong)NSNumber * totalCount;
@property (nonatomic,strong)NSArray  * listData;
@end


/*
 listData =     (
 
 {
 identifier = abd5173a66f84c31b2004827c1d49818;
 safeName = "\U5e73\U5b89\U4eba\U5bff\U51fa\U884c\U610f\U5916\U9669";
 safePicUrl = "/screen/20170816_85.jpg";
 safeSpecial = "180\U5929100W\U7406\U8d54,\U98de\U673a\Uff0c\U706b\U8f66\Uff0c\U6c7d\U8f66\U3002";
 safeUrl = "http://wap.newtank.cn/newtank/act/zjyd0510/index.html?channel=sb";
 }
 );
 message = "\U64cd\U4f5c\U6210\U529f";
 pageCount = 1;
 pageNumber = 1;
 pageSize = 10;
 properties =     (
 );
 resultCode = 0000;
 totalCount = 5;
 */
