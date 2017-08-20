//
//  CMHomeRenderProtocol.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/22.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CMHomeRenderProtocol <NSObject>

@property (nonatomic ,copy)void(^tapBlock)(id obj);

@property (nonatomic ,strong)id model;

- (void)fillData:(id)model;
@end
