//
//  CMBorrowChoose.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/11.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CMBorrowChooseItemType) {
    CMBorrowChooseItemTypeLendMoney = 0,
    CMBorrowChooseItemTypeLendPerid,
    CMBorrowChooseItemTypeMonthlyInterestRate,
    CMBorrowChooseItemTypeOnlineTime,
    CMBorrowChooseItemTypeCreditStanding,
    
    CMBorrowChooseItemTypeHasCredit,
    CMBorrowChooseItemTypeLendTotalPerid,
    CMBorrowChooseItemTypeThroughputRate,
};

@interface CMBorrowChooseItem : NSObject

@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * selectValue;
@property (nonatomic,assign) BOOL       isSelected;
@property (nonatomic,assign) CMBorrowChooseItemType  style;

@property (nonatomic,strong) NSArray * lendMoney;
@property (nonatomic,strong) NSArray * lendPerid;
@property (nonatomic,strong) NSArray * monthlyInterestRate;
@property (nonatomic,strong) NSArray * onlineTime;
@property (nonatomic,strong) NSArray * creditStanding;
@property (nonatomic,strong) NSArray * hasCredit;
@property (nonatomic,strong) NSArray * lendTotalMoney;
@property (nonatomic,strong) NSArray * lendTotalPerid;
@property (nonatomic,strong) NSArray * throughputRate;

@property (nonatomic,strong) NSDictionary * searchConditions;

- (NSString *)titleAtIndex:(NSInteger)index;

- (NSInteger)numCount;
@end

@interface CMBorrowChoose : NSObject

@property (nonatomic,strong) NSString * version;

@property (nonatomic,strong) NSString * category;

@property (nonatomic,strong) NSArray  * data;

@property (nonatomic,strong) NSArray  * conditions;

- (void)resetSearchConditions;

- (NSDictionary *)searchConditions;

- (void)updateCondition:(NSString *)value style:(CMBorrowChooseItemType)style;

@end
