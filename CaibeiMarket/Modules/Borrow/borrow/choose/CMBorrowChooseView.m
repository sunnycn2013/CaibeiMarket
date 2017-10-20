//
//  CMBorrowChooseView.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/6.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowChooseView.h"
#import "CMChooseCell.h"
#import "CMBorrowChoose.h"
#import "CMBorrowChooseHeadView.h"
#import "CMBorrow.h"
#import "CMBorrowChoose.h"
#import "CMBorrowChooseFooterView.h"

@interface CMBorrowChooseView ()<UITableViewDataSource,UITableViewDelegate,CMBorrowChooseFooterViewDelegate>

@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)NSArray * data;

@property (nonatomic, strong)CMBorrowChoose *borrowChoose;
@property (nonatomic, strong)CMBorrowChooseFooterView  *footView;

@end

@implementation CMBorrowChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    self.tableView.userInteractionEnabled = YES;
    [self.tableView registerClass:[CMChooseCell class] forCellReuseIdentifier:@"CMChooseCell"];
    [self addSubview:self.tableView];
    [self addSubview:self.footView];
}

- (void)fillData:(id)model
{
    if (![model isKindOfClass:[CMBorrowChoose class]]) {
        return;
    }
    self.borrowChoose = (CMBorrowChoose *)model;
    [self.tableView reloadData];
}
    
- (void)reloadData
{
    [self.tableView reloadData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    });
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.borrowChoose.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"CMChooseCell";
    CMChooseCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell fillData:[self.borrowChoose.data objectAtIndex:indexPath.section]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

#pragma mark -  tableView  header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CMBorrowChooseItem * item = [self.borrowChoose.data objectAtIndex:section];
    CMBorrowChooseHeadView * headView = [[CMBorrowChooseHeadView alloc] initWithFrame:CGRectMake(20, 10, 200, 30)];
    headView.showTitle = item.title ? : @"放款速度";
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

#pragma mark - CMBorrowChooseFooterViewDelegate

- (void)footView:(CMBorrowChooseFooterView *)footer didResetCondition:(NSString *)actionType
{
    [self.borrowChoose resetSearchConditions];
    if([self.delegate respondsToSelector:@selector(chooseView:shouldRefreashPage:)]){
        [self.delegate chooseView:self shouldRefreashPage:self.borrowChoose];
    }
    kWeakSelf(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakself.tableView reloadData];
    });
}

- (void)footView:(CMBorrowChooseFooterView *)footer didCommitCondition:(NSString *)actionType
{
    if([self.delegate respondsToSelector:@selector(chooseView:shouldRefreashPage:)]){
        [self.delegate chooseView:self shouldRefreashPage:self.borrowChoose];
    }
}
#pragma mark -  set get
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 384)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (CMBorrowChooseFooterView *)footView
{
    if (!_footView) {
        _footView = [[CMBorrowChooseFooterView alloc] initWithFrame:CGRectMake(0, _tableView.height, KScreenWidth, 44)];
        _footView.delegate = self;
    }
    return _footView;
}
@end
