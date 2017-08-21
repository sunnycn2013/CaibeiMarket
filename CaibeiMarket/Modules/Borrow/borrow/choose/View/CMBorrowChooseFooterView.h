//
//  CMBorrowChooseFooterView.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/8/21.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMBorrowChooseFooterView;
@protocol CMBorrowChooseFooterViewDelegate <NSObject>

- (void)footView:(CMBorrowChooseFooterView *)footer didResetCondition:(NSString *)actionType;

- (void)footView:(CMBorrowChooseFooterView *)footer didCommitCondition:(NSString *)actionType;

@end

@interface CMBorrowChooseFooterView : UIView

@property (nonatomic,assign)id delegate;

@end
