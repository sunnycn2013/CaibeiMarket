//
//  CMHomeAppCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/21.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeAppCell.h"
#import "CMHomeAppIcon.h"
#import "CMHomeApp.h"

@interface CMHomeAppCell ()

@property (nonatomic,strong)NSArray * data;
@end

@implementation CMHomeAppCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        [self setUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setUI
{
    CMHomeApp * app1 = [[CMHomeApp alloc] init];
    app1.title = @"常见问题";
    app1.imageName = @"icon_01";

    
    CMHomeApp * app2 = [[CMHomeApp alloc] init];
    app2.title = @"关于我们";
    app2.imageName = @"caibei_about";
    
    CMHomeApp * app3 = [[CMHomeApp alloc] init];
    app3.title = @"新开平台";
    app3.imageName = @"icon_03";

    CMHomeApp * app4 = [[CMHomeApp alloc] init];
    app4.title = @"活动优惠";
    app4.imageName = @"icon_04";
    
    self.data = @[app1,app2,app3,app4];
    
    self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    CGFloat paddingLeft = 20;
    CGFloat iconWidth = (KScreenWidth - 40 - 33)/4;//192
    CGFloat iconHeight = kIPhone6Scale(95);//

    CGFloat gapSpace = 10;
    
    for (int i = 0; i < 4; i++)
    {
        CGFloat iconX = paddingLeft + i * (iconWidth + gapSpace);
        CGRect frame = CGRectMake(iconX, 0, iconWidth, iconHeight);
        CMHomeAppIcon * app = [[CMHomeAppIcon alloc] initWithFrame:frame];
        app.data = [self.data objectAtIndex:i];
        [self addSubview:app];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated                    // animate between regular and selected state
{

}

- (void)fillData:(id)model
{
}
@end
