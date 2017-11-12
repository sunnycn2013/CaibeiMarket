//
//  CMHomeSeperateCell.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/11.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMHomeRenderProtocol.h"

@interface CMHomeSeperateCell : UITableViewCell<CMHomeRenderProtocol>
@property (nonatomic ,copy)void(^tapBlock)(id obj);

@end
