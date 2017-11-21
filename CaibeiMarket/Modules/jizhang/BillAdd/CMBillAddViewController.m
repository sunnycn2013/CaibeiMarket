//
//  CMBillAddViewController.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/15.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBillAddViewController.h"
#import "CMBillAddQuDaoCell.h"
#import "CMBillListHeaderView.h"
#import "CMBillCellProtocol.h"

@interface CMBillAddViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray * dataArray;
@property (nonatomic,strong)CMBillListHeaderView * headerView;
@property (nonatomic,strong)UIDatePicker      * datePicker;
@property (nonatomic,strong)UIAlertController * actionSheet;

@end

@implementation CMBillAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"记账";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.frame = CGRectMake(0, 130, KScreenWidth, KScreenHeight -130);
    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillAddQuDaoCell" bundle:nil] forCellReuseIdentifier:@"CMBillAddQuDaoCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillProjectNameCell" bundle:nil] forCellReuseIdentifier:@"CMBillProjectNameCell"];

    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillMoneyNumCell" bundle:nil] forCellReuseIdentifier:@"CMBillMoneyNumCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillMoneyTimeCell" bundle:nil] forCellReuseIdentifier:@"CMBillMoneyTimeCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillMoneyLilvCell" bundle:nil] forCellReuseIdentifier:@"CMBillMoneyLilvCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillMoneyLimitCell" bundle:nil] forCellReuseIdentifier:@"CMBillMoneyLimitCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillMoneyNoteCell" bundle:nil] forCellReuseIdentifier:@"CMBillMoneyNoteCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillNoteCell" bundle:nil] forCellReuseIdentifier:@"CMBillNoteCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CMBillSpaceCell" bundle:nil] forCellReuseIdentifier:@"CMBillSpaceCell"];

    [self.view addSubview:self.tableView];
    [self.view addSubview:self.datePicker];
    self.dataArray = @[@"CMBillAddQuDaoCell",@"CMBillProjectNameCell",@"CMBillMoneyNumCell",@"CMBillMoneyTimeCell",@"CMBillSpaceCell",@"CMBillMoneyLilvCell",@"CMBillMoneyLimitCell",@"CMBillMoneyNoteCell",@"CMBillSpaceCell",@"CMBillNoteCell"];
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
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = [self.dataArray objectAtIndex:indexPath.row];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [(id<CMBillCellProtocol>)cell setDelegate:self];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = [self.dataArray objectAtIndex:indexPath.row];
    if ([cellIdentifier isEqualToString:@"CMBillNoteCell"]) {
        return 70;
    }
    if ([cellIdentifier isEqualToString:@"CMBillSpaceCell"]) {
        return 10;
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}

#pragma mark - CellDelegate
- (void)cell:(UITableViewCell *)cell didSelectedDate:(id)sender
{
    [self showDatePicker];
}

- (void)cell:(UITableViewCell *)cell repaymentWay:(id)sender
{
    [self.navigationController pushViewController:self.actionSheet animated:YES];
}


- (void)showDatePicker
{
    [UIView animateWithDuration:0.5 animations:^{
        _datePicker.frame = CGRectMake(0, KScreenHeight-100, KScreenWidth, 100);
    }];
}

- (void)hideDatePicker
{
    [UIView animateWithDuration:0.5 animations:^{
        _datePicker.frame = CGRectMake(0, KScreenHeight, KScreenWidth, 100);
    }];
}
#pragma mark - set get

- (CMBillListHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[CMBillListHeaderView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    }
    return _headerView;
}

- (UIDatePicker *)datePicker
{
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, KScreenHeight, KScreenWidth, 100)];
        _datePicker.datePickerMode = UIDatePickerModeDate;
    }
    return _datePicker;
}

- (UIAlertController *)actionSheet
{
    if (!_actionSheet) {
        _actionSheet = [UIAlertController alertControllerWithTitle:@"还款方式" message:@"选择还款方式" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction * action01 = [UIAlertAction actionWithTitle:@"等额本息" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //
        }];
        [_actionSheet addAction:action01];
    }
    return _actionSheet;
}

@end
