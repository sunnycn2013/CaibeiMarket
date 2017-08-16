//
//  CMFindCreditCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFindCreditCell.h"
#import "CMFindCredit.h"

@interface CMFindCreditCardView ()

@property (nonatomic,strong) UIImageView * cardImageView;

@property (nonatomic,strong) UILabel * cardTitleLabel;

@property (nonatomic,strong) UILabel * cardDesLabel;

@property (nonatomic,strong) CMFindCreditCard * model;

- (void)fillData:(id)model;

@end

@implementation CMFindCreditCardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    [self addSubview:self.cardImageView];
    [self addSubview:self.cardTitleLabel];
    [self addSubview:self.cardDesLabel];
    kWeakSelf(self)
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        if (weakself.TapBlock) {
            weakself.TapBlock(weakself.model);
        }
    }];
    [self addGestureRecognizer:tap];
}

- (void)fillData:(id)model
{
    if ([model isKindOfClass:[CMFindCreditCard  class]]) {
        self.model = (CMFindCreditCard *)model;
    }
    NSString * imageURL = [NSString stringWithFormat:@"%@%@",URL_main,self.model.criditPicUrl];
    [self.cardImageView setImageURL:[NSURL URLWithString:imageURL]];
    [self.cardTitleLabel setText:self.model.criditName];
    [self.cardDesLabel setText:self.model.criditSpecial];
}

#pragma mark - set get
- (UIImageView *)cardImageView
{
    if (!_cardImageView) {
        _cardImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kIPhone6Scale(130), kIPhone6Scale(80))];
        _cardImageView.image = [UIImage imageNamed:@"find_head_note"];
        _cardImageView.layer.cornerRadius = 5;
        _cardImageView.layer.masksToBounds = YES;
    }
    return _cardImageView;
}

- (UILabel *)cardTitleLabel
{
    if (!_cardTitleLabel) {
        _cardTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_cardImageView.left, _cardImageView.bottom+kIPhone6Scale(4), kIPhone6Scale(130), kIPhone6Scale(16))];
        _cardTitleLabel.textColor = [UIColor blackColor];
        _cardTitleLabel.font = [UIFont systemFontOfSize:12];
        _cardTitleLabel.text = @"中信白条信用卡";
        _cardTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _cardTitleLabel;
}

- (UILabel *)cardDesLabel
{
    if (!_cardDesLabel) {
        _cardDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_cardImageView.left, _cardTitleLabel.bottom, kIPhone6Scale(130), kIPhone6Scale(11))];
        _cardDesLabel.textColor = [UIColor grayColor];
        _cardDesLabel.font = [UIFont systemFontOfSize:12];
        _cardDesLabel.text = @"最火免年费白金卡";
        _cardDesLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _cardDesLabel;
}
@end


@interface CMFindCreditCell ()

@property (nonatomic,strong) CMFindCreditCardView * leftCreditCards;

@property (nonatomic,strong) CMFindCreditCardView * rightCreditCards;

@property (nonatomic,strong) CMFindCreditItem * model;

@property (nonatomic,assign) CGFloat  padding;

@end

@implementation CMFindCreditCell
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
    [self addSubview:self.leftCreditCards];
    [self addSubview:self.rightCreditCards];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.padding = (KScreenWidth - 130*2 - 48)/2.0;
    _leftCreditCards.frame = CGRectMake(self.padding, 10, kIPhone6Scale(130), self.height-10);
    _rightCreditCards.frame = CGRectMake(_leftCreditCards.right + kIPhone6Scale(48), 10, kIPhone6Scale(130), _leftCreditCards.height);
}

- (void)fillData:(id)model
{
    if ([model isKindOfClass:[CMFindCreditItem  class]]) {
        self.model = (CMFindCreditItem *)model;
    }
    [self.leftCreditCards fillData:self.model.leftItem];
    [self.rightCreditCards fillData:self.model.rightItem];
}

- (void)setTapBlock:(void (^)(id))TapBlock
{
    _TapBlock = TapBlock;
    [_leftCreditCards setTapBlock:TapBlock];
    [_rightCreditCards setTapBlock:TapBlock];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CMFindCreditCardView *)leftCreditCards
{
    if (!_leftCreditCards) {
        _leftCreditCards = [[CMFindCreditCardView alloc] initWithFrame:CGRectMake(self.padding, 10, kIPhone6Scale(124), kIPhone6Scale(11))];
        _leftCreditCards.TapBlock = self.TapBlock;
    }
    return _leftCreditCards;
}

- (CMFindCreditCardView *)rightCreditCards
{
    if (!_rightCreditCards) {
        _rightCreditCards = [[CMFindCreditCardView alloc] initWithFrame:CGRectMake(_leftCreditCards.right, 10, kIPhone6Scale(124), kIPhone6Scale(11))];
        _rightCreditCards.TapBlock = self.TapBlock;
    }
    return _rightCreditCards;
}
@end
