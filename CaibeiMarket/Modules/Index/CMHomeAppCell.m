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
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithHexString:@"#E7E7E7"];
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
    CGFloat iconWidth = (KScreenWidth - 40 - 40)/4;//192
    CGFloat iconHeight = kIPhone6Scale(85);//
    CGFloat gapSpace = 10;
    
    NSInteger row = (NSInteger)self.model.entranceList.count / 4;
    row = 1;
    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < 4; j++) {
            CGFloat iconY = 2+ i * (iconHeight + gapSpace);
            CGFloat iconX = paddingLeft + j * (iconWidth + gapSpace);
            CGRect frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
            CMHomeAppIcon * app = [[CMHomeAppIcon alloc] initWithFrame:frame];
            app.data = [self.model.entranceList objectAtIndex:j];
            [app setTapBlock:self.tapBlock];
            [self addSubview:app];
        }
    }
}

- (CGFloat)heightForCellWith:(id)model
{
    return (105.0);
}

@end
