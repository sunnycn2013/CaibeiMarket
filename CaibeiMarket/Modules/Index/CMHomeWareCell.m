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

@property (nonatomic,strong)UIImageView * newsImageView;
@property (nonatomic,strong)UILabel * newsTitleLabel;
@property (nonatomic,strong)UILabel * newsDesLabel;
@property (nonatomic,strong)UILabel * newsAuthorLabel;
@property (nonatomic,strong)UILabel * newsTimeLabel;
@property (nonatomic,strong)CALayer * lineView;

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
    [self.contentView addSubview:self.newsTitleLabel];
    [self.contentView addSubview:self.newsDesLabel];
    [self.contentView addSubview:self.newsAuthorLabel];
    [self.contentView addSubview:self.newsTimeLabel];
    
    [self.contentView addSubview:self.newsImageView];
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
    [self.newsImageView setImageWithURL:[NSURL URLWithString:self.model.img] placeholder:[UIImage imageNamed:@"icon-50"]];
    [self.newsTitleLabel setText:self.model.title];
    [self.newsTimeLabel setText:self.model.time];
    [self.newsDesLabel setText:self.model.des];
}

+ (CGFloat)heightForCellWith:(id)model
{
    return 114;
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    if (self.tapBlock) {
        self.tapBlock(self.model.jump);
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _lineView.frame = CGRectMake(26, self.height - 1, KScreenWidth - 26*2, 1);
}
#pragma mark -  set get
- (UILabel *)newsTitleLabel
{
    if (!_newsTitleLabel) {
        CGFloat width = kIPhone6PScale(230);
        _newsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(26, 20, width, 45)];
        _newsTitleLabel.textColor = [UIColor blackColor];
        _newsTitleLabel.font = [UIFont boldSystemFontOfSize:kIPhone6PScale(16)];
        _newsTitleLabel.text = @"会员免费意外保险";
        _newsTitleLabel.numberOfLines = 0;
//        _newsTitleLabel.backgroundColor = [UIColor redColor];
    }
    return _newsTitleLabel;
}

- (UILabel *)newsDesLabel
{
    if (!_newsDesLabel) {
        CGFloat width = kIPhone6PScale(230);
        _newsDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_newsTitleLabel.left, _newsTitleLabel.bottom, width, kIPhone6PScale(21))];
        _newsDesLabel.textColor = [UIColor grayColor];
        _newsDesLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
        _newsDesLabel.numberOfLines = 0;
        _newsDesLabel.text = @"asasassasasa";
    }
    return _newsDesLabel;
}

- (UILabel *)newsAuthorLabel
{
    if (!_newsAuthorLabel) {
        _newsAuthorLabel = [[UILabel alloc] initWithFrame:CGRectMake(_newsDesLabel.left, _newsDesLabel.bottom+9, kIPhone6PScale(100), kIPhone6PScale(10))];
        _newsAuthorLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(9)];
        _newsAuthorLabel.text = @"来源:采贝  评论 0";
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
        _newsTimeLabel.text = @"2017.10.25";
        _newsTimeLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(9)];
        _newsTimeLabel.textAlignment = NSTextAlignmentRight;
        _newsTimeLabel.textColor = [UIColor grayColor];
    }
    return _newsTimeLabel;
}

- (UIImageView *)newsImageView
{
    if (!_newsImageView) {
        _newsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_newsTitleLabel.right+15, 20, kIPhone6PScale(113), kIPhone6PScale(63))];
        _newsImageView.image = [UIImage imageNamed:@"find_head_note"];
        _newsImageView.backgroundColor = [UIColor purpleColor];
    }
    return _newsImageView;
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
