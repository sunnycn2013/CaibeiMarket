//
//  CMBillCellProtocol.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/17.
//  Copyright © 2017年 qianji. All rights reserved.
//

#ifndef CMBillCellProtocol_h
#define CMBillCellProtocol_h

@protocol CMBillCellProtocol<NSObject>

@property (nonatomic,weak)id delegate;

- (void)cell:(UITableViewCell *)cell didSelectedDate:(id)sender;

- (void)cell:(UITableViewCell *)cell repaymentWay:(id)sender;

@end
#endif /* CMBillCellProtocol_h */
