//
//  CMSetUpViewController.m
//  CaibeiMarket
//
//  Created by ccguo on 2017/7/28.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMSettingViewController.h"

#import "XBConst.h"
#import "XBSettingCell.h"
#import "XBSettingItemModel.h"
#import "XBSettingSectionModel.h"
#import "RootWebViewController.h"
#import "CBShowInfoViewController.h"
#import "CMUserManager.h"

@interface CMSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray  *sectionArray; /**< section模型数组*/

@end

@implementation CMSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self setupSections];
    [self.tableView reloadData];
    
    NSString * path = NSHomeDirectory();
    [self removeNoDataImage];
    NSLog(@"%@",path);
}

- (NSString *)pathForLocalImageCache
{
    NSString * path = NSHomeDirectory();
    NSString * imageCachePath = [NSString stringWithFormat:@"%@/Library/Caches",path];
    NSString * yyImagePath = [NSString stringWithFormat:@"%@/com.ibireme.yykit",imageCachePath];
    return yyImagePath;
}

- (void)removeCacheImageWithPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager removeItemAtPath:path error:NULL]) {
        [MBProgressHUD showInfoMessage:@"缓存清除成功"];
    }
}

- (NSString *)sizeOfLocalFilesWithPath:(NSString *)path
{
    CGFloat  size = [self folderSizeAtPath:path];
    if (size > 1) {
        return [NSString stringWithFormat:@"%.2fM",size];
    }else{
        return [NSString stringWithFormat:@"%.2fK",size*1024];
    }
}
//获得单个文件的大小
- (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
//获得文件夹（遍历）的大小
- (float) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0*1024.0);
}

- (void)showAlert:(NSString *)title
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"点击了" message:title delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

#pragma - mark setup
- (void)setupSections
{
    __weak typeof(self) weakSelf = self;
    //************************************section1
    XBSettingItemModel *item1 = [[XBSettingItemModel alloc]init];
    item1.funcName = @"修改密码";
    item1.executeCode = ^{
        NSLog(@"修改密码");
        [self showAlert:@"修改密码"];
    };
    item1.detailText = @"做任务赢大奖";
    item1.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    
    XBSettingItemModel *item2 = [[XBSettingItemModel alloc]init];
    item2.funcName = @"推送提醒";
    item2.accessoryType = XBSettingAccessoryTypeSwitch;
    item2.switchValueChanged = ^(BOOL isOn)
    {
        NSLog(@"推送提醒开关状态===%@",isOn?@"open":@"close");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"推送提醒" message:isOn?@"open":@"close" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    };

    XBSettingItemModel *item3 = [[XBSettingItemModel alloc]init];
    item3.funcName = @"清楚缓存";
    item3.detailText = [self sizeOfLocalFilesWithPath:[self pathForLocalImageCache]];
    item3.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    item3.executeCode = ^
    {
        [weakSelf removeCacheImageWithPath:[self pathForLocalImageCache]];
    };
    
    XBSettingSectionModel *section1 = [[XBSettingSectionModel alloc]init];
    section1.sectionHeaderHeight = 18;
    section1.itemArray = @[item1,item2,item3];
    
    //************************************section2
    XBSettingItemModel *item4 = [[XBSettingItemModel alloc]init];
    item4.funcName = @"给个好评";
    item4.detailImage = [UIImage imageNamed:@"icon-new"];
    item4.accessoryType = XBSettingAccessoryTypeNone;
    
    XBSettingItemModel *item5 = [[XBSettingItemModel alloc]init];
    item5.funcName = @"意见反馈";
    item5.detailImage = [UIImage imageNamed:@"next_normal"];
    item5.accessoryType = XBSettingAccessoryTypeNone;
    
    XBSettingItemModel *item6 = [[XBSettingItemModel alloc]init];
    item6.funcName = @"帮助中心";
    item6.detailImage = [UIImage imageNamed:@"next_normal"];
    item6.accessoryType = XBSettingAccessoryTypeNone;
    item6.executeCode = ^{
        NSString * url = @"http://www.icaibei.com/about/help.html";
        NSString * title = @"帮助中心";
        RootWebViewController * webview = [[RootWebViewController alloc] initWithParams:@{@"title" : title,@"url" : url}];
        [self.navigationController pushViewController:webview animated:YES];

    };
    
    XBSettingSectionModel *section2 = [[XBSettingSectionModel alloc]init];
    section2.sectionHeaderHeight = 18;
    section2.itemArray = @[item4,item5,item6];
    
    
    //************************************section3
    XBSettingItemModel *item7 = [[XBSettingItemModel alloc]init];
    item7.funcName = @"关于我们";
    item7.accessoryType = XBSettingAccessoryTypeNone;
    item7.detailImage = [UIImage imageNamed:@"next_normal"];
    item7.executeCode = ^{
        RootWebViewController * viewController = [[RootWebViewController alloc] initWithUrl:@"http://www.icaibei.com/about/index.html"];
        [weakSelf.navigationController pushViewController:viewController animated:YES];
    };
    
    XBSettingItemModel *item8 = [[XBSettingItemModel alloc]init];
    item8.funcName = @"分享到好友";
    item8.accessoryType = XBSettingAccessoryTypeNone;
    item8.executeCode = ^{
        [CMShareManager shareView:weakSelf.view info:nil];
    };
    
    NSString * version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString * versionStr = [NSString stringWithFormat:@"V%@",version];
    XBSettingItemModel *item9 = [[XBSettingItemModel alloc]init];
    item9.funcName = @"版本号";
    item9.accessoryType = XBSettingAccessoryTypeNone;
    item9.detailText = versionStr;
    
    XBSettingItemModel *item15 = [[XBSettingItemModel alloc]init];
    item15.funcName = @"查看Token";
    item15.accessoryType = XBSettingAccessoryTypeNone;
    item15.executeCode = ^{
        CBShowInfoViewController * info = [[CBShowInfoViewController alloc] init];
        [weakSelf.navigationController pushViewController:info animated:YES];
    };
    
    XBSettingSectionModel *section3 = [[XBSettingSectionModel alloc]init];
    section3.sectionHeaderHeight = 18;
    section3.itemArray = @[item7,item8,item9,item15];
    
    //************************************section4
    
    XBSettingItemModel *item10 = [[XBSettingItemModel alloc]init];
    item10.funcName = @"退出";
    item10.accessoryType = XBSettingAccessoryTypeCenter;
    item10.executeCode = ^{
        [weakSelf loginOut];
    };
    
    XBSettingSectionModel *section4 = [[XBSettingSectionModel alloc]init];
    section4.sectionHeaderHeight = 18;
    section4.itemArray = @[item10];
    
    self.sectionArray = @[section1,section2,section3,section4];
}

- (void)loginOut
{
    kWeakSelf(self)
    [[CMUserManager sharedInstance] logout:^(BOOL success, NSString *des) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakself.navigationController popToRootViewControllerAnimated:YES];
        });
        NSLog(@"log out");
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    XBSettingSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"setting";
    XBSettingSectionModel *sectionModel = self.sectionArray[indexPath.section];
    XBSettingItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    
    XBSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[XBSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.item = itemModel;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 18)];
    headView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    return headView;
}
#pragma - mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    XBSettingSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.sectionHeaderHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XBSettingSectionModel *sectionModel = self.sectionArray[indexPath.section];
    XBSettingItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    if (itemModel.executeCode) {
        itemModel.executeCode();
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    XBSettingSectionModel *sectionModel = [self.sectionArray firstObject];
    CGFloat sectionHeaderHeight = sectionModel.sectionHeaderHeight;
    
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

@end
