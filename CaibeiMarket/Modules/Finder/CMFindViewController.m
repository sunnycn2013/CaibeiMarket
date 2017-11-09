//
//  CMFindViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "CMFindViewController.h"
#import "CMFindHeadView.h"
#import "CMFindCreditCell.h"
#import "CMFindInsuranceCell.h"
#import "CMFindProtocol.h"
#import "CBAPIUtil.h"
#import "CMFind.h"
#import "CMFindItem.h"
#import "CMFindDataProtocol.h"

@interface CMFindViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) CMFind    * find;

@property(nonatomic,  strong)UAHTTPSessionManager * creditRequest;

@end

@implementation CMFindViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_header = self.header;
    self.tableView.height = KScreenHeight - 44;
//    self.tableView.mj_footer = self.footer;

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[CMFindCreditCell class] forCellReuseIdentifier:CMHomeActionTypeCredit];
    [self.tableView registerClass:[CMFindInsuranceCell class] forCellReuseIdentifier:CMHomeActionTypeSafe];

    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    [self loadData];
    
    NSDictionary * params = [CBAPIUtil getAPIDataWith:@"find.json"];
    self.find = [CMFind mj_objectWithKeyValues:params];
    NSLog(@"aa");
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
    [self.creditRequest POST:@"order/findOrderInfo.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        weakSelf.find = [CMFind mj_objectWithKeyValues:params];
        weakSelf.find = [CMFind mj_objectWithKeyValues:responseObject] ;
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
    return self.find.listData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CMFindItem<CMFindDataProtocol> *  item = [self.find.listData objectAtIndex:section];
    return [item numberOfRowsInFloor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMFindItem<CMFindDataProtocol> * item = [self.find.listData objectAtIndex:indexPath.section];
    id wareInfo = [item floorModelAtIndex:indexPath.row];
    UITableViewCell<CMFindProtocol> * cell = [tableView dequeueReusableCellWithIdentifier:[item pattern]];
    [cell fillData:wareInfo];
    kWeakSelf(self)
    [cell setTapBlock:^(id obj){
        [weakself processWithModel:obj];
    }];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return kIPhone6Scale(135.0);
    }else{
        return kIPhone6Scale(70.0);
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
    CMFindItem * item = [self.find.listData objectAtIndex:section];
    headerView.showTitle = item.title;
    return headerView;
}

- (void)processWithModel:(id)model
{
    UIViewController * viewController = nil;
    if([model isKindOfClass:[CMJump class]])
    {
        CMJump * jump = (CMJump *)model;
        if ([jump.type isEqualToString:@"h5"]) {
            RootWebViewController * webViewVC = [[RootWebViewController alloc] initWithUrl:jump.url];
            [self.navigationController pushViewController:webViewVC animated:YES];
        }else if ([jump.type isEqualToString:@"native"]){
            
        }
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
