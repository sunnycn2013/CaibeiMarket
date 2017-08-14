//
//  CMBorrowChoose.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/11.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMBorrowChooseItem : NSObject

@property (nonatomic,strong) NSString * title;

@property (nonatomic,assign) BOOL       isSelected;

@end

@interface CMBorrowChoose : NSObject

@property (nonatomic,strong) NSString * category;

@property (nonatomic,strong) NSArray * conditions;

@end
