//
//  CMHomeContentCorverFlowItem.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/1.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CMHomeContentCorverFlowItemType){
    CMHomeContentCorverFlowItemTypeNormal = 0,
    CMHomeContentCorverFlowItemTypeSelected,
};

//typedef NS_ENUM(NSInteger, CMBorrowChooseItemType) {


@interface CMHomeContentCorverFlowItem : UIView

@property (nonatomic,strong)NSString * text;

@property (nonatomic,assign)CMHomeContentCorverFlowItemType style;

@end
