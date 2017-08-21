//
//  CMBorrowConditionView.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMBorrowConditionItem.h"
#import "CMBorrowChooseView.h"
#import "CMBorrowProtocol.h"

typedef NS_ENUM(NSInteger, CMBorrowConditionType){
    CMBorrowConditionTypeAmount = 0,   //金额
    CMBorrowConditionTypeTimeLimit,    //期限
    CMBorrowConditionTypeInterest,     //利率
    CMBorrowConditionTypeChoose,       //筛选
};

@class CMBorrowConditionView;
@protocol CMBorrowConditionViewDelegate <NSObject>

- (void)borrowConditionView:(CMBorrowConditionView *)conditionView conditionType:(CMBorrowConditionType)type sortingCondition:(CMBorrowConditionItemType)sort;

- (void)borrowConditionView:(CMBorrowConditionView *)conditionView selectedChooseView:(NSInteger)index;

@end

@interface CMBorrowConditionView : UIView<CMBorrowProtocol>

@property (nonatomic,  weak)id   delegate;

- (void)setConditionSwitchStyle:(CMBorrowConditionSwitchType)style;
@end
