//
//  CMBorrowCell.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMBorrowProtocol.h"

@interface CMBorrowCell : UITableViewCell<CMBorrowProtocol>

- (void)fillData:(id)model;

@end
