//
//  CMFindTableViewHeader.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/14.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMFindTableViewHeader;

@protocol CMFindTableViewHeaderDelegate<NSObject>

- (void)findHeadView:(CMFindTableViewHeader *)headerView didTapedAddBill:(UIView *)tapView;

- (void)findHeadView:(CMFindTableViewHeader *)headerView didTapedBillList:(UIView *)tapView;

@end

@interface CMFindTableViewHeader : UIView

@property (nonatomic,weak) id<CMFindTableViewHeaderDelegate> delegate;

@end
