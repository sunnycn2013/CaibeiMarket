//
//  CMBorrowDetailNoteView.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/13.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowDetailNoteView.h"

@interface CMBorrowDetailNoteView ()

@property (nonatomic,strong)UILabel * titleLabel;

@end

@implementation CMBorrowDetailNoteView

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
    [self addSubview:self.titleLabel];
}

- (UILabel *)titleLabel
{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , 25)];
        _titleLabel.text = @"全新平台,活动推广中,秒批";
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor colorWithHexString:@"#FFE8EA"];
        _titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}

@end
