//
//  CMBillNoteCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/17.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBillNoteCell.h"

@implementation CMBillNoteCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textView.layer.cornerRadius = 2.0;
    self.textView.layer.masksToBounds = YES;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
