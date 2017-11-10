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
    _lineView.frame = CGRectMake(28, self.height - 1, KScreenWidth - 28*2, 1);
    
}
- (void)setUI
{
    [self.contentView addSubview:self.newsTitleLabel];
    [self.contentView addSubview:self.newsAuthorLabel];
    [self.contentView addSubview:self.newsTimeLabel];
    
    [self.contentView addSubview:self.newsImageView];
    [self.contentView.layer addSublayer:self.lineView];
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:gesture];
}

- (void)fillData:(id)model
{
//    if (![model isKindOfClass:[CMHomeInfo class]]) {
//        return;
//    }
//    self.model = (CMHomeInfo *)model;
//    [self.newsImageView setImageWithURL:[NSURL URLWithString:self.model.img] placeholder:[UIImage imageNamed:@"icon-50"]];
//    [self.newsTitleLabel setText:self.model.title];
//    [self.newsTimeLabel setText:self.model.time];
//    [self.newsDesLabel setText:self.model.des];
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
        CGFloat width = kIPhone6PScale(414-28-28);
        _newsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(28, 30, width, kIPhone6Scale(52))];
        _newsTitleLabel.textColor = [UIColor blackColor];
        _newsTitleLabel.font = [UIFont boldSystemFontOfSize:kIPhone6PScale(15)];
        _newsTitleLabel.text = @"会员免费意外保险";
        _newsTitleLabel.numberOfLines = 0;
    }
    return _newsTitleLabel;
}


- (UIImageView *)newsImageView
{
    if (!_newsImageView) {
        _newsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(28, _newsTitleLabel.bottom+18, kIPhone6PScale(113), kIPhone6PScale(71))];
        _newsImageView.image = [UIImage imageNamed:@"find_head_note"];
        _newsImageView.backgroundColor = [UIColor purpleColor];
    }
    return _newsImageView;
}

- (UILabel *)newsAuthorLabel
{
    if (!_newsAuthorLabel) {
        _newsAuthorLabel = [[UILabel alloc] initWithFrame:CGRectMake(28, _newsImageView.bottom+10, kIPhone6PScale(113), kIPhone6PScale(10))];
        _newsAuthorLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
        _newsAuthorLabel.text = @"来源:采贝  评论 0";
        _newsAuthorLabel.textColor = [UIColor grayColor];
        _newsAuthorLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _newsAuthorLabel;
}

- (UILabel *)newsTimeLabel
{
    if (!_newsTimeLabel) {
        CGFloat marginLeft = KScreenWidth - kIPhone6PScale(120) - 28;
        _newsTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(marginLeft, _newsAuthorLabel.top, kIPhone6PScale(120), kIPhone6PScale(10))];
        _newsTimeLabel.text = @"2017.10.25";
        _newsTimeLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
        _newsTimeLabel.textAlignment = NSTextAlignmentRight;
        _newsTimeLabel.textColor = [UIColor grayColor];
    }
    return _newsTimeLabel;
}


- (CALayer *)lineView
{
    if (!_lineView) {
        _lineView = [[CALayer alloc] init];
        _lineView.frame = CGRectMake(28, 0, KScreenWidth - 28*2, 1);
        _lineView.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
    return _lineView;
}
@end
