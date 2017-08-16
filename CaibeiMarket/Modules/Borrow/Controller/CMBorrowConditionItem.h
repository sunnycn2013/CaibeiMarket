//
//  CMBorrowConditionItem.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSInteger CMBorrowConditionItemTag;

typedef NS_ENUM(NSInteger, CMBorrowConditionItemType){
    CMBorrowConditionItemAscending = 0,
    CMBorrowConditionItemDescending,
    CMBorrowConditionItemSwitch
};

typedef NS_ENUM(NSInteger, CMBorrowConditionSwitchType){
    CMBorrowConditionSwitchTypeOpen = 0,
    CMBorrowConditionSwitchTypeclose,
};

@class CMBorrowConditionItem;
@protocol CMBorrowConditionItemDeleage <NSObject>

- (void)borrowConditionItem:(CMBorrowConditionItem *)item selectedAtIndex:(NSInteger)index;

@end

@interface CMBorrowConditionItem : UIView

@property (nonatomic, strong)NSString * conditionText;
@property (nonatomic,   weak)id         delegate;
@property (nonatomic, assign)BOOL       isAscending;
@property (nonatomic, assign)CMBorrowConditionItemType       conditionType;
@property (nonatomic, assign)CMBorrowConditionSwitchType     switchType;

@property (nonatomic, copy)void(^TapAction)(NSInteger index, BOOL isAscending);

@end
