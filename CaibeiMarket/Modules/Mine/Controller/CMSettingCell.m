//
//  CMSettingCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/8/8.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMSettingCell.h"

@interface CMSettingCell ()

@property (nonatomic,strong)UILabel * settingItemLabel;
@property (nonatomic,strong)UILabel * settingDesLabel;
@property (nonatomic,strong)UIImageView * nextImageView;

@end

@implementation CMSettingCell

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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUI
{
    
}

- (UILabel *)settingItemLabel
{
    if (!_settingItemLabel) {
        _settingItemLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 0, 0)];
        
    }
    return _settingItemLabel;
}

- (UILabel *)settingDesLabel
{
    if (!_settingDesLabel) {
        _settingDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        
    }
    return _settingDesLabel;
}

- (UIImageView *)nextImageView
{
    if (!_nextImageView) {
        _nextImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 00, 0)];
        
    }
    return _nextImageView;
}
@end
