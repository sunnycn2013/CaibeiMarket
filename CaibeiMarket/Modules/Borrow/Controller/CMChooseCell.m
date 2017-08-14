//
//  CMChooseCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/8.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMChooseCell.h"
#import "CMBorrowChoose.h"

@interface CMChooseCell ()
@property (nonatomic,strong)CMBorrowChoose * choose;
@end

@implementation CMChooseCell
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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor orangeColor];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillData:(id)data
{
    if (![data isKindOfClass:[CMBorrowChoose class]]) {
        return;
    }
    self.choose = (CMBorrowChoose *)data;
    
    NSArray * array = [self.choose conditions];
    
    CGFloat width = KScreenWidth / array.count;
    
    for (int i=0 ; i<array.count; i++) {
        CMBorrowChooseItem * item = [array objectAtIndex:i];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(width * i, 0, width, 44);
        [button setTitle:item.title forState:UIControlStateNormal];
        [self addSubview:button];
    }
}

@end
