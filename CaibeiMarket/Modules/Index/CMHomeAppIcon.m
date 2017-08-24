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
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    CGFloat iconWith = kIPhone6Scale(94/2.0);
    CGFloat marginLeft = (self.width - iconWith) / 2.0;
    CGFloat paddingTop = 18.0;
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(marginLeft, paddingTop, iconWith, iconWith)];
    _imageView.layer.cornerRadius = 21.0;
    [self addSubview:_imageView];
    
    CGFloat labelHeight = kIPhone6Scale(18);
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.bottom + kIPhone6Scale(5), self.width, labelHeight)];
    [_titleLabel setText:@"常见问题"];
    [_titleLabel setFont:[UIFont systemFontOfSize:11.0]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_titleLabel];
    
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:gesture];
}

- (void)setData:(CMHomeApp *)data
{
    _data = data;
    
    [_imageView setImage:[UIImage imageNamed:data.imageName]];
    [_titleLabel setText:data.title];
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    if (self.tapBlock) {
        self.tapBlock(self.data);
    }
}
@end
