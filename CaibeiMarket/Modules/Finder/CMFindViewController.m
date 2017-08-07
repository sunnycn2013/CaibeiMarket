//
//  CMFindViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "CMFindViewController.h"

@interface CMFindViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CMFindViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_header = self.header;
    [self.view addSubview:self.tableView];
}

-(void)btnClick:(UIButton *)btn{
    if (btn.tag == 3000) {
        [self AlertWithTitle:@"测试标题" message:@"测试内容" andOthers:@[@"取消",@"确定"] animated:YES action:^(NSInteger index) {
            DLog(@"点击了 %ld",index);
        }];
    }else{
        [self ActionSheetWithTitle:@"测试" message:@"测试内容" destructive:nil destructiveAction:nil andOthers:@[@"1",@"2",@"3",@"4"] animated:YES action:^(NSInteger index) {
            DLog(@"点了 %ld",index);
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cellIdentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    return cell;
}
@end
