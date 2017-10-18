//
//  CMBorrowViewController.h
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

@interface CMBorrowViewController : RootViewController

/*
 //lendMoney
 //lendPerid
 //monthlyInterestRate
 //onlineTime
 //creditStanding
 //hasCredit///
 //lendTotalMoney
 //lendTotalPerid
 //throughputRate//
 */
@property (nonatomic,strong) NSMutableDictionary * parameters;

- (instancetype)initWithMoney:(NSString *)money time:(NSString *)time;
@end
