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

@interface CMBorrowViewController ()<UITableViewDelegate,UITableViewDataSource,CMBorrowConditionViewDelegate>

@property (nonatomic, strong)CMBorrowConditionView * conditionView;
@property (nonatomic, strong)CMBorrowChooseView *chooseView;
@property (nonatomic,assign)BOOL  showChooseView;

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
    [self.view addSubview:self.chooseView];
    [self.tableView reloadData];
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
         [self.tableView.mj_header endRefreshing];
    });
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMBorrowCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CMBorrowCell"];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kIPhone6PScale(89);
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
            self.chooseView.frame = CGRectMake(0, _conditionView.bottom, KScreenWidth, 424);
        }];
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            self.showChooseView = NO;
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
        _chooseView.backgroundColor = [UIColor purpleColor];
    }
    return _chooseView;
}

@end
