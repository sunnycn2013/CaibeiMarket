//
//  UIButton+XYButton.h
//  MiAiApp
//
//  Created by icaibei on 2017/6/1.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XYButton)

@property(nonatomic ,copy)void(^block)(UIButton*);

-(void)addTapBlock:(void(^)(UIButton*btn))block;

@end
