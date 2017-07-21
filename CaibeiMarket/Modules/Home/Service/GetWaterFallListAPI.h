//
//  GetWaterFallListAPI.h
//  UniversalApp
//
//  Created by icaibei on 2017/7/3.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "BaseRequestAPI.h"

/**
 每个接口对应一个类，继承自BaseRequestAPI，接口参数以属性的方式写在下面，在.m中实现-requestUrl方法，返回接口地址
 */
@interface GetWaterFallListAPI : BaseRequestAPI

@property (nonatomic,assign) NSInteger page;//页码

@end
