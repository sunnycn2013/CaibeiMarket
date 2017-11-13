//
//  CMFind.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/10/29.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMFindDataProtocol.h"

extern NSString * CMHomeActionTypeCredit;
extern NSString * CMHomeActionTypeSafe;
extern NSString * CMHomeActionTypeJiZhang;

@interface CMFind : NSObject<CMFindDataProtocol>

@property (nonatomic,strong)NSString * message;
@property (nonatomic,strong)NSNumber * pageCount;
@property (nonatomic,strong)NSNumber * pageNumber;

@property (nonatomic,strong)NSNumber * pageSize;
@property (nonatomic,strong)NSString * properties;

@property (nonatomic,strong)NSString * resultCode;
@property (nonatomic,strong)NSNumber * totalCount;

@property (nonatomic,strong)NSArray  * listData;

- (NSInteger)count;

- (id)floorModelAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)floorIdentifierAtIndexPath:(NSIndexPath *)indexPath;

@end
