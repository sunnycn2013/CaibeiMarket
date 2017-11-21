//
//  CMJZListViewController.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/14.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBillListViewController.h"
#import "CMBillListCell.h"
#import "CMBillListHeaderView.h"
#import "CBBillDetailViewController.h"

@interface CMBillListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray * dataArray;
@property (nonatomic,strong)CMBillListHeaderView * headerView;

@end

@implementation CMBillListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"记一笔";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillListCell" bundle:nil] forCellReuseIdentifier:@"CMBillListCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillListSpaceCell" bundle:nil] forCellReuseIdentifier:@"CMBillListSpaceCell"];
   [self.view addSubview:self.tableView];
    
    self.dataArray = @[@"a",@"b",@"c",@"d"];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count] * 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = nil;
    if (indexPath.row%2 != 0) {
        cellIdentifier = @"CMBillListCell";
    }else{
        cellIdentifier = @"CMBillListSpaceCell";
    }
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row%2);
    if (indexPath.row%2 != 0) {
        return 72;
    }
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBBillDetailViewController * detail = [[CBBillDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    CMFindHeadView * headerView = [[CMFindHeadView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 44)];
//    CMFindItem * item = [self.find.listData objectAtIndex:section];
//    headerView.showTitle = item.title;
//    return headerView;
//}


- (CMBillListHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[CMBillListHeaderView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 30)];
        _headerView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    }
    return _headerView;
}
@end
