//
//  CMFindInsuranceCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFindInsuranceCell.h"
#import "CMFindItem.h"

@interface CMFindInsuranceCell ()

@property (nonatomic,strong) UIImageView * iconImageView;

@property (nonatomic,strong) UILabel * insuranceTitleLabel;

@property (nonatomic,strong) UILabel * totoalMoneyLabel;

@property (nonatomic,strong) UILabel * totoalNumPeopleLabel;

@property (nonatomic,strong) UIImageView * nextImageView;

@property (nonatomic,strong) CMFindWare * model;

//@property (nonatomic,strong) CALayer * lineView;
@property (nonatomic,strong) UIView * lineView;

@end

@implementation CMFindInsuranceCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        [self setUI];
    }
    return self;
}


- (void)setUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.iconImageView];
    [self addSubview:self.insuranceTitleLabel];
    [self addSubview:self.totoalMoneyLabel];
    [self addSubview:self.totoalNumPeopleLabel];
    [self addSubview:self.nextImageView];
    [self addSubview:self.lineView];
    
    kWeakSelf(self)
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        if (weakself.TapBlock) {
            weakself.TapBlock(weakself.model.jump);
        }
    }];
    [self addGestureRecognizer:tap];

}

- (void)fillData:(id)model
{
    if ([model isKindOfClass:[CMFindWare class]]) {
        self.model = (CMFindWare *)model;
    }
    NSString * imageURL = [NSString stringWithFormat:@"%@%@",URL_main,self.model.img];
    [self.iconImageView setImageWithURL:[NSURL URLWithString:imageURL] placeholder:[UIImage imageNamed:@"icaibei_placeholder"]];
    [self.insuranceTitleLabel setText:self.model.title];
    [self.totoalMoneyLabel setText:self.model.subTitle];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kIPhone6Scale(25), kIPhone6Scale(18), kIPhone6Scale(39), kIPhone6Scale(39))];
        _iconImageView.image = [UIImage imageNamed:@"find_head_note"];
        _iconImageView.layer.cornerRadius = kIPhone6Scale(39)/2;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)insuranceTitleLabel
{
    if (!_insuranceTitleLabel) {
        _insuranceTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.right+10, kIPhone6Scale(15), kIPhone6Scale(170), kIPhone6Scale(20))];
        _insuranceTitleLabel.textColor = [UIColor grayColor];
        _insuranceTitleLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(12)];
        _insuranceTitleLabel.text = @"会员免费意外保险";
    }
    return _insuranceTitleLabel;
}

- (UILabel *)totoalMoneyLabel
{
    if (!_totoalMoneyLabel) {
        _totoalMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(_insuranceTitleLabel.left, _insuranceTitleLabel.bottom+kIPhone6Scale(4), kIPhone6Scale(180), kIPhone6Scale(21))];
        _totoalMoneyLabel.textColor = [UIColor grayColor];
        _totoalMoneyLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(16)];
        _totoalMoneyLabel.text = @"100.0元";
//        _totoalMoneyLabel.backgroundColor = [UIColor purpleColor];
    }
    return _totoalMoneyLabel;
}

- (UILabel *)totoalNumPeopleLabel
{
    if (!_totoalNumPeopleLabel) {
        _totoalNumPeopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth - kIPhone6Scale(125), kIPhone6Scale(27), kIPhone6Scale(100), kIPhone6Scale(15))];
        _totoalNumPeopleLabel.textColor = [UIColor grayColor];
        _totoalNumPeopleLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(10)];
        _totoalNumPeopleLabel.text = @"已经认领: 1000人";
        _totoalNumPeopleLabel.textColor = [UIColor grayColor];
        _totoalNumPeopleLabel.textAlignment = NSTextAlignmentRight;
//        _totoalNumPeopleLabel.backgroundColor = [UIColor redColor];

    }
    return _totoalNumPeopleLabel;
}

- (UIImageView *)nextImageView
{
    if (!_nextImageView) {
        _nextImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_totoalNumPeopleLabel.right, kIPhone6Scale(27), kIPhone6Scale(6), kIPhone6Scale(10))];
        _nextImageView.image = [UIImage imageNamed:@"find_inssurance_next"];
    }
    return _nextImageView;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.frame = CGRectMake(0, 0, KScreenWidth,2);
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    }
    return _lineView;
}
@end
