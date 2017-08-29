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
@property (nonatomic,strong)CMHomeApp * model;

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
    app1.actionType = @"home_app";
//    app1.jumUrl = @"http://www.icaibei.com/about/help.html";
    app1.jumUrl =@"http://www.btc38.com/news/2017/8/15150.html";
    
    CMHomeApp * app2 = [[CMHomeApp alloc] init];
    app2.title = @"关于我们";
    app2.imageName = @"caibei_about";
    app2.actionType = @"home_app";
    app2.jumUrl = @"http://www.icaibei.com/about/index.html";
    
    CMHomeApp * app3 = [[CMHomeApp alloc] init];
    app3.title = @"新开平台";
    app3.imageName = @"icon_03";
    app3.actionType = @"home_app";

    
    CMHomeApp * app4 = [[CMHomeApp alloc] init];
    app4.title = @"活动优惠";
    app4.imageName = @"icon_04";
    app4.actionType = @"home_app";

    self.data = @[app1,app2,app3,app4];
}

- (void)fillData:(id)model
{
//    if (![model isKindOfClass:[CMHomeApp class]]) {
//        return;
//    }
//    self.model = (CMHomeApp *)model;
    
    [self removeAllSubviews];
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
        [app setTapBlock:self.tapBlock];
        [self addSubview:app];
    }
}
@end
