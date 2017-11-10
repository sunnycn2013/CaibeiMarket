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
    [self.newsTimeLabel setText:self.model.time];
    [self.newsDesLabel setText:self.model.des];
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    if (self.tapBlock) {
        self.tapBlock(self.model.jump);
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
            _newsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, kIPhone6Scale(105), kIPhone6Scale(70))];
            _newsImageView.image = [UIImage imageNamed:@"find_head_note"];
            _newsImageView.layer.cornerRadius = 4.0;
            _newsImageView.layer.masksToBounds = YES;
            _newsImageView.backgroundColor = [UIColor purpleColor];
        }
        return _newsImageView;
}

- (UILabel *)newsTitleLabel
{
    if (!_newsTitleLabel) {
        CGFloat width = KScreenWidth - kIPhone6Scale(105) - 30;
        _newsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_newsImageView.right+10, _newsImageView.top, width, kIPhone6Scale(35))];
        _newsTitleLabel.textColor = [UIColor blackColor];
        _newsTitleLabel.font = [UIFont boldSystemFontOfSize:kIPhone6PScale(15)];
        _newsTitleLabel.text = @"会员免费意外保险";
        _newsTitleLabel.numberOfLines = 0;
    }
    return _newsTitleLabel;
}

- (UILabel *)newsDesLabel
{
    if (!_newsDesLabel) {
        CGFloat width = KScreenWidth - kIPhone6Scale(105) - 30;
        _newsDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_newsTitleLabel.left, _newsTitleLabel.bottom, width, kIPhone6Scale(21))];
        _newsDesLabel.textColor = [UIColor grayColor];
        _newsDesLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(12)];
        _newsDesLabel.numberOfLines = 0;
        _newsDesLabel.text = @"100.0元";
    }
    return _newsDesLabel;
}



- (UILabel *)newsTimeLabel
{
    if (!_newsTimeLabel) {
        _newsTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_newsDesLabel.left, _newsDesLabel.bottom+kIPhone6PScale(3), kIPhone6Scale(100), kIPhone6Scale(10))];
        _newsTimeLabel.text = @"2017.10.25";
        _newsTimeLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(10)];
        _newsTimeLabel.textColor = [UIColor grayColor];
    }
    return _newsTimeLabel;
}
- (UILabel *)newsAuthorLabel
{
    if (!_newsAuthorLabel) {
        CGFloat marginLeft = KScreenWidth - kIPhone6Scale(56) - 10;
        _newsAuthorLabel = [[UILabel alloc] initWithFrame:CGRectMake(marginLeft, _newsDesLabel.bottom+kIPhone6PScale(3), kIPhone6Scale(56), kIPhone6Scale(10))];
        _newsAuthorLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(10)];
        _newsAuthorLabel.text = @"来源：采贝";
        _newsAuthorLabel.textColor = [UIColor grayColor];
        _newsAuthorLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _newsAuthorLabel;
}



@end
