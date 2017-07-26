//
//  CMHomeAppCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/21.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeAppCell.h"
#import "CMHomeAppIcon.h"

@implementation CMHomeAppCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        [self setUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setUI
{
    self.backgroundColor = [UIColor greenColor];
    CGFloat paddingLeft = 20;
    CGFloat iconWidth = (KScreenWidth - 40 - 30)/4;//192
    CGFloat iconHeight = kIPhone6Scale(135);//192

    CGFloat gapSpace = 10;
    
    for (int i = 0; i < 4; i++)
    {
        CGFloat iconX = paddingLeft + i * (iconWidth + gapSpace);
        CGRect frame = CGRectMake(iconX, 0, iconWidth, iconHeight);
        CMHomeAppIcon * app = [[CMHomeAppIcon alloc] initWithFrame:frame];
        [self addSubview:app];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated                    // animate between regular and selected state
{

}
@end
