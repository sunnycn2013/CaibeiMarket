//
//  CMBillListSpaceCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBillListSpaceCell.h"

@implementation CMBillListSpaceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#F9F9F9"];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
