//
//  CMBillListCell.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMBillListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *bankNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *stillPayLabel;
@property (weak, nonatomic) IBOutlet UILabel *stillPayNumLabel;

@property (weak, nonatomic) IBOutlet UILabel *curPayLabel;
@property (weak, nonatomic) IBOutlet UILabel *curPayNumLabel;

@property (weak, nonatomic) IBOutlet UILabel *nextPayLabel;
@property (weak, nonatomic) IBOutlet UILabel *nextPayNumLabel;

@end
