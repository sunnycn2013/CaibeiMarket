//
//  CMHomeContentCell.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/21.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMHomeRenderProtocol.h"

@class CMHomeContentCell;
@protocol CMHomeContentCellDelegate <NSObject>

- (void)contentDidBeginEditing:(CMHomeContentCell *)cell description:(NSString *)des;

@end

@interface CMHomeContentCell : UITableViewCell<CMHomeRenderProtocol>

@property (nonatomic ,copy)void(^tapBlock)(id obj);

@property (nonatomic ,strong)id model;

@property (nonatomic ,weak)id delegate;

@end
