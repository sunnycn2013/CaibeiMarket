//
//  DetailViewController.h
//  CaibeiMarket
//
//  Created by ccguo on 2017/7/19.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

