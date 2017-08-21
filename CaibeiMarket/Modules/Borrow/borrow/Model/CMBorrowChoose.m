//
//  CMBorrowChoose.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/11.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowChoose.h"

@implementation CMBorrowChooseItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _selectValue = nil;
    }
    return self;
}

- (NSString *)titleAtIndex:(NSInteger)index
{
    switch (_style) {
        case CMBorrowChooseItemTypeLendMoney:
        {
            NSArray * array = @[@"500-1000",@"1000-2000",@"2000-3000",@"3000-5000",@"5000-8000",@"8000-10000",@"10000以上"];
            BOOL isval = [array count] > index;
            return isval ? [array objectAtIndex:index] : @"";
        }
            break;
        case CMBorrowChooseItemTypeLendPerid:
        {
            NSArray * array = @[@"7-14天",@"14-21天",@"21-28天",@"30天",@"30天以上"];
            BOOL isval = [array count] > index;
            return isval ? [array objectAtIndex:index] : @"";
        }
            break;
        case CMBorrowChooseItemTypeMonthlyInterestRate:
        {
            NSArray * array = @[@"高到底",@"低到高"];
            BOOL isval = [array count] > index;
            return isval ? [array objectAtIndex:index] : @"";
        }
            break;
        case CMBorrowChooseItemTypeOnlineTime:
        {
            NSArray * array = @[@"3个月",@"6个月",@"1年",@"2年",@"3年+"];
            BOOL isval = [array count] > index;
            return isval ? [array objectAtIndex:index] : @"";
        }
            break;
        case CMBorrowChooseItemTypeCreditStanding:
        {
            NSArray * array = @[@"不限",@"无逾期",@"年逾期<3次",@"年逾期>3次"];
            BOOL isval = [array count] > index;
            return isval ? [array objectAtIndex:index] : @"";
        }
            break;
            
        default:
            break;
    }
    return @"";
}

- (NSInteger)numCount
{
    
    NSArray * array = nil;
    switch (_style) {
        case CMBorrowChooseItemTypeLendMoney:
        {
            array = @[@"500-1000",@"1000-2000",@"2000-3000",@"3000-5000",@"5000-8000",@"8000-10000",@"10000以上"];
        }
            break;
        case CMBorrowChooseItemTypeLendPerid:
        {
            array = @[@"7-14天",@"14-21天",@"21-28天",@"30天",@"30天以上"];
        }
            break;
        case CMBorrowChooseItemTypeMonthlyInterestRate:
        {
            array = @[@"高到底",@"低到高"];
        }
            break;
        case CMBorrowChooseItemTypeOnlineTime:
        {
            array = @[@"3个月",@"6个月",@"1年",@"2年",@"3年+"];
        }
            break;
        case CMBorrowChooseItemTypeCreditStanding:
        {
            array = @[@"不限",@"无逾期",@"年逾期<3次",@"年逾期>3次"];
        }
            break;
            
        default:
            break;
    }
    return [array count];
}
//
//lendMoney
//lendPerid
//monthlyInterestRate //
//onlineTime
//creditStanding
//hasCredit///
//lendTotalMoney
//lendTotalPerid
//throughputRate//

- (NSDictionary *)searchConditions
{
    NSDictionary * dict = nil;
    NSString * key = @"";
    switch (_style) {
        case CMBorrowChooseItemTypeLendMoney:
        {
            key = @"lendMoney";
        }
            break;
        case CMBorrowChooseItemTypeLendPerid:
        {
            key = @"lendPerid";
        }
            break;
        case CMBorrowChooseItemTypeMonthlyInterestRate:
        {
            key = @"monthlyInterestRate";
        }
            break;
        case CMBorrowChooseItemTypeOnlineTime:
        {
            key = @"onlineTime";
        }
            break;
        case CMBorrowChooseItemTypeCreditStanding:
        {
            key = @"creditStanding";
        }
            break;
            
        default:
            break;
    }
    if (self.selectValue && [self.selectValue length]>0) {
        dict = @{key : self.selectValue};
    }
    return dict;
}
@end

@implementation CMBorrowChoose

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    CMBorrowChooseItem * item1 = [CMBorrowChooseItem new];
    item1.title = @"3个月";
    
    CMBorrowChooseItem * item2 = [CMBorrowChooseItem new];
    item2.title = @"6个月";
    
    CMBorrowChooseItem * item3 = [CMBorrowChooseItem new];
    item3.title = @"12个月";
    
    CMBorrowChooseItem * item4 = [CMBorrowChooseItem new];
    item4.title = @"24个月";
    
    self.conditions = @[item1,item2,item3,item4];
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"data" : @"CMBorrowChooseItem",
             @"conditions" : @"CMBorrowChooseItem"
             };
}

- (void)resetSearchConditions
{
    for (int i = 0; i<self.data.count; i++) {
        CMBorrowChooseItem * item = [self.data objectAtIndex:i];
        item.selectValue = @"";
    }
    
    for (int j = 0; j<self.conditions.count; j++) {
        CMBorrowChooseItem * item = [self.conditions objectAtIndex:j];
        item.selectValue = @"";
    }
}

- (NSDictionary *)searchConditions
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    for (int i = 0; i<self.data.count; i++) {
        CMBorrowChooseItem * item = [self.data objectAtIndex:i];
        NSDictionary * dic = [item searchConditions];
        if (dic) {
            [params addEntriesFromDictionary:dic];
        }
    }
    
    for (int j = 0; j<self.conditions.count; j++) {
        CMBorrowChooseItem * item = [self.conditions objectAtIndex:j];
        NSDictionary * dic = [item searchConditions];
        if (dic) {
            [params addEntriesFromDictionary:dic];
        }
    }

    return params;
}



@end
