//
//  MineViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "MineViewController.h"
#import "CMMineHeaderView.h"
#import "CMMineItem.h"
#import "CMMineHeader.h"
#import "CMMineCell.h"
#import "CMMineHeaderCell.h"
#import "CMRubikCellProtocol.h"
#import "CMMineDefine.h"

#import "ProfileViewController.h"
#import "CMSettingViewController.h"
#import "RootWebViewController.h"
#import "CMPortraitViewController.h"

#import "XBMeHeaderView.h"
#import "XBConst.h"
#import "XBSettingCell.h"
#import "XBSettingItemModel.h"
#import "XBSettingSectionModel.h"

#import "CMPortraitViewController.h"
#import "LoginViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,CMMineHeaderViewDelegate>
{
    UILabel * lbl;
}

@property (nonatomic,strong)NSArray          * dataArray;
@property (nonatomic,strong)CMMineHeaderView * headerView;
@property (nonatomic,strong) NSArray  *sectionArray; /**< section模型数组*/

@end

@implementation MineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = CMThemeColor;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self setupSections];
    
    self.tableView.tableHeaderView = self.headerView;
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    self.tableView.top = 0;
    [self.headerView refreashData];
}

- (void)setupSections
{
    __weak typeof(self) weakself = self;
    //************************************section1
    XBSettingItemModel *item1 = [[XBSettingItemModel alloc]init];
    item1.funcName = @"申请记录";
    item1.executeCode = ^{
        NSLog(@"我的任务1");
    };
    item1.img = [UIImage imageNamed:@"apply"];
    item1.detailText = @"我的资料";
    item1.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    item1.executeCode = ^{
        CMPortraitViewController * portrait = [[CMPortraitViewController alloc] init];
        [weakself.navigationController pushViewController:portrait animated:YES];
    };
    
    
    XBSettingItemModel *item2 = [[XBSettingItemModel alloc]init];
    item2.funcName = @"我的资料";
    item2.img = [UIImage imageNamed:@"mydata"];
    item2.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    item2.executeCode = ^{
        CMPortraitViewController * portrait = [[CMPortraitViewController alloc] init];
        [weakself.navigationController pushViewController:portrait animated:YES];
    };
    
    XBSettingItemModel *item3 = [[XBSettingItemModel alloc]init];
    item3.funcName = @"关于采贝";
    item3.img = [UIImage imageNamed:@"about"];
    item3.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    item3.executeCode = ^{
        RootWebViewController * portrait = [[RootWebViewController alloc] initWithUrl:URL_icaibei_about_url];
        [weakself.navigationController pushViewController:portrait animated:YES];
    };
    
    XBSettingItemModel *item6 = [[XBSettingItemModel alloc]init];
    item6.funcName = @"设置";
    item6.img = [UIImage imageNamed:@"setting"];
    item6.executeCode = ^{
        CMSettingViewController * viewController = [[CMSettingViewController alloc] init];
        [weakself.navigationController pushViewController:viewController animated:YES];
    };
    item6.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    
//    XBSettingSectionModel *section2 = [[XBSettingSectionModel alloc]init];
//    section2.sectionHeaderHeight = kIPhone6PScale(14);
//    section2.itemArray = @[item5,item6];
    
    XBSettingSectionModel *section1 = [[XBSettingSectionModel alloc]init];
    section1.sectionHeaderHeight = kIPhone6PScale(14);
    section1.itemArray = @[item1,item2,item3,item6];
    
    self.sectionArray = @[section1];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    XBSettingSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.itemArray.count;}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"setting";
    XBSettingSectionModel *sectionModel = self.sectionArray[indexPath.section];
    XBSettingItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    
    XBSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[XBSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.item = itemModel;
    return cell;
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    XBSettingSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XBSettingSectionModel *sectionModel = self.sectionArray[indexPath.section];
    XBSettingItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    if (itemModel.executeCode) {
        itemModel.executeCode();
    }
}
//uitableview处理section的不悬浮，禁止section停留的方法，主要是这段代码
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    XBSettingSectionModel *sectionModel = [self.sectionArray firstObject];
    CGFloat sectionHeaderHeight = sectionModel.sectionHeaderHeight;
    
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

#pragma mark - CMMineHeaderViewDelegate
- (void)headerView:(CMMineHeaderView *)view didTaped:(id)obj
{
    if (![[CMUserManager sharedInstance] isLogined]) {
        LoginViewController * loginVC = [[LoginViewController alloc] init];
        UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:navi animated:YES completion:nil];
//        [[CMUserManager sharedInstance] login:kUserLoginTypePwd completion:^(BOOL success, NSString *des) {
//            //
//        }];
    }else{
        CMPortraitViewController * portrait = [[CMPortraitViewController alloc] init];
        [self.navigationController pushViewController:portrait animated:YES];
    }
}

#pragma mark - set get
- (CMMineHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[CMMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kIPhone6PScale(180))];
        _headerView.delegate = self;
    }
    return _headerView;
}

@end
