//
//  CMHomeAppIcon.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeAppIcon.h"

@interface CMHomeAppIcon ()

@property (nonatomic,strong)UIImageView * imageView;
@property (nonatomic,strong)UILabel     * titleLabel;

@end

@implementation CMHomeAppIcon

- (instancetype)initWithFrame:(CGRect)frame
{
    //98*135
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    self = [super initWithFrame:newFrame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    self.backgroundColor = [UIColor orangeColor];
    CGFloat iconWith = self.width - 15;
    CGFloat paddingTop = 25.0;
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, paddingTop, iconWith, iconWith)];
    _imageView.backgroundColor = [UIColor purpleColor];
    _imageView.layer.cornerRadius = 25;
    [self addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.bottom, self.width, iconWith)];
    [_titleLabel setText:@"常见问题"];
    [_titleLabel setFont:[UIFont systemFontOfSize:12.0]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_titleLabel];
}
@end
