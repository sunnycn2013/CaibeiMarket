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
#import "CMHomeModel.h"

@interface CMHomeAppCell ()

@property (nonatomic,strong)CMHomeInfo * model;

@end

@implementation CMHomeAppCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)fillData:(id)model
{
    if (![model isKindOfClass:[CMHomeInfo class]]) {
        return;
    }
    self.model = (CMHomeInfo *)model;
    
    [self removeAllSubviews];
    self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    CGFloat paddingLeft = 20;
    CGFloat iconWidth = (KScreenWidth - 40 - 40)/5;//192
    CGFloat iconHeight = kIPhone6Scale(95);//
    CGFloat gapSpace = 10;
    
    NSInteger row = (NSInteger)self.model.entranceList.count / 5;
    
    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < 5; j++) {
            CGFloat iconY = 5 + i * (iconWidth + gapSpace);
            CGFloat iconX = paddingLeft + j * (iconWidth + gapSpace);
            CGRect frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
            CMHomeAppIcon * app = [[CMHomeAppIcon alloc] initWithFrame:frame];
            app.data = [self.model.entranceList objectAtIndex:i];
            app.backgroundColor = [UIColor redColor];
            [app setTapBlock:self.tapBlock];
            [self addSubview:app];
        }
    }
}
@end
