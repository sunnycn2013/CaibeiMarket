//
//  CMChooseItemView
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/16.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMChooseItemView.h"

@interface CMChooseItemView ()

@end

@implementation CMChooseItemView

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
    self.layer.borderColor = [UIColor colorWithHexString:@"#F6F6F6"].CGColor;
    self.layer.borderWidth = 0.1;
}

- (void)setStyle:(CMChooseItemViewStyle)style
{
    if (style == CMChooseItemViewStyleNormal) {
        [self setNormalStyle];
    }else{
        [self setSelectedStyle];
    }
}

- (void)setNormalStyle
{
    self.titleLabel.textColor = [UIColor grayColor];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setSelectedStyle
{
    self.titleLabel.textColor = CMThemeColor;
    self.backgroundColor = [UIColor colorWithHexString:@"#EFEDFF"];

//    self.backgroundColor = [UIColor colorWithHexString:@"#EFEDFF"];
}

@end
