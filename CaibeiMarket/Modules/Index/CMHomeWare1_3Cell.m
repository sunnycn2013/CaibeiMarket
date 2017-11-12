//
//  CMHomeWare1_3Cell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/9.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeWare1_3Cell.h"
#import "CMHomeModel.h"

@interface CMHomeWare1_3Cell()

@property (nonatomic,strong)CMHomeInfo * model;

@property (nonatomic,strong)UIImageView * newsImageView;
@property (nonatomic,strong)UIImageView * newsImageView02;
@property (nonatomic,strong)UIImageView * newsImageView03;

@property (nonatomic,strong)UILabel * newsTitleLabel;
@property (nonatomic,strong)UILabel * newsAuthorLabel;
@property (nonatomic,strong)UILabel * newsTimeLabel;
@property (nonatomic,strong)CALayer * lineView;

@end

@implementation CMHomeWare1_3Cell
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

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _lineView.frame = CGRectMake(26, self.height - 1, KScreenWidth - 26*2, 1);
}
- (void)setUI
{
    [self.contentView addSubview:self.newsTitleLabel];
    [self.contentView addSubview:self.newsImageView];
    [self.contentView addSubview:self.newsImageView02];
    [self.contentView addSubview:self.newsImageView03];

    [self.contentView addSubview:self.newsAuthorLabel];
    [self.contentView addSubview:self.newsTimeLabel];
    
    [self.contentView.layer addSublayer:self.lineView];
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:gesture];
}

- (void)fillData:(id)model
{
    if (![model isKindOfClass:[CMHomeInfo class]]) {
        return;
    }
    self.model = (CMHomeInfo *)model;
    [self.newsTitleLabel setText:self.model.title];
    [self.newsTimeLabel setText:self.model.time];
    if ([self.model.images isKindOfClass:[NSArray class]] && [self.model.images count] >=3) {
        NSString * imageURL01 = [self.model.images objectAtIndex:0];
        NSString * imageURL02 = [self.model.images objectAtIndex:1];
        NSString * imageURL03 = [self.model.images objectAtIndex:2];

        [self.newsImageView setImageWithURL:[NSURL URLWithString:imageURL01] placeholder:[UIImage imageNamed:@"icon-50"]];
        [self.newsImageView02 setImageWithURL:[NSURL URLWithString:imageURL02] placeholder:[UIImage imageNamed:@"icon-50"]];
        [self.newsImageView03 setImageWithURL:[NSURL URLWithString:imageURL03] placeholder:[UIImage imageNamed:@"icon-50"]];
    }
}

- (CGFloat)heightForCellWith:(id)model
{
    return 189;
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    if (self.tapBlock) {
//        self.tapBlock(self.model.jump);
    }
}

#pragma mark -  set get
- (UILabel *)newsTitleLabel
{
    if (!_newsTitleLabel) {
        CGFloat width = kIPhone6PScale(414-26-26);
        _newsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(26, 20, width, 45)];
        _newsTitleLabel.textColor = [UIColor blackColor];
        _newsTitleLabel.font = [UIFont boldSystemFontOfSize:kIPhone6PScale(16)];
        _newsTitleLabel.text = @"会员免费意外保险会员免费意外保险会员免费意外保险会员免费意外保险会员免费意外保险会员免费意外保险会员免费意外保险";
        _newsTitleLabel.numberOfLines = 2;
//        _newsTitleLabel.backgroundColor = [UIColor redColor];
    }
    return _newsTitleLabel;
}

- (UIImageView *)newsImageView
{
    if (!_newsImageView) {
        _newsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(26, _newsTitleLabel.bottom+18, kIPhone6PScale(113), kIPhone6PScale(71))];
        _newsImageView.image = [UIImage imageNamed:@"find_head_note"];
        _newsImageView.backgroundColor = [UIColor purpleColor];
    }
    return _newsImageView;
}

- (UIImageView *)newsImageView02
{
    if (!_newsImageView02) {
        CGFloat space = (KScreenWidth - 26 -26 - kIPhone6PScale(113) * 3)/2;
        CGFloat pading = space+kIPhone6PScale(113);
        _newsImageView02 = [[UIImageView alloc] initWithFrame:CGRectMake(26+pading, _newsTitleLabel.bottom+18, kIPhone6PScale(113), kIPhone6PScale(71))];
        _newsImageView02.image = [UIImage imageNamed:@"find_head_note"];
        _newsImageView02.backgroundColor = [UIColor purpleColor];
    }
    return _newsImageView02;
}

- (UIImageView *)newsImageView03
{
    if (!_newsImageView03) {
        CGFloat space = (KScreenWidth - 26 -26 - kIPhone6PScale(113) * 3)/2;
        CGFloat pading =  2* (space+kIPhone6PScale(113));
        _newsImageView03 = [[UIImageView alloc] initWithFrame:CGRectMake(26+pading, _newsTitleLabel.bottom+18, kIPhone6PScale(113), kIPhone6PScale(71))];
        _newsImageView03.image = [UIImage imageNamed:@"find_head_note"];
        _newsImageView03.backgroundColor = [UIColor purpleColor];
    }
    return _newsImageView03;
}

- (UILabel *)newsAuthorLabel
{
    if (!_newsAuthorLabel) {
        _newsAuthorLabel = [[UILabel alloc] initWithFrame:CGRectMake(26, _newsImageView.bottom+11, kIPhone6PScale(113), kIPhone6PScale(10))];
        _newsAuthorLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(9)];
        _newsAuthorLabel.text = @"来源:采贝  评论 10";
        _newsAuthorLabel.textColor = [UIColor grayColor];
        _newsAuthorLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _newsAuthorLabel;
}

- (UILabel *)newsTimeLabel
{
    if (!_newsTimeLabel) {
        CGFloat marginLeft = KScreenWidth - kIPhone6PScale(120) - 26;
        _newsTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(marginLeft, _newsAuthorLabel.top, kIPhone6PScale(120), kIPhone6PScale(10))];
        _newsTimeLabel.text = @"2017.10.25 ";
        _newsTimeLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(9)];
        _newsTimeLabel.textAlignment = NSTextAlignmentRight;
        _newsTimeLabel.textColor = [UIColor grayColor];
    }
    return _newsTimeLabel;
}


- (CALayer *)lineView
{
    if (!_lineView) {
        _lineView = [[CALayer alloc] init];
        _lineView.frame = CGRectMake(26, 0, KScreenWidth - 26*2, 1);
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#E8E8E8"].CGColor;
    }
    return _lineView;
}
@end
