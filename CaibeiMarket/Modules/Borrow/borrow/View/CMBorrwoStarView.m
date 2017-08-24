//
//  CMBorrwoStarView.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/20.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrwoStarView.h"

@interface CMBorrwoStarView ()

@property (nonatomic,strong) UIImageView * starImageView;
@property (nonatomic,strong) UILabel     * numLabel;

@end

@implementation CMBorrwoStarView

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
    [self addSubview:self.starImageView];
    [self addSubview:self.numLabel];
}

- (void)updateTitle:(NSString *)title
{
    _numLabel.text = title;
}


- (UIImageView *)starImageView
{
    if (!_starImageView) {
        _starImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kIPhone6PScale(16), kIPhone6PScale(17))];
        _starImageView.layer.cornerRadius = kIPhone6PScale(10);
        _starImageView.image = [UIImage imageNamed:@"borrow_star"];
    }
    return _starImageView;
}

- (UILabel *)numLabel
{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kIPhone6PScale(16), kIPhone6PScale(15))];
        _numLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(10)];
        _numLabel.text = @"1";
        _numLabel.textColor = [UIColor whiteColor];
        _numLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _numLabel;
}
@end
