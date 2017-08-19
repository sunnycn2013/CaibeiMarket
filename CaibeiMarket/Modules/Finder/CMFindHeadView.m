//
//  CMFindHeadView.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFindHeadView.h"

@interface CMFindHeadView ()

@property (nonatomic,strong) UIImageView * noteImageView;

@property (nonatomic,strong) UILabel * noteTitleLabel;

@end

@implementation CMFindHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    self.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    [self addSubview:self.noteImageView];
    [self addSubview:self.noteTitleLabel];
}

- (void)setShowTitle:(NSString *)showTitle
{
    _noteTitleLabel.text = showTitle;
}
#pragma mark - set get
- (UIImageView *)noteImageView
{
    if (!_noteImageView) {
        _noteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(18, kIPhone6Scale(19), kIPhone6Scale(4), kIPhone6Scale(12))];
        _noteImageView.image = [UIImage imageNamed:@"find_head_note"];
    }
    return _noteImageView;
}

- (UILabel *)noteTitleLabel
{
    if (!_noteTitleLabel) {
        _noteTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_noteImageView.right+10, kIPhone6Scale(15), kIPhone6Scale(180), kIPhone6Scale(21))];
        _noteTitleLabel.textColor = [UIColor grayColor];
        _noteTitleLabel.font = [UIFont systemFontOfSize:16];
        _noteTitleLabel.text = @"办理信用卡";
    }
    return _noteTitleLabel;
}
@end
