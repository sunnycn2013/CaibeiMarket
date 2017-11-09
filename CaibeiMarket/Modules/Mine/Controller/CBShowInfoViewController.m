//
//  CBShowInfoViewController.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/6.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CBShowInfoViewController.h"

@interface CBShowInfoViewController ()

@end

@implementation CBShowInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 150, KScreenWidth - 40, 400)];
    textView.backgroundColor = [UIColor whiteColor];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    textView.text = [userDefaults objectForKey:@"BS_Device_Token"];
    [self.view addSubview:textView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
