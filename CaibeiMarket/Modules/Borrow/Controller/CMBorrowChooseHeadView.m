//
//  CMBorrowChooseHeadView.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowChooseHeadView.h"

@interface CMBorrowChooseHeadView ()

@property (nonatomic,strong) UIImageView * noteImageView;

@property (nonatomic,strong) UILabel     * noteTitleLabel;

@end

@implementation CMBorrowChooseHeadView
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
        _noteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(18, 19, 4, 12)];
        _noteImageView.image = [UIImage imageNamed:@"find_head_note"];
    }
    return _noteImageView;
}

- (UILabel *)noteTitleLabel
{
    if (!_noteTitleLabel) {
        _noteTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_noteImageView.right+10, 14, 180, 21)];
        _noteTitleLabel.textColor = [UIColor blackColor];
        _noteTitleLabel.font = [UIFont boldSystemFontOfSize:14];
        _noteTitleLabel.text = @"放款速度";
    }
    return _noteTitleLabel;
}

@end
