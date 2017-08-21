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

@property (nonatomic, assign)BOOL  showChooseView;
@property(nonatomic,  strong)UAHTTPSessionManager * request;
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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[CMBorrowCell class] forCellReuseIdentifier:@"CMBorrowCell"];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.chooseBgView];
    [self.view addSubview:self.chooseView];
    [self.tableView reloadData];
    [self loadData];
    
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeConditionAction:)];
    [self.chooseBgView addGestureRecognizer:gesture];
}

-(void)naviBtnClick:(UIButton *)btn{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)headerRereshing
{
    kWeakSelf(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakself.borrow resetSearchConditions];
        NSLog(@"AAA: %@",[self.borrow searchConditions]);
        [weakself loadData];
    });
    
}

- (void)loadData{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    NSDictionary * pages = @{@"number" : @"1"};
    [params addEntriesFromDictionary:pages];
    [params addEntriesFromDictionary:[self.borrow searchConditions]];
    
    __weak typeof(self) weakSelf = self;
    self.request = [UAHTTPSessionManager manager];
    [self.request POST:@"lend/lendPage.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        weakSelf.borrow = [CMBorrow mj_objectWithKeyValues:responseObject] ;
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        
        if ([resultCode isEqualToString:@"0000"]) {
            [weakSelf.tableView reloadData];
            [weakSelf.conditionView fillData:weakSelf.borrow];
            [weakSelf.chooseView fillData:weakSelf.borrow];
        }else{
            [MBProgressHUD showErrorMessage:message];
        }
        [weakSelf.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        [MBProgressHUD showErrorMessage:@"服务异常"];
    }];
}

- (void)closeConditionAction:(UITapGestureRecognizer *)ges
{
    [self borrowConditionView:nil selectedChooseView:3];
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
    CMBorrowCrads * model = [self.borrow.listData objectAtIndex:indexPath.row];
    NSDictionary * params = @{
                                @"identifier" : model.identifier ? : @"",
                                @"title" : model.lendName ? : @"",
                              };
    CMBorrowDetailViewController * detail = [[CMBorrowDetailViewController alloc] initWithParams:params];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - CMBorrowConditionViewDelegate
- (void)borrowConditionView:(CMBorrowConditionView *)conditionView conditionType:(CMBorrowConditionType)type sortingCondition:(CMBorrowConditionItemType)sort
{
    NSLog(@"aa");
}

- (void)borrowConditionView:(CMBorrowConditionView *)conditionView selectedChooseView:(NSInteger)index
{
    if (!self.showChooseView) {
        [self.conditionView setConditionSwitchStyle:CMBorrowConditionSwitchTypeOpen];
        self.chooseBgView.frame  = CGRectMake(0, 110, KScreenWidth, KScreenHeight);
        [UIView animateWithDuration:0.2 animations:^{
            self.showChooseView = YES;
            self.chooseView.frame = CGRectMake(0, _conditionView.bottom, KScreenWidth, 424);
        }];
    }else{
        [self.conditionView setConditionSwitchStyle:CMBorrowConditionSwitchTypeclose];
        self.chooseBgView.frame  = CGRectMake(0, 110, KScreenWidth, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.showChooseView = NO;
            self.chooseView.frame = CGRectMake(0, _conditionView.bottom, KScreenWidth, 0);
        }];
    }
}

#pragma mark - CMBorrowChooseViewDelegate

- (void)chooseView:(CMBorrowChooseView *)view shouldRefreashPage:(id)model
{
    [self borrowConditionView:nil selectedChooseView:3];
    kWeakSelf(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [weakself loadData];
        NSLog(@"AAA: %@",[self.borrow searchConditions]);
    });
    DLog(@"refreash view");
}

#pragma mark - set get
- (CMBorrowConditionView *)conditionView
{
    if (!_conditionView) {
        _conditionView = [[CMBorrowConditionView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, CMBorrowConditionViewHeight)];
        _conditionView.backgroundColor = [UIColor whiteColor];
        _conditionView.delegate = self;
        [_conditionView setConditionSwitchStyle:CMBorrowConditionSwitchTypeclose];
    }
    return _conditionView;
}

- (CMBorrowChooseView *)chooseView
{
    if (!_chooseView) {
        _chooseView = [[CMBorrowChooseView alloc] initWithFrame:CGRectMake(0, _conditionView.bottom, KScreenWidth, 0)];
        _chooseView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
        _chooseView.backgroundColor = [UIColor purpleColor];
        _chooseView.clipsToBounds = YES;
        _chooseView.delegate = self;

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
