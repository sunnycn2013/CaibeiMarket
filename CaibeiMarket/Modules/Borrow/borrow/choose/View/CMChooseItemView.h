//
//  CMChooseItemView
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/16.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CMChooseItemViewStyle) {
    CMChooseItemViewStyleNormal = 0,
    CMChooseItemViewStyleSelected
};

@interface CMChooseItemView : UIButton

@property (nonatomic,assign) CMChooseItemViewStyle style;

@end
