//
//  CMBorrowDetailSpaceCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/14.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowDetailSpaceCell.h"

@implementation CMBorrowDetailSpaceCell
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
    self.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (CGFloat)heightForCell
{
    return 6.0;
}

@end
