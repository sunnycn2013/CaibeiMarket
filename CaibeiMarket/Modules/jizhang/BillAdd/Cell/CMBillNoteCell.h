//
//  CMBillNoteCell.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/17.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMBillNoteCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;

@property (nonatomic,weak)id delegate;

@end
