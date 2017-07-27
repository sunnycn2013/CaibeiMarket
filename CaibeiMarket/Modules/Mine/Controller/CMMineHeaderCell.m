//
//  CMMineHeaderCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/7/27.
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

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -  set get
- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
    }
    return _picImageView;
}

@end
