//
//  CMMineItem.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/27.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMMineItem.h"
#import "CMMineDefine.h"

@implementation CMMineItem


- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath
{
    return @"CMMineCell";
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CMMineItemHeight;
}
@end
