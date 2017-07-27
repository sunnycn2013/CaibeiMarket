//
//  CMMineCell.m
//  CaibeiMarket
//
//  Created by ccguo on 2017/7/26.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMMineCell.h"

@interface CMMineCell ()

@property (nonatomic,strong)CALayer * bottomLine;
@property (nonatomic,strong)UILabel * mineTitleLabel;

@end

@implementation CMMineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.mineTitleLabel];
    [self.layer addSublayer:self.bottomLine];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CALayer *)bottomLine
{
    if (!_bottomLine) {
        CGFloat width = KScreenWidth;
        _bottomLine = [[CALayer alloc] init];
        _bottomLine.frame = CGRectMake(0, kIPhone6Scale(80) -0.5, width, 0.5);
        _bottomLine.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
    return _bottomLine;
}

- (UILabel *)mineTitleLabel
{
    if (!_mineTitleLabel) {
        CGFloat width = KScreenWidth - 80;
//        CGFloat height = kIPhone6Scale(80) - 80;
        _mineTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6Scale(50), 10, width, 44)];
        _mineTitleLabel.backgroundColor = [UIColor purpleColor];
        _mineTitleLabel.text = @"申请记录";
    }
    return _mineTitleLabel;
}
@end
