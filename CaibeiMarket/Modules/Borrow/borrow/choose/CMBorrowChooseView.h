//
//  CMBorrowChooseView.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/6.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMBorrowProtocol.h"

@class CMBorrowChooseView;
@protocol CMBorrowChooseViewDelegate <NSObject>

- (void)chooseView:(CMBorrowChooseView *)view shouldRefreashPage:(id)model;

@end

@interface CMBorrowChooseView : UIView<CMBorrowProtocol>

@property (nonatomic,weak)id delegate;

@end
