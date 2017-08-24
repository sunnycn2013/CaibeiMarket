//
//  CMBorrow.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMBorrowChoose.h"

@interface CMBorrowCrads : NSObject

@property (nonatomic,strong)NSNumber * hasActivity;
@property (nonatomic,strong)NSNumber * lendMoney;
@property (nonatomic,strong)NSString * lendName;

@property (nonatomic,strong)NSString * identifier;
@property (nonatomic,strong)NSString * lendPicUrl; //额度
@property (nonatomic,strong)NSString * lendSpecial;
@property (nonatomic,strong)NSString * monthlyInterestRate;
@property (nonatomic,strong)NSNumber * platformNature;
@property (nonatomic,strong)NSNumber * totalApply;
@property (nonatomic,assign)BOOL       showStar;
@property (nonatomic,assign)NSInteger  index;

@end

@interface CMBorrow : NSObject

@property (nonatomic,strong)NSNumber * pageSize;
@property (nonatomic,strong)NSNumber * totalCount;
@property (nonatomic,strong)NSNumber * pageNumber;
@property (nonatomic,strong)NSNumber * pageCount;
@property (nonatomic,strong)NSString * resultCode;
@property (nonatomic,strong)NSString * message;
@property (nonatomic,strong)NSArray  * listData;

@property (nonatomic,strong)CMBorrowChoose * borrowChoose;

- (void)resetSearchConditions;

- (NSDictionary *)searchConditions;

@end
