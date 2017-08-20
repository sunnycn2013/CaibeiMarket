//
//  CMBorrowConditionItem.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowConditionItem.h"

NSInteger CMBorrowConditionItemTag = 500;

@interface CMBorrowConditionItem ()

@property (nonatomic,strong) UILabel * conditionTextLabel;
@property (nonatomic,strong) UIImageView * conditionHigh;
@property (nonatomic,strong) UIImageView * conditionLow;
@property (nonatomic,strong) UIImageView * switchImageView;

@property (nonatomic,strong) UITapGestureRecognizer * tapGesture;


@end

@implementation CMBorrowConditionItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
////    _switchImageView.frame = CGRectMake(_conditionTextLabe, _conditionHigh.bottom + 3, 13, 13);
//}

- (void)setUI
{
    self.isAscending = YES;
    self.switchImageView.hidden = YES;
    [self addSubview:self.conditionTextLabel];
    [self addSubview:self.conditionHigh];
    [self addSubview:self.conditionLow];
    [self addSubview:self.switchImageView];
    [self addGestureRecognizer:self.tapGesture];
}

- (void)setConditionType:(CMBorrowConditionItemType)conditionType
{
    if (conditionType == CMBorrowConditionItemAscending) {
        _conditionHigh.image = [UIImage imageNamed:@"condition_light_high"];
        _conditionLow.image = [UIImage imageNamed:@"condition_normal_low"];
    }else if(conditionType == CMBorrowConditionItemDescending){
        _conditionHigh.image = [UIImage imageNamed:@"condition_normal_high"];
        _conditionLow.image = [UIImage imageNamed:@"condition_light_low"];
    }else if (conditionType == CMBorrowConditionItemSwitch){
        self.conditionHigh.hidden = YES;
        self.conditionLow.hidden = YES;
        self.switchImageView.hidden = NO;
        _switchImageView.frame = CGRectMake(_conditionTextLabel.right+3, _conditionTextLabel.top+10, 13, 13);
    }
}

- (void)setSwitchType:(CMBorrowConditionSwitchType)switchType
{
    _switchType = switchType;
    if (switchType == CMBorrowConditionSwitchTypeOpen) {
        _switchImageView.image = [UIImage imageNamed:@"condition_light_select"];
    }else{
        _switchImageView.image = [UIImage imageNamed:@"condition_normal_select"];
    }
}
- (void)setConditionText:(NSString *)conditionText
{
    _conditionTextLabel.text = conditionText;
}

- (void)tapGestureAction:(UITapGestureRecognizer *)gesture
{
    if (self.isAscending) {
        self.isAscending = NO;
        [self setConditionType:CMBorrowConditionItemAscending];
    }else{
        self.isAscending = YES;
        [self setConditionType:CMBorrowConditionItemDescending];
    }
    NSInteger index = gesture.view.tag - CMBorrowConditionItemTag;
    if ([self.delegate respondsToSelector:@selector(borrowConditionItem:selectedAtIndex:)]) {
        [self.delegate borrowConditionItem:self selectedAtIndex:index];
    }
}

#pragma mark -  set get
- (UITapGestureRecognizer *)tapGesture
{
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    }
    return _tapGesture;
}

- (UILabel *)conditionTextLabel
{
    if (!_conditionTextLabel) {
        CGFloat width = self.width;
        _conditionTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, width * 0.6, 30)];
        _conditionTextLabel.text = @"额度";
        _conditionTextLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(12.5)];
        _conditionTextLabel.textColor = [UIColor lightGrayColor];
        _conditionTextLabel.textAlignment = NSTextAlignmentRight;
//        _conditionTextLabel.backgroundColor = [UIColor purpleColor];
    }
    return _conditionTextLabel;
}

- (UIImageView *)conditionHigh
{
    if (!_conditionHigh) {
        _conditionHigh = [[UIImageView alloc] initWithFrame:CGRectMake(_conditionTextLabel.right+5, _conditionTextLabel.top+10, 6, 4)];
        _conditionHigh.image = [UIImage imageNamed:@"condition_light_high"];
    }
    return _conditionHigh;
}

- (UIImageView *)conditionLow
{
    if (!_conditionLow) {
        _conditionLow = [[UIImageView alloc] initWithFrame:CGRectMake(_conditionTextLabel.right+5, _conditionHigh.bottom + 3, 6, 4)];
        _conditionLow.image = [UIImage imageNamed:@"condition_light_low"];
    }
    return _conditionLow;
}

- (UIImageView *)switchImageView
{
    if (!_switchImageView) {
        _switchImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_conditionTextLabel.right, _conditionTextLabel.top, 13, 13)];
        _switchImageView.image = [UIImage imageNamed:@"condition_normal_select"];
//        _switchImageView.backgroundColor = [UIColor redColor];
    }
    return _switchImageView;
}
@end
