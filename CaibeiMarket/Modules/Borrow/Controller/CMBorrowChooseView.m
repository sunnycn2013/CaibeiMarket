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

@interface CMBorrowChooseView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)NSArray * data;


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
    
    CMBorrowChoose * choose01 = [[CMBorrowChoose alloc] init];
    choose01.category = @"上线时间";
    
    CMBorrowChoose * choose02 = [[CMBorrowChoose alloc] init];
    choose01.category = @"利率";
    
    CMBorrowChoose * choose03 = [[CMBorrowChoose alloc] init];
    choose01.category = @"信用";
    
    CMBorrowChoose * choose04 = [[CMBorrowChoose alloc] init];
    choose01.category = @"放款速度";
    self.data = @[choose01,choose02,choose03,choose04];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"CMChooseCell";
    CMChooseCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell fillData:[self.data objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

#pragma mark -  tableView  header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 30)];
    label.text = @"放款速度";
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

#pragma mark -  set get
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 424)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
@end
