//
//  CMMineHeaderCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/27.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMMineHeaderCell.h"

@interface CMMineHeaderCell ()

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
    
    [self addSubview:self.picImageView];
    [self addSubview:self.phoneNumLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillData:(id)data
{
    
}

#pragma mark -  set get
- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 100, 100)];
        _picImageView.layer.cornerRadius = 50.0;
        _picImageView.layer.masksToBounds = YES;
    }
    return _picImageView;
}

- (UILabel *)phoneNumLabel
{
    if (!_phoneNumLabel) {
        _phoneNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 100, 300, 35)];
        _phoneNumLabel.text = @"1312782572";
    }
    return _phoneNumLabel;
}

@end
