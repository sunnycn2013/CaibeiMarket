//
//  CMBorrowConditionView.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowConditionView.h"
#import "CMBorrowChooseView.h"

NSInteger CMBorrowConditionNum     = 4;

@interface CMBorrowConditionView ()<CMBorrowConditionItemDeleage>


@end

@implementation CMBorrowConditionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    CGFloat width  = KScreenWidth/CMBorrowConditionNum;
    CGFloat height = 46.0;
    NSArray * array = @[@"额度",@"期限",@"月利率",@"筛选"];
    
    for (int i = 0; i< CMBorrowConditionNum; i++) {
        CMBorrowConditionItem * item = [[CMBorrowConditionItem alloc] initWithFrame:CGRectMake(width * i, 0, width, height)];
        [item setConditionText:array[i]];
        [item setTag:CMBorrowConditionItemTag + i];
        [item setDelegate:self];
        [self addSubview:item];
    }
}

- (void)borrowConditionItem:(CMBorrowConditionItem *)item selectedAtIndex:(NSInteger)index
{
    NSInteger conditionType = item.tag - CMBorrowConditionItemTag;
    BOOL isAscending = item.isAscending;
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

#pragma mark - set get

@end
