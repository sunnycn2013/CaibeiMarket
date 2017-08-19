//
//  CMMineHeaderView.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/27.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMMineHeaderView;
@protocol CMMineHeaderViewDelegate <NSObject>

- (void)headerView:(CMMineHeaderView *)view didTaped:(id)obj;

@end
@interface CMMineHeaderView : UIView

@property (nonatomic,weak) id delegate;

@end
