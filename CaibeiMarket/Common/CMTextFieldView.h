//
//  CMTextFieldView.h
//  CaibeiMarket
//
//  Created by ccguo on 2017/8/3.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMTextFieldView : UIView

@property (nonatomic,strong)NSString * placeholder;
@property (nonatomic,strong)NSString * text;
@property (nonatomic,strong)UIColor  * textFieldBgColor;
@property (nonatomic,assign)BOOL      showRoundedCorner;
@property (nonatomic,assign)CGFloat   placeholderFontSize;
@property (nonatomic,assign)CGFloat   fontSize;
@property (nonatomic,assign)BOOL      secureTextEntry;

@end
