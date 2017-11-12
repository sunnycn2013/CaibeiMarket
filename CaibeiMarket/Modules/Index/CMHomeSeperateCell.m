//
//  CMHomeSeperateCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/11.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeSeperateCell.h"

@implementation CMHomeSeperateCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillData:(id)model
{
   
}

- (CGFloat)heightForCellWith:(id)model
{
    return 4;
}
- (void)tapAction:(UITapGestureRecognizer *)tap
{
    if (self.tapBlock) {
    }
}

@end
