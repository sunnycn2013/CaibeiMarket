//
//  BorrowDetailViewController.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/13.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowDetailViewController.h"
#import "CMBorrowDetailNoteView.h"
#import "CMBorrowDetailContentCell.h"
#import "CMBorrowDetailNotesCell.h"
#import "CMBorrowDetailDesCell.h"
#import "CMBorrowDetailSpaceCell.h"
#import "CMBorrowDefine.h"

#import "CMBorrowDetail.h"
#import "CMBorrowProtocol.h"

@interface CMBorrowDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)CMBorrowDetailNoteView * noteView;
@property (nonatomic,strong)NSArray * templateArray;
@property (nonatomic,strong)NSDictionary * parameters;
@property(nonatomic,strong) UAHTTPSessionManager * request;
@property(nonatomic,strong) UAHTTPSessionManager * applyRequest;
@property (nonatomic,strong)UIButton * applyButton;

@property(nonatomic,strong) CMBorrowDetail *detail;
@end

@implementation CMBorrowDetailViewController
- (instancetype)initWithParams:(NSDictionary *)params
{
    self = [super init];
    if (self) {
        //
        self.parameters = params;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.parameters[@"title"] ? : @"";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.frame = CGRectMake(0, 25, KScreenWidth, KScreenHeight);
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.noteView];
    [self.view addSubview:self.applyButton];
    
    self.templateArray = @[@"CMBorrowDetailContentCell",@"CMBorrowDetailSpaceCell",@"CMBorrowDetailNotesCell",@"CMBorrowDetailSpaceCell",@"CMBorrowDetailDesCell"];
    [self.tableView registerClass:[CMBorrowDetailContentCell class] forCellReuseIdentifier:@"CMBorrowDetailContentCell"];
    [self.tableView registerClass:[CMBorrowDetailNotesCell class] forCellReuseIdentifier:@"CMBorrowDetailNotesCell"];

    [self.tableView registerClass:[CMBorrowDetailDesCell class] forCellReuseIdentifier:@"CMBorrowDetailDesCell"];
    [self.tableView registerClass:[CMBorrowDetailSpaceCell class] forCellReuseIdentifier:@"CMBorrowDetailSpaceCell"];

    [self loadData];

    [self setShareButton];
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)loadData
{
    __weak typeof(self) weakSelf = self;
    self.request = [UAHTTPSessionManager manager];
    [self.request GET:@"lend/lendDetail.json" parameters:self.parameters progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        weakSelf.detail = [CMBorrowDetail mj_objectWithKeyValues:responseObject] ;
        NSString * resultCode = [responseObject objectForKey:@"resultCode"];
        NSString * message = [responseObject objectForKey:@"message"];
        
        if ([resultCode isEqualToString:@"0000"]) {
            [weakSelf.tableView reloadData];
            [weakSelf processShareInfo];
        }else{
            [MBProgressHUD showErrorMessage:message];
        }
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        [MBProgressHUD showErrorMessage:@"服务异常"];
    }];
}

- (void)processShareInfo
{
    CMBorrowProduct * product = [self.detail.properties firstObject];
    if ([product isKindOfClass:[CMBorrowProduct class]]) {
        self.shareInfo = @{
                           @"title" : product.lendName,
                           @"description" : product.lendSpecial,
                           @"url" : product.lendUrl,
                           };
    }
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.templateArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = [self.templateArray objectAtIndex:indexPath.row];
    UITableViewCell<CMBorrowProtocol> * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell fillData:[self.detail.properties firstObject]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = [self.templateArray objectAtIndex:indexPath.row];
    if ([cellIdentifier isEqualToString:CMBorrowDetailCellTypeContent]) {
        return kIPhone6PScale(CMBorrowDetailContentHeight);
    }else if ([cellIdentifier isEqualToString:CMBorrowDetailCellTypeNote]){
        return kIPhone6PScale(CMBorrowDetailNoteHeight);
    }else if ([cellIdentifier isEqualToString:CMBorrowDetailCellTypeDes]){
        return kIPhone6PScale(CMBorrowDetailDesHeight);
    }else if ([cellIdentifier isEqualToString:CMBorrowDetailCellTypeSpace]){
        return kIPhone6PScale(CMBorrowDetailSpaceHeight);
    }
    return kIPhone6PScale(89);
}

- (void)applyForLend:(UIButton *)button
{
    CMBorrowProduct * product = [self.detail.properties firstObject];
    NSDictionary * params = @{
                              @"title" : product.lendName ? : @"",
                              @"url" : product.lendUrl ? : @"",
                              };
    RootWebViewController * detail = [[RootWebViewController alloc] initWithParams:params];
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark - set get
- (CMBorrowDetailNoteView *)noteView
{
    if (!_noteView) {
        _noteView = [[CMBorrowDetailNoteView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, 25)];
        _noteView.backgroundColor = [UIColor colorWithHexString:@"#FFE8EA"];
    }
    return _noteView;
}

- (UIButton *)applyButton
{
    if (!_applyButton) {
        CGFloat height = 44;
        _applyButton = [[UIButton alloc] initWithFrame:CGRectMake(0, kScreenHeight - height,KScreenWidth, height)];
        _applyButton.backgroundColor = CMThemeColor;
        [_applyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_applyButton setTitle:@"申请贷款" forState:UIControlStateNormal];
        [_applyButton addTarget:self action:@selector(applyForLend:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _applyButton;
}
@end
