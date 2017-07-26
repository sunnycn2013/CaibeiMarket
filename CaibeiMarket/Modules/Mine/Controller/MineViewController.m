//
//  MineViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UILabel * lbl;
}

@property (nonatomic,strong)NSArray * dataArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.tableView];
    
    self.dataArray = @[@"申请记录", @"我的资料",@"关于我们",@"设置"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIndetifier = [self.dataArray objectAtIndex:indexPath.row];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (!cell) {
                
    }
    return cell;
}



@end
