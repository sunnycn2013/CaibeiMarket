//
//  CMFindJiZhangCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/12.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFindJiZhangCell.h"

@implementation CMFindJiZhangCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    self.backgroundColor = [UIColor redColor];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
