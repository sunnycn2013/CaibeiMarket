//
//  CMFindCreditCell.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMFindProtocol.h"

@interface CMFindCreditCardView : UIView

@property (nonatomic,copy)void(^TapBlock)(id obj);

@end

@interface CMFindCreditCell : UITableViewCell<CMFindProtocol>

@property (nonatomic,copy)void(^TapBlock)(id obj);

@end
