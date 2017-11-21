//
//  CMBillMoneyTimeCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/16.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBillMoneyTimeCell.h"

@implementation CMBillMoneyTimeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textTapAction:)];
    [self.timeTextField addGestureRecognizer:tap];
    self.timeTextField.userInteractionEnabled = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)textTapAction:(UITapGestureRecognizer *)ges
{
    if ([self.delegate respondsToSelector:@selector(cell:didSelectedDate:)]) {
        [self.delegate cell:self didSelectedDate:nil];
    }
}
@end
