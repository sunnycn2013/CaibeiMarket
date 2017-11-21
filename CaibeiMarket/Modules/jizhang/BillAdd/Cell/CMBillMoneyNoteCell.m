//
//  CMBillMoneyNoteCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/16.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBillMoneyNoteCell.h"

@implementation CMBillMoneyNoteCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textTapAction:)];
    [self.noteLabel addGestureRecognizer:tap];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)textTapAction:(UITapGestureRecognizer *)ges
{
    if ([self.delegate respondsToSelector:@selector(cell:repaymentWay:)]) {
        [self.delegate cell:self repaymentWay:nil];
    }
}
@end
