//
//  CMFindJiZhangCell.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/12.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFindJiZhangCell.h"
#import "CMFindItem.h"

@interface CMFindJiZhangCell()

@property (nonatomic,strong) UIImageView * bgImageView;

@property (nonatomic,strong) CMFindWare * model;

@end

@implementation CMFindJiZhangCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    [self addSubview:self.bgImageView];
    self.backgroundColor = [UIColor redColor];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillData:(id)model
{
    if (![model isKindOfClass:[CMFindWare class]]) {
        return;
    }
    self.model = (CMFindWare *)model;

}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kIPhone6PScale(162))];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.image = [UIImage imageNamed:@"find_jizhang"];
    }
    return _bgImageView;
}
@end
