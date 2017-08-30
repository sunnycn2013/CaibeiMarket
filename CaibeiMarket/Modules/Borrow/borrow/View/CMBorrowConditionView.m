//
//  CMBorrowConditionView.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowConditionView.h"
#import "CMBorrow.h"
NSInteger CMBorrowConditionNum     = 4;

@interface CMBorrowConditionView ()<CMBorrowConditionItemDeleage>

@property (nonatomic,strong) UIView * conditionLine;
@property (nonatomic, strong)CMBorrow *borrow;
@property (nonatomic, assign)BOOL isShowCondition;

@end

@implementation CMBorrowConditionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.isShowCondition = NO;
        [self setUI];
    }
    return self;
}

- (void)setUI{
    CGFloat width  = KScreenWidth/CMBorrowConditionNum;
    CGFloat height = 46.0;
    NSArray * array = @[@"额度高低",@"期限",@"月利率",@"筛选"];
    
    for (int i = 0; i< CMBorrowConditionNum; i++) {
        CMBorrowConditionItem * item = [[CMBorrowConditionItem alloc] initWithFrame:CGRectMake(width * i, 0, width, height)];
        [item setConditionText:array[i]];
        [item setTag:CMBorrowConditionItemTag + i];
        [item setDelegate:self];
        if (i < 3) {
            [item setConditionModel:self.borrow.borrowChoose.conditions[i]];
        }
        [self addSubview:item];
    }
    [self addSubview:self.conditionLine];
    [self updateConditionItem:nil index:0];
}

- (void)setConditionSwitchStyle:(CMBorrowConditionSwitchType)style
{
    CMBorrowConditionItem * item = [self viewWithTag:CMBorrowConditionItemTag + 3];
    if ([item isKindOfClass:[CMBorrowConditionItem class]]) {
        [item setConditionType:CMBorrowConditionItemSwitch];
        [item setSwitchType:style];
    }
}

- (void)updateConditionItem:(CMBorrowConditionItem *)item index:(NSInteger)index
{
    if (index < 3) {
        NSArray * array = [self subviews];
        for (int i = 0; i<array.count; i++) {
            CMBorrowConditionItem * item = [array objectAtIndex:i];
            if ([item isKindOfClass:[CMBorrowConditionItem class]]) {
                if (i==index) {
                    [item setStatus:CMBorrowConditionItemStatusSelected];
                }else{
                    [item setStatus:CMBorrowConditionItemStatusUnSelected];
                }
            }
        }
    }else{
        if (self.isShowCondition) {
            self.isShowCondition = NO;
            [item setStatus:CMBorrowConditionItemStatusUnSelected];
        }else{
            self.isShowCondition = YES;
            [item setStatus:CMBorrowConditionItemStatusSelected];
        }
    }
   
}
#pragma mark - CMBorrowConditionItemDeleage
- (void)borrowConditionItem:(CMBorrowConditionItem *)item selectedAtIndex:(NSInteger)index
{
    NSInteger conditionType = item.tag - CMBorrowConditionItemTag;
    BOOL isAscending = item.isAscending;
    [self updateConditionItem:item index:index];
    if (index < 3) {
        if ([self.delegate respondsToSelector:@selector(borrowConditionView:conditionType:sortingCondition:)]) {
            [self.delegate borrowConditionView:self conditionType:conditionType sortingCondition:isAscending];
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(borrowConditionView:selectedChooseView:)]) {
            [self.delegate borrowConditionView:self selectedChooseView:index];
        }
    }
}

- (void)fillData:(id)model
{
    if (![model isKindOfClass:[CMBorrow class]]) {
        return;
    }
    //self.borrow = (CMBorrow *)model;}
}

#pragma mark - set get

- (UIView *)conditionLine
{
    if (!_conditionLine) {
        _conditionLine = [[UIView alloc] initWithFrame:CGRectMake(0, 45, KScreenWidth, 0.5)];
        _conditionLine.backgroundColor = [UIColor lightGrayColor];
        _conditionLine.alpha = 0.6;
    }
    return _conditionLine;
}
@end
