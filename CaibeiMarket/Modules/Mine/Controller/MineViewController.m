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


@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UILabel * lbl;
}

@property (nonatomic,strong)NSArray          * dataArray;
@property (nonatomic,strong)CMMineHeaderView * headerView;

@end

@implementation MineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.tableView];
    
    CMMineHeader * header = [[CMMineHeader alloc] init];
    CMMineItem * item1 = [[CMMineItem alloc] init];
    item1.title = @"申请记录";
    item1.navigationType = CMMineJumpApply;
    
    CMMineItem * item2 = [[CMMineItem alloc] init];
    item2.title = @"我的资料";
    item2.navigationType = CMMineJumpMyData;
    
    CMMineItem * item3 = [[CMMineItem alloc] init];
    item3.title = @"关于我们";
    item3.navigationType = CMMineJumpAboutMe;
    
    CMMineItem * item4 = [[CMMineItem alloc] init];
    item4.title = @"设置";
    item3.navigationType = CMMineJumpSetUp;
    
    self.dataArray = @[header,item1,item2,item3,item4];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CMMineCell class] forCellReuseIdentifier:@"CMMineCell"];
    [self.tableView registerClass:[CMMineHeaderCell class] forCellReuseIdentifier:@"CMMineHeaderCell"];
    
    [self.tableView reloadData];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

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
    id<CMRubikDataProtocol> model = [self.dataArray objectAtIndex:indexPath.row];
    NSString * cellIndetifier  = [model identifierAtIndexPath:indexPath];
    UITableViewCell <CMRubikCellProtocol> * cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    [cell fillData:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<CMRubikDataProtocol> model = [self.dataArray objectAtIndex:indexPath.row];
    return [model heightForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProfileViewController * vc = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - set get
- (CMMineHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[CMMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kIPhone6Scale(233))];
        
    }
    return _headerView;
}

@end
