//
//  CMFindCredit.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMFindCreditCard : NSObject

@property (nonatomic,strong)NSString * criditName;
@property (nonatomic,strong)NSString * criditPicUrl;
@property (nonatomic,strong)NSString * criditSpecial;
@property (nonatomic,strong)NSString * criditUrl;
@property (nonatomic,strong)NSString * identifier;

@end


@interface CMFindCreditItem : NSObject

@property (nonatomic,strong)CMFindCreditCard * leftItem;
@property (nonatomic,strong)CMFindCreditCard * rightItem;

@end

@interface CMFindCredit : NSObject

@property (nonatomic,strong)NSString * message;
@property (nonatomic,strong)NSNumber * pageCount;
@property (nonatomic,strong)NSNumber * pageNumber;

@property (nonatomic,strong)NSNumber * pageSize;
@property (nonatomic,strong)NSString * properties;

@property (nonatomic,strong)NSString * resultCode;
@property (nonatomic,strong)NSNumber * totalCount;

@property (nonatomic,strong)NSArray * listData;
@property (nonatomic,strong)NSMutableArray * listCreditData;

@end
