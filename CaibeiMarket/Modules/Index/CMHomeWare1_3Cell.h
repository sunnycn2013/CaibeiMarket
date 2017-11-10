//
//  CMHomeWare1_3Cell.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/9.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMHomeRenderProtocol.h"

@interface CMHomeWare1_3Cell : UITableViewCell<CMHomeRenderProtocol>

@property (nonatomic ,copy)void(^tapBlock)(id obj);

@end
