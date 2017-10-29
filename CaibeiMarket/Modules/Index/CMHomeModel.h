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

@interface CMHomeInfo : NSObject<CMHomeDataProtocol>

@property (nonatomic,strong)NSString * pattern;
@property (nonatomic,strong)NSArray  * bannerList;
@property (nonatomic,strong)NSArray  * entranceList;
@property (nonatomic,strong)NSArray  * productList;

#pragma ware
@property (nonatomic,strong)NSString * title;
@property (nonatomic,strong)NSString * des;
@property (nonatomic,strong)NSString * time;
@property (nonatomic,strong)NSString * author;
@property (nonatomic,strong)NSString * url;
@property (nonatomic,strong)NSString * img;

@end

@interface CMHomeModel : NSObject<CMHomeDataProtocol>

@property (nonatomic,strong)NSNumber * resultCode;
@property (nonatomic,strong)NSString * message;
@property (nonatomic,strong)NSString * pageSize;
@property (nonatomic,strong)NSString * pageNumber;
@property (nonatomic,strong)NSString * totalCount;
@property (nonatomic,strong)NSString * pageCount;
@property (nonatomic,strong)NSArray  * listData;
@property (nonatomic,strong)NSArray  * floors;

@end

