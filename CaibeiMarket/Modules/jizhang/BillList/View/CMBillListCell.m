//
//  CMBillListCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBillListCell.h"

@implementation CMBillListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
