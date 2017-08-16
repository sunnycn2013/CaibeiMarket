//
//  CMBorrowDetail.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMBorrowProduct : NSObject

@property (nonatomic,strong)NSString        * applyForAdvice;
@property (nonatomic,strong)NSString        * certificationMaterials;
@property (nonatomic,strong)NSString        * createDate;
@property (nonatomic,strong)NSNumber        * creditStanding;
@property (nonatomic,strong)NSNumber        * hasActivity;
@property (nonatomic,strong)NSNumber        * hasCredit;
//id = 15;
@property (nonatomic,strong)NSString        * identifier;
@property (nonatomic,strong)NSNumber        * lendMoney;
@property (nonatomic,strong)NSString        * lendMoneyBegin;
@property (nonatomic,strong)NSString        * lendMoneyEnd;

@property (nonatomic,strong)NSString        * lendName;
@property (nonatomic,strong)NSNumber        * lendOnlineTime;
@property (nonatomic,strong)NSNumber        * lendPeriod;
@property (nonatomic,strong)NSString        * lendPicUrl;
@property (nonatomic,strong)NSString        * lendSpecial;
@property (nonatomic,strong)NSNumber        * lendSpecialBegin;
@property (nonatomic,strong)NSNumber        * lendSpecialEnd;

@property (nonatomic,strong)NSString        * lendUrl;
@property (nonatomic,strong)NSNumber        * loanTime;
@property (nonatomic,strong)NSString        * monthlyInterestRate;
@property (nonatomic,strong)NSString        * overduePunishment;

@property (nonatomic,strong)NSNumber        * platformNature;

@property (nonatomic,strong)NSString        * requirements;
@property (nonatomic,strong)NSNumber        * returnCycle;
@property (nonatomic,strong)NSNumber        * status;
@property (nonatomic,strong)NSNumber        * throughputRate;
@property (nonatomic,strong)NSNumber        * totalApply;
@property (nonatomic,strong)NSString        * updateDate;

@end

@interface CMBorrowDetail : NSObject

@property (nonatomic,strong)NSString        * message;
@property (nonatomic,strong)CMBorrowProduct * properties;
@property (nonatomic,strong)NSString        * resultCode;

@end
