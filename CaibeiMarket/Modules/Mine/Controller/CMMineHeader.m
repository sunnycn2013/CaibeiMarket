//
//  CMMineHeader.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/27.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMMineHeader.h"

@implementation CMMineHeader
- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath
{
    return @"CMMineHeaderCell";
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kIPhone6Scale(180);
}
@end
