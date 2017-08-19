//
//  CMMineHeaderCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/27.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMMineHeaderCell.h"

@interface CMMineHeaderCell ()

@property (nonatomic,strong) UIView * picBgView;

@property (nonatomic,strong) UIImageView * picImageView;
@property (nonatomic,strong) UILabel * phoneNumLabel;
@property (nonatomic,strong) UILabel * desprictionLabel;
@property (nonatomic,strong) UIImageView * nextImageView;

@end
@implementation CMMineHeaderCell

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
    self.backgroundColor = CMThemeColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.picBgView];
    [self addSubview:self.picImageView];
    [self addSubview:self.phoneNumLabel];
    [self addSubview:self.desprictionLabel];
    [self addSubview:self.nextImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillData:(id)data
{
    
}
#pragma mark -  set get
- (UIView *)picBgView
{
    if (!_picBgView) {//79
        _picBgView = [[UIView alloc] initWithFrame:CGRectMake(29, 65, 79, 79)];
        _picBgView.layer.cornerRadius = 79.0/2;
        _picBgView.layer.masksToBounds = YES;
        _picBgView.backgroundColor = [UIColor whiteColor];
        _picBgView.alpha = 0.5;
    }
    return _picBgView;
}

- (UIImageView *)picImageView
{
    if (!_picImageView) {//79
        _picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(36, 71, 66, 66)];
        _picImageView.image = [UIImage imageNamed:@"touxiang"];
        _picImageView.layer.cornerRadius = 33.0;
        _picImageView.layer.masksToBounds = YES;
    }
    return _picImageView;
}

- (UILabel *)phoneNumLabel
{
    if (!_phoneNumLabel) {
        _phoneNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(_picImageView.right+27, 100, 300, 24)];
        _phoneNumLabel.text = @"1312782572";
        _phoneNumLabel.font = [UIFont systemFontOfSize:18];
        _phoneNumLabel.textColor = [UIColor whiteColor];
    }
    return _phoneNumLabel;
}

- (UILabel *)desprictionLabel
{
    if (!_desprictionLabel) {
        _desprictionLabel = [[UILabel alloc] initWithFrame:CGRectMake(_phoneNumLabel.left, _phoneNumLabel.bottom +5, _phoneNumLabel.width, 30)];
        _desprictionLabel.text = @"资料未设置";
        _desprictionLabel.font = [UIFont systemFontOfSize:13];
        _desprictionLabel.textColor = [UIColor whiteColor];
    }
    return _desprictionLabel;
}

- (UIImageView *)nextImageView
{
    if (!_nextImageView) {
        _nextImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth - 42, _phoneNumLabel.top, 8, 16)];
        _nextImageView.image = [UIImage imageNamed:@"next_light"];
    }
    return _nextImageView;
}
@end
