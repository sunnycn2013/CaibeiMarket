//
//  CMMineItem.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/27.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMRubikDataProtocol.h"

@interface CMMineItem : NSObject<CMRubikDataProtocol>

@property (nonatomic,strong) NSString * title;

@property (nonatomic,strong) NSString * navigationType;

@property (nonatomic,strong) NSString * imageName;

@end
