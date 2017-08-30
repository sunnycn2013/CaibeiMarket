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
#import "CMHomeContentCell.h"

#import "CMHomeModel.h"

#import "CMHomeDataProtocol.h"
#import "CMHomeRenderProtocol.h"
#import "LoginViewController.h"

#import "CMBorrowViewController.h"

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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    self.dataArray = @[kCMHomeBannerCellIdentifier,kCMHomeFastEntranceCellIdentifier,kCMHomeContentCellIdentifier];
    
    self.data = [[CMHomeModel alloc] init];
    
    [self loadData];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapIndexView:)];
    [self.view addGestureRecognizer:tap];
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
    [[kAppDelegate window] endEditing:YES];
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIndetifier = [self.dataArray objectAtIndex:indexPath.row];
    UITableViewCell<CMHomeRenderProtocol> * cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (!cell) {
        if ([cellIndetifier isEqualToString:kCMHomeBannerCellIdentifier]) {
            cell = [[CMHomeBannerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
        }else if ([cellIndetifier isEqualToString:kCMHomeFastEntranceCellIdentifier]){
            cell = [[CMHomeAppCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
        }else if ([cellIndetifier isEqualToString:kCMHomeContentCellIdentifier]){
            cell = [[CMHomeContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
            [(CMHomeContentCell *)cell setDelegate:self];
        }
    }
    kWeakSelf(self)
    [cell setTapBlock:^(id obj){
        [weakself processWithModel:obj];
    }];
    [cell fillData:self.homeModel.homeInfo];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<CMHomeDataProtocol> model = [self.data.homeModels objectAtIndex:indexPath.row];
    return [model heightForRowCell];
}

- (void)processWithModel:(id)model
{
    if([model conformsToProtocol:@protocol(CMHomeDataProtocol)])
    {
        NSString * actionType = [(id<CMHomeDataProtocol>)model actionType];
        if ([actionType isEqualToString:CMHomeActionTypeBanner])
        {
           
        }else if ([actionType isEqualToString:CMHomeActionTypeApp]){
            NSString * title = [(id<CMHomeDataProtocol>)model title] ? : @"";
            NSString * jumpUrl = [(id<CMHomeDataProtocol>)model jumUrl] ? : @"";
            RootWebViewController * webview = [[RootWebViewController alloc] initWithParams:@{@"title" : title,@"url" : jumpUrl}];
            [self.navigationController pushViewController:webview animated:YES];
        }else if ([actionType isEqualToString:CMHomeActionTypeContent]){
            if (![[CMUserManager sharedInstance] isLogined]) {
                LoginViewController * viewController = [[LoginViewController alloc] init];
                [self.navigationController pushViewController:viewController animated:YES];
                return;
            }
            CMBorrowViewController * borrow = [[CMBorrowViewController alloc] initWithParams:nil];
            [self.navigationController pushViewController:borrow animated:YES];
        }
    }
}

- (void)contentDidBeginEditing:(CMHomeContentCell *)cell description:(NSString *)des
{
    [self.tableView setContentOffset:CGPointMake(0, 100)];
//    [self.tableView scrollToRow:3 inSection:0 atScrollPosition:0 animated:YES];
}

#pragma mark - set get

@end
