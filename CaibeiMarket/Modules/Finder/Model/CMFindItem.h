//
//  CMFindItem.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/10/29.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMJump.h"

@interface CMFindWare : NSObject

@property (nonatomic,strong)NSString * identifier;
@property (nonatomic,strong)NSString * title;
@property (nonatomic,strong)NSString * img;
@property (nonatomic,strong)NSString * url;
@property (nonatomic,strong)NSString * subTitle;
@property (nonatomic,strong)CMJump   * jump;

@end

@interface CMFindItem : NSObject

@property (nonatomic,strong)NSString * title;
@property (nonatomic,strong)NSString * pattern;
@property (nonatomic,strong)NSArray  * productList;
@property (nonatomic,strong)NSArray  * secondList;

- (NSInteger)itemCount;

@end
