//
//  CMBorrowViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "CMBorrowViewController.h"
#import "CMBorrowConditionView.h"
#import "CMBorrowDefine.h"
#import "CMBorrowCell.h"
#import "CMBorrowChooseView.h"
#import "CMBorrowDetailViewController.h"

#import "CMBorrow.h"

@interface CMBorrowViewController ()<UITableViewDelegate,UITableViewDataSource,CMBorrowConditionViewDelegate>

@property (nonatomic, strong)CMBorrowConditionView * conditionView;
@property (nonatomic, strong)CMBorrowChooseView *chooseView;
@property (nonatomic, strong)UIView *chooseBgView;

@property (nonatomic,assign)BOOL  showChooseView;
@property(nonatomic,strong) UAHTTPSessionManager * request;


@property (nonatomic, strong)CMBorrow *borrow;

@end

@implementation CMBorrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"贷款";
    self.showChooseView = NO;
    
    [self.view addSubview:self.conditionView];
    CGFloat marginTop =  64 + CMBorrowConditionViewHeight;
    self.tableView.frame = CGRectMake(0, marginTop, KScreenWidth,KScreenHeight - marginTop -44);
    self.tableView.mj_header = self.header;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CMBorrowCell class] forCellReuseIdentifier:@"CMBorrowCell"];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.chooseBgView];
    [self.view addSubview:self.chooseView];
    [self.tableView reloadData];
    [self loadData];
}

-(void)naviBtnClick:(UIButton *)btn{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)headerRereshing
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//         [self.tableView.mj_header endRefreshing];
        [self loadData];
    });
    
}

- (void)loadData{
    NSDictionary * params = @{@"number" : @"1"};
    
    __weak typeof(self) weakSelf = self;
    self.request = [UAHTTPSessionManager manager];
    [self.request POST:@"lend/lendPage.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        weakSelf.borrow = [CMBorrow mj_objectWithKeyValues:responseObject] ;
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
    }];
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.borrow.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMBorrowCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CMBorrowCell"];
    id model = [self.borrow.listData objectAtIndex:indexPath.row];
    [cell fillData:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kIPhone6PScale(89);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMBorrowDetailViewController * detail = [[CMBorrowDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - CMBorrowConditionViewDelegate
- (void)borrowConditionView:(CMBorrowConditionView *)conditionView conditionType:(CMBorrowConditionType)type sortingCondition:(CMBorrowConditionItemType)sort
{
    [MBProgressHUD showTipMessageInWindow:@"刷新数据"];
}

- (void)borrowConditionView:(CMBorrowConditionView *)conditionView selectedChooseView:(NSInteger)index
{
    if (!self.showChooseView) {
        [UIView animateWithDuration:0.2 animations:^{
            self.showChooseView = YES;
            self.chooseBgView.frame  = CGRectMake(0, 104, KScreenWidth, KScreenHeight);
            self.chooseView.frame = CGRectMake(0, _conditionView.bottom, KScreenWidth, 424);
        }];
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            self.showChooseView = NO;
            self.chooseBgView.frame  = CGRectMake(0, 104, KScreenWidth, 0);
            self.chooseView.frame = CGRectMake(0, _conditionView.bottom, KScreenWidth, 0);
        }];
    }
}


#pragma mark - set get
- (CMBorrowConditionView *)conditionView
{
    if (!_conditionView) {
        _conditionView = [[CMBorrowConditionView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, CMBorrowConditionViewHeight)];
        _conditionView.backgroundColor = [UIColor whiteColor];
        _conditionView.delegate = self;
    }
    return _conditionView;
}

- (CMBorrowChooseView *)chooseView
{
    if (!_chooseView) {
        _chooseView = [[CMBorrowChooseView alloc] initWithFrame:CGRectMake(0, _conditionView.bottom, KScreenWidth, 0)];
        _chooseView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
//        _chooseView.backgroundColor = [UIColor purpleColor];
        _chooseView.clipsToBounds = YES;

    }
    return _chooseView;
}

- (UIView *)chooseBgView
{
    if (!_chooseBgView) {
        _chooseBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 104, KScreenWidth, 0)];
        _chooseBgView.backgroundColor = [UIColor blackColor];
        _chooseBgView.alpha = 0.6;
    }
    return _chooseBgView;
}

@end
