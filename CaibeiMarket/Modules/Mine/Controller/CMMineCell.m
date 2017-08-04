//
//  CMMineCell.m
//  CaibeiMarket
//
//  Created by ccguo on 2017/7/26.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMMineCell.h"
#import "CMMineDefine.h"
#import "CMMineItem.h"


@interface CMMineCell ()

@property (nonatomic,strong)UIImageView * settingImageView;
@property (nonatomic,strong)CALayer * bottomLine;
@property (nonatomic,strong)UILabel * mineTitleLabel;
@property (nonatomic,strong)UIImageView * nextImageView;

@property (nonatomic,strong)CMMineItem * data;

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
    [self addSubview:self.settingImageView];
    [self addSubview:self.mineTitleLabel];
    [self.layer addSublayer:self.bottomLine];
    [self addSubview:self.nextImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillData:(id)data
{
    if (![data isKindOfClass:[CMMineItem class]]) {
        return;
    }
    self.data = (CMMineItem *)data;
    [self.mineTitleLabel setText:self.data.title];
    [self.settingImageView setImage:[UIImage imageNamed:self.data.imageName]];
}

#pragma mark -  set get

- (UIImageView *)settingImageView
{
    if (!_settingImageView) {
        _settingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 20, kIPhone6PScale(15), kIPhone6PScale(17))];
    }
    return _settingImageView;
}
- (CALayer *)bottomLine
{
    if (!_bottomLine) {
        CGFloat width = KScreenWidth;
        _bottomLine = [[CALayer alloc] init];
        _bottomLine.frame = CGRectMake(0, CMMineItemHeight -0.5, width, 0.5);
        _bottomLine.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
    return _bottomLine;
}

- (UILabel *)mineTitleLabel
{
    if (!_mineTitleLabel) {
        CGFloat width = KScreenWidth - 80;
        _mineTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6Scale(50), 10, width, 44)];
        _mineTitleLabel.backgroundColor = [UIColor whiteColor];
        _mineTitleLabel.text = @"申请记录";
    }
    return _mineTitleLabel;
}

- (UIImageView *)nextImageView
{
    if (!_nextImageView) {
        _nextImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        _nextImageView.image = [UIImage imageNamed:@"next_normal"];
        _nextImageView.frame = CGRectMake(KScreenWidth - 30, 22, 6, 11);
    }
    return _nextImageView;
}
@end
