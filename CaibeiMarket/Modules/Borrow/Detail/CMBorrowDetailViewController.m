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
    
    self.templateArray = @[@"CMBorrowDetailContentCell",@"CMBorrowDetailSpaceCell",@"CMBorrowDetailNotesCell",@"CMBorrowDetailSpaceCell",@"CMBorrowDetailDesCell"];
    [self.tableView registerClass:[CMBorrowDetailContentCell class] forCellReuseIdentifier:@"CMBorrowDetailContentCell"];
    [self.tableView registerClass:[CMBorrowDetailNotesCell class] forCellReuseIdentifier:@"CMBorrowDetailNotesCell"];

    [self.tableView registerClass:[CMBorrowDetailDesCell class] forCellReuseIdentifier:@"CMBorrowDetailDesCell"];
    [self.tableView registerClass:[CMBorrowDetailSpaceCell class] forCellReuseIdentifier:@"CMBorrowDetailSpaceCell"];

    [self loadData];
    
    UIButton * shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIBarButtonItem * rightBarButton = [UIBarButtonItem alloc]
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)didReceiveMemoryWarning {
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
    return self.templateArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = [self.templateArray objectAtIndex:indexPath.row];
    UITableViewCell<CMBorrowProtocol> * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell fillData:self.detail];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = [self.templateArray objectAtIndex:indexPath.row];
    if ([cellIdentifier isEqualToString:CMBorrowDetailCellTypeContent]) {
        return CMBorrowDetailContentHeight;
    }else if ([cellIdentifier isEqualToString:CMBorrowDetailCellTypeNote]){
        return CMBorrowDetailNoteHeight;
    }else if ([cellIdentifier isEqualToString:CMBorrowDetailCellTypeDes]){
        return CMBorrowDetailDesHeight;
    }else if ([cellIdentifier isEqualToString:CMBorrowDetailCellTypeSpace]){
        return CMBorrowDetailSpaceHeight;
    }
    return kIPhone6PScale(89);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMBorrowDetailViewController * detail = [[CMBorrowDetailViewController alloc] init];
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

@end
