//
//  CMFindViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "CMFindViewController.h"
#import "CMFindCredit.h"
#import "CMFindInsurance.h"
#import "CMFindHeadView.h"
#import "CMFindCreditCell.h"
#import "CMFindInsuranceCell.h"
#import "CMFindProtocol.h"
#import "CMFindCredit.h"

@interface CMFindViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) CMFindCredit    * credit;
@property (nonatomic,strong) CMFindInsurance * insurance;

@property(nonatomic,  strong)UAHTTPSessionManager * creditRequest;
@property(nonatomic,  strong)UAHTTPSessionManager * insuranceRequest;

@end

@implementation CMFindViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_header = self.header;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[CMFindCreditCell class] forCellReuseIdentifier:@"CMFindCreditCell"];
    [self.tableView registerClass:[CMFindInsuranceCell class] forCellReuseIdentifier:@"CMFindInsuranceCell"];

    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)headerRereshing
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self loadData];
    });
    
}

- (void)loadData
{
    NSDictionary * params = @{@"number" : @"1"};
    __weak typeof(self) weakSelf = self;
    self.creditRequest = [UAHTTPSessionManager manager];
    [self.creditRequest POST:@"credit/creditPage.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        weakSelf.credit = [CMFindCredit mj_objectWithKeyValues:responseObject] ;
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        
        if ([resultCode isEqualToString:@"0000"]) {
            [weakSelf.tableView reloadData];
        }else{
            [MBProgressHUD showErrorMessage:message];
        }
        [weakSelf.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        [MBProgressHUD showErrorMessage:@"服务异常"];
        [weakSelf.tableView.mj_header endRefreshing];
    }];
    
    self.insuranceRequest = [UAHTTPSessionManager manager];
    [self.insuranceRequest POST:@"safe/safePage.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        weakSelf.insurance = [CMFindInsurance mj_objectWithKeyValues:responseObject] ;
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        
        if ([resultCode isEqualToString:@"0000"]) {
            [weakSelf.tableView reloadSection:1 withRowAnimation:UITableViewRowAnimationNone];
        }else{
            [MBProgressHUD showErrorMessage:message];
        }
        [weakSelf.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        [MBProgressHUD showErrorMessage:@"服务异常"];
        [weakSelf.tableView.mj_header endRefreshing];
    }];
}

- (void)refreashTableView
{
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.credit.listCreditData.count;
    }else if (section == 1){
        return self.insurance.listData.count;
    }
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cellIdentifier";
    if (indexPath.section == 0) {
        cellIdentifier = @"CMFindCreditCell";
    }else{
        cellIdentifier = @"CMFindInsuranceCell";
    }
    UITableViewCell<CMFindProtocol> * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    kWeakSelf(self)
    if (indexPath.section == 0) {
        [cell fillData:[self.credit.listCreditData objectAtIndex:indexPath.row]];
        [cell setTapBlock:^(id obj){
            if ([obj isKindOfClass:[CMFindCreditCard class]]) {
                CMFindCreditCard * model = (CMFindCreditCard *)obj;
                RootWebViewController * vc = [[RootWebViewController alloc] initWithUrl:model.criditUrl];
                [weakself.navigationController pushViewController:vc animated:YES];
            }
        }];
    }else if (indexPath.section == 1){
        [cell fillData:[self.insurance.listData objectAtIndex:indexPath.row]];
        [cell setTapBlock:^(id obj){
            if ([obj isKindOfClass:[CMFindInsuranceCard class]]) {
                CMFindInsuranceCard * model = (CMFindInsuranceCard *)obj;
                RootWebViewController * vc = [[RootWebViewController alloc] initWithUrl:model.safeUrl];
                [weakself.navigationController pushViewController:vc animated:YES];
            }
        }];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 135.0;
    }else{
        return 70.0;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CMFindHeadView * headerView = [[CMFindHeadView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 44)];
    
    if (section == 0) {
        headerView.showTitle = @"办理信用卡";
    }else{
        headerView.showTitle = @"保险";
    }
    return headerView;
}
@end
