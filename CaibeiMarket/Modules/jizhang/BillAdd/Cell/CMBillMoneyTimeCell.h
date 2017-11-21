//
//  CMBillMoneyTimeCell.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/16.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMBillCellProtocol.h"

@interface CMBillMoneyTimeCell : UITableViewCell

@property (nonatomic,weak)id<CMBillCellProtocol> delegate;
@property (weak, nonatomic) IBOutlet UILabel *timeTextField;

@end
