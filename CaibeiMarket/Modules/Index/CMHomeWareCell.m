//
//  CMHomeWareCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/10/27.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeWareCell.h"
#import "CMHomeModel.h"

@interface CMHomeWareCell ()

@property (nonatomic,strong)CMHomeInfo * model;

@property (nonatomic,strong)CALayer * lineView;
@property (nonatomic,strong)UIImageView * newsImageView;
@property (nonatomic,strong)UILabel * newsTitleLabel;
@property (nonatomic,strong)UILabel * newsDesLabel;
@property (nonatomic,strong)UILabel * newsAuthorLabel;
@property (nonatomic,strong)UILabel * newsTimeLabel;

@end

@implementation CMHomeWareCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setUI
{
    [self.contentView addSubview:self.newsImageView];
    [self.contentView addSubview:self.newsTitleLabel];
    [self.contentView addSubview:self.newsDesLabel];
    [self.contentView addSubview:self.newsAuthorLabel];
    [self.contentView addSubview:self.newsTimeLabel];
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:gesture];
}

- (void)fillData:(id)model
{
    if (![model isKindOfClass:[CMHomeInfo class]]) {
        return;
    }
    self.model = (CMHomeInfo *)model;
    [self.newsImageView setImageWithURL:[NSURL URLWithString:self.model.img] placeholder:[UIImage imageNamed:@"icon-50"]];
    [self.newsTitleLabel setText:self.model.title];
    [self.newsDesLabel setText:self.model.des];
    [self.newsTimeLabel setText:self.model.time];

}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    if (self.tapBlock) {
        self.tapBlock(self.model);
    }
}
#pragma mark -  set get
- (CALayer *)lineView
{
    if (!_lineView) {
        _lineView = [[CALayer alloc] init];
        _lineView.frame = CGRectMake(0, 0, KScreenWidth, 0.2);
        _lineView.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
    return _lineView;
}

- (UIImageView *)newsImageView
{
    if (!_newsImageView) {
        _newsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kIPhone6Scale(25), kIPhone6Scale(18), kIPhone6Scale(39), kIPhone6Scale(39))];
        _newsImageView.image = [UIImage imageNamed:@"find_head_note"];
    }
    return _newsImageView;
}

- (UILabel *)newsTitleLabel
{
    if (!_newsTitleLabel) {
        _newsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_newsImageView.right+10, kIPhone6Scale(15), kIPhone6Scale(170), kIPhone6Scale(30))];
        _newsTitleLabel.textColor = [UIColor grayColor];
        _newsTitleLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(16)];
        _newsTitleLabel.text = @"会员免费意外保险";
        _newsTitleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _newsTitleLabel;
}

- (UILabel *)newsDesLabel
{
    if (!_newsDesLabel) {
        _newsDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_newsTitleLabel.left, _newsTitleLabel.bottom+kIPhone6Scale(4), kIPhone6Scale(180), kIPhone6Scale(21))];
        _newsDesLabel.textColor = [UIColor grayColor];
        _newsDesLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(12)];
        _newsDesLabel.text = @"100.0元";
    }
    return _newsDesLabel;
}

- (UILabel *)newsAuthorLabel
{
    if (!_newsAuthorLabel) {
        _newsAuthorLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth - kIPhone6Scale(125), kIPhone6Scale(27), kIPhone6Scale(100), kIPhone6Scale(15))];
        _newsAuthorLabel.textColor = [UIColor grayColor];
        _newsAuthorLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(10)];
        _newsAuthorLabel.text = @"Logo";
        _newsAuthorLabel.textColor = [UIColor grayColor];
        _newsAuthorLabel.textAlignment = NSTextAlignmentRight;
    }
    return _newsAuthorLabel;
}

- (UILabel *)newsTimeLabel
{
    if (!_newsTimeLabel) {
        _newsTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_newsAuthorLabel.left, _newsAuthorLabel.bottom, kIPhone6Scale(106), kIPhone6Scale(10))];
        _newsTimeLabel.text = @"2017.10.25";
        _newsTimeLabel.backgroundColor = [UIColor purpleColor];
    }
    return _newsTimeLabel;
}

@end
