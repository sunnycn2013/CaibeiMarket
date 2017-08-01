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

#define itemWidthHeight ((kScreenWidth-10)/2)

NSString * const kCMHomeBannerCellIdentifier       = @"HomeBanner";
NSString * const kCMHomeFastEntranceCellIdentifier = @"HomeFastEntrance";
NSString * const kCMHomeContentCellIdentifier      = @"HomeContent";


@interface CMHomeViewController ()

@property (nonatomic,strong) NSArray * dataArray;
@property (nonatomic,strong) CMHomeModel * data;

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
    
//    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.header endRefreshing];
    });
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
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (!cell) {
        if ([cellIndetifier isEqualToString:kCMHomeBannerCellIdentifier]) {
            cell = [[CMHomeBannerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
        }else if ([cellIndetifier isEqualToString:kCMHomeFastEntranceCellIdentifier]){
            cell = [[CMHomeAppCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
        }else if ([cellIndetifier isEqualToString:kCMHomeContentCellIdentifier]){
            cell = [[CMHomeContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
        }
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<CMHomeDataProtocol> model = [self.data.homeModels objectAtIndex:indexPath.row];
    return [model heightForRowCell];
}

#pragma mark - set get

@end
