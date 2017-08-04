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

@interface CMBorrowViewController ()

@property (nonatomic, strong)CMBorrowConditionView * conditionView;

@end

@implementation CMBorrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"贷款";
    
    [self.view addSubview:self.conditionView];
}
-(void)naviBtnClick:(UIButton *)btn{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - set get
- (CMBorrowConditionView *)conditionView
{
    if (!_conditionView) {
        _conditionView = [[CMBorrowConditionView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, CMBorrowConditionViewHeight)];
        _conditionView.backgroundColor = [UIColor whiteColor];
    }
    return _conditionView;
}

@end
