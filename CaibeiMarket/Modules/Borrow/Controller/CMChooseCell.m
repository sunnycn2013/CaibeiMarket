//
//  CMChooseCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/8.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMChooseCell.h"
#import "CMBorrowChoose.h"
#import "CMChooseItemView.h"

#define CMChooseItemTag  5000

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
    self.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.4;

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
    self.backgroundColor = [UIColor whiteColor];
    NSArray * array = [self.choose conditions];
    CGFloat width = KScreenWidth / array.count;
    
    for (int i=0 ; i<array.count; i++) {
        CMBorrowChooseItem * item = [array objectAtIndex:i];
        CMChooseItemView * itemView = [[CMChooseItemView alloc] initWithFrame:CGRectMake(width * i, 0, width, 44)];
        itemView.userInteractionEnabled = YES;
        itemView.tag = CMChooseItemTag + i;
        itemView.titleLabel.font = [UIFont systemFontOfSize:14];
        [itemView setTitle:item.title forState:UIControlStateNormal];
        [itemView setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [itemView setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
        [itemView addTarget:self action:@selector(conditionSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:itemView];
    }
}

- (void)conditionSelected:(UIButton *)button
{
    NSArray * array = [self subviews];
    for (CMChooseItemView *item in array) {
        if ([item isKindOfClass:[CMChooseItemView class]]) {
            if (item != button) {
                [item setStyle:CMChooseItemViewStyleSelected];
            }else{
                [item setStyle:CMChooseItemViewStyleNormal];
            }
        }
    }
}

@end
