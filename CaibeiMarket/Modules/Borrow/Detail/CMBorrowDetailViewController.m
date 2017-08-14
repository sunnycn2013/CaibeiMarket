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

@interface CMBorrowDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)CMBorrowDetailNoteView * noteView;
@property (nonatomic,strong)NSArray * templateArray;

@end

@implementation CMBorrowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"喵贷贷款";
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

    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
//    static NSString * cellIdentifier = @"cellIdentifier";
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    cell.textLabel.text = @"111";
    
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
