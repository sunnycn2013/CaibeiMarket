//
//  CMFindProtocol.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

@protocol CMFindProtocol <NSObject>

@property (nonatomic,copy)void(^TapBlock)(id obj);

- (void)fillData:(id)model;

@end
