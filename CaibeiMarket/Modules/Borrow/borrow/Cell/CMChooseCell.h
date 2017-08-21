//
//  CMChooseCell.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/8.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMBorrowProtocol.h"

@interface CMChooseCell : UITableViewCell<CMBorrowProtocol>

- (void)fillData:(id)data;

@end
