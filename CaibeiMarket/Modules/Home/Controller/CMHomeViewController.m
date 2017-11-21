//
//  CMHomeViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/6/22.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "CMHomeViewController.h"
#import "CMHomeBannerCell.h"
#import "CMHomeAppCell.h"
#import "CMHomeWareCell.h"
#import "CMHomeWareNoneCell.h"
#import "CMHomeWare1_3Cell.h"
#import "CMHomeSeperateCell.h"

#import "CMHomeModel.h"

#import "CMHomeDataProtocol.h"
#import "CMHomeRenderProtocol.h"
#import "LoginViewController.h"

#import "CMBorrowViewController.h"
#import "CBAPIUtil.h"
#import "CMJump.h"

#define itemWidthHeight ((kScreenWidth-10)/2)

NSString * const kCMHomeBannerCellIdentifier       = @"HomeBanner";
NSString * const kCMHomeFastEntranceCellIdentifier = @"HomeFastEntrance";
NSString * const kCMHomeContentCellIdentifier      = @"HomeContent";


@interface CMHomeViewController ()

@property (nonatomic,strong) NSArray * dataArray;
@property (nonatomic,strong) CMHomeModel * data;
@property(nonatomic,  strong)UAHTTPSessionManager * request;
@property (nonatomic,strong) CMHomeModel * homeModel;
@end

@implementation CMHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.mj_header = self.header;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.height = KScreenHeight - 44;
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView registerClass:[CMHomeBannerCell class] forCellReuseIdentifier:CMHomeActionTypeBanner];
    [self.tableView registerClass:[CMHomeAppCell class] forCellReuseIdentifier:CMHomeActionTypeApp];
    [self.tableView registerClass:[CMHomeWareCell class] forCellReuseIdentifier:CMHomeActionTypeContent];
    [self.tableView registerClass:[CMHomeSeperateCell class] forCellReuseIdentifier:CMHomeActionTypeSeperate];
    [self.tableView registerClass:[CMHomeWareNoneCell class] forCellReuseIdentifier:CMHomeActionTypeContentNone];
    [self.tableView registerClass:[CMHomeWare1_3Cell class] forCellReuseIdentifier:CMHomeActionTypeContent1_3];

    [self.view addSubview:self.tableView];
    self.dataArray = @[kCMHomeBannerCellIdentifier,kCMHomeFastEntranceCellIdentifier,kCMHomeContentCellIdentifier];
    
    self.data = [[CMHomeModel alloc] init];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapIndexView:)];
    [self.view addGestureRecognizer:tap];
    
    self.tableView.top = 0;
    self.edgesForExtendedLayout = UIRectEdgeTop;
    
    NSDictionary * params = [CBAPIUtil getAPIDataWith:@"index.json"];
    self.homeModel = [CMHomeModel mj_objectWithKeyValues:params];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupUI
{
}

-(void)headerRereshing{
    kWeakSelf(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakself loadData];
    });
}

- (void)loadData{
    NSDictionary * params = @{@"number" : @"1"};
    
    __weak typeof(self) weakSelf = self;
    self.request = [UAHTTPSessionManager manager];
    [self.request POST:@"order/newOrderInfo.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        weakSelf.homeModel = [CMHomeModel mj_objectWithKeyValues:responseObject] ;
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

- (void)tapIndexView:(UITapGestureRecognizer *)gesture
{
    [self resetTableOffset];
    [[kAppDelegate window] endEditing:YES];
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.homeModel.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMHomeInfo * model = [self.homeModel.listData objectAtIndex:indexPath.row];
    NSString * cellIndetifier = [model pattern];
    UITableViewCell<CMHomeRenderProtocol> * cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    
    kWeakSelf(self)
    [cell setTapBlock:^(id obj){
        [weakself processWithModel:obj];
    }];
    [cell fillData:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMHomeInfo * model = [self.homeModel.listData objectAtIndex:indexPath.row];
    return [model heightForRowCell];
}

- (void)processWithModel:(id)model
{
    UIViewController * viewController = nil;
    NSDictionary * params = nil;
    if([model isKindOfClass:[CMJump class]])
    {
        CMJump * jump = (CMJump *)model;
        if ([jump.type isEqualToString:@"h5"]) {
            viewController = [[RootWebViewController alloc] initWithUrl:jump.url];
        }else if ([jump.type isEqualToString:@"native"])
        {
            if([jump.patton isEqualToString:@"jisu"]){
                params = @{@"lendPeriodSort" : @"1"};
                CMBorrowViewController * borrow = [[CMBorrowViewController alloc] init];
                borrow.parameters = [NSMutableDictionary dictionaryWithDictionary:params];
                viewController = borrow;
            }else if ([jump.patton isEqualToString:@"xinyong"]){
                params = @{@"creditStanding" : @"1"};
                CMBorrowViewController * borrow = [[CMBorrowViewController alloc] init];
                borrow.parameters = [NSMutableDictionary dictionaryWithDictionary:params];
                viewController = borrow;
            }else if ([jump.patton isEqualToString:@"bailing"]){
                params = @{@"onlineTime" : @"1"};
                CMBorrowViewController * borrow = [[CMBorrowViewController alloc] init];
                borrow.parameters = [NSMutableDictionary dictionaryWithDictionary:params];
                viewController = borrow;
            }
           
        }
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)resetTableOffset
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.tableView setContentOffset:CGPointMake(0, 0)];
    } completion:^(BOOL finished) {
    }];
}
#pragma mark - set get

@end
