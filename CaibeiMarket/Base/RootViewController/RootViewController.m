//
//  RootViewController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"

@interface RootViewController ()

@property (nonatomic,strong) UIImageView* noDataView;

@end

@implementation RootViewController

- (UIStatusBarStyle)preferredStatusBarStyle{
    return _StatusBarStyle;
}
//动态更新状态栏颜色
-(void)setStatusBarStyle:(UIStatusBarStyle)StatusBarStyle{
    _StatusBarStyle=StatusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (instancetype)initWithParams:(NSDictionary *)parameters
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =KWhiteColor;
    
    //是否显示返回按钮
    self.isShowLiftBack = YES;
    self.StatusBarStyle = UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [MTAManager trackPageViewBegin:NSStringFromClass([self class])];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [MTAManager trackPageViewEnd:NSStringFromClass([self class])];
}

- (void)setShareButton
{
    UIButton * shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(0, 0, 25, 21);
    [shareButton setImage:[UIImage imageNamed:@"caibei_rightbtn_share"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageNamed:@"caibei_rightbtn_shareClick"] forState:UIControlStateSelected];
    [shareButton addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:shareButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)shareAction:(UIButton *)sender
{
    [CMShareManager shareView:self.view info:nil];
}
#pragma mark ————— 跳转登录界面 —————
- (void)goLogin
{
    RootNavigationController *loginNavi =[[RootNavigationController alloc] initWithRootViewController:[LoginViewController new]];
    [self presentViewController:loginNavi animated:YES completion:nil];
}
- (void)goLoginWithPush
{
    [self.navigationController pushViewController:[LoginViewController new] animated:YES];
}

- (void)showShouldLoginPoint
{
    
}

- (void)showLoadingAnimation
{
   
}

- (void)stopLoadingAnimation
{
   
}

-(void)showNoDataImage
{
    _noDataView=[[UIImageView alloc] init];
    [_noDataView setImage:[UIImage imageNamed:@"generl_nodata"]];
    [self.view.subviews enumerateObjectsUsingBlock:^(UITableView* obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITableView class]]) {
            [_noDataView setFrame:CGRectMake(0, 0,obj.frame.size.width, obj.frame.size.height)];
            [obj addSubview:_noDataView];
        }
    }];
}

-(void)removeNoDataImage{
    if (_noDataView) {
        [_noDataView removeFromSuperview];
        _noDataView = nil;
    }
}

/**
 *  懒加载UITableView
 *
 *  @return UITableView
 */
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];
        //头部刷新        
        //底部刷新
//        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
//        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
//        _tableView.mj_footer.ignoredScrollViewContentInsetBottom = 30;
        
        _tableView.backgroundColor=CViewBgColor;
        _tableView.scrollsToTop = YES;
        //        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        //        _tableView.separatorInset = UIEdgeInsetsMake(0, -10, 0, -10);//{top, left, bottom, right}
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

/**
 *  懒加载collectionView
 *
 *  @return collectionView
 */
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , KScreenHeight) collectionViewLayout:flow];
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        header.automaticallyChangeAlpha = YES;
        header.lastUpdatedTimeLabel.hidden = NO;
        _collectionView.mj_header = header;
        
        //底部刷新
        _collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
        _collectionView.mj_footer.ignoredScrollViewContentInsetBottom = 30;
        
        _collectionView.backgroundColor=CViewBgColor;
        _collectionView.scrollsToTop = YES;
    }
    return _collectionView;
}

- (MJRefreshNormalHeader *)header
{
    if (!_header) {
        _header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        _header.automaticallyChangeAlpha = YES;
        _header.lastUpdatedTimeLabel.hidden = NO;
    }
    return _header;
}
-(void)headerRereshing{
    
}

-(void)footerRereshing{
    
}

/**
 *  是否显示返回按钮
 */
- (void) setIsShowLiftBack:(BOOL)isShowLiftBack
{
    _isShowLiftBack = isShowLiftBack;
    NSInteger VCCount = self.navigationController.viewControllers.count;
    //下面判断的意义是 当VC所在的导航控制器中的VC个数大于1 或者 是present出来的VC时，才展示返回按钮，其他情况不展示
    if (isShowLiftBack && ( VCCount > 1 || self.navigationController.presentingViewController != nil)) {
        [self addNavigationItemWithTitles:@[@"返回"] isLeft:YES target:self action:@selector(backBtnClicked) tags:nil];
        
//        [self addNavigationItemWithImageNames:@[@"quanju_return"] isLeft:YES target:self action:@selector(backBtnClicked) tags:nil];
        
    } else {
        self.navigationItem.hidesBackButton = YES;
        UIBarButtonItem * NULLBar=[[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
        self.navigationItem.leftBarButtonItem = NULLBar;
    }
}
- (void)backBtnClicked
{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
//    NSMutableArray * items = [[NSMutableArray alloc] init];
//    NSInteger i = 0;
//    for (NSString * imageName in imageNames) {
//        //        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//        //        backView.backgroundColor=RedColor;
//        //        backView.userInteractionEnabled=YES;
//        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        //        [backView addSubview:btn];
//        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//        btn.frame = CGRectMake(0, 0, 30, 30);
//        if(isLeft){
//            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
//        }else{
//            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
//            
//        }
//        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//        
//        btn.tag = [tags[i++] integerValue];
//        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
//        [items addObject:item];
//        
//    }
//    if (isLeft) {
//        self.navigationItem.leftBarButtonItems = items;
//    } else {
//        self.navigationItem.rightBarButtonItems = items;
//    }
}

- (void)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    
//    NSMutableArray * items = [[NSMutableArray alloc] init];
//    
//    //调整按钮位置
//    UIBarButtonItem* spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    //将宽度设为负值
//    spaceItem.width= -10;
//    
//    [items addObject:spaceItem];
//    NSInteger i = 0;
//    for (NSString * title in titles) {
//        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
//        btn.frame = CGRectMake(0, 0, 30, 20);
//        [btn setTitle:title forState:UIControlStateNormal];
//        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//        btn.titleLabel.font = SYSTEMFONT(16);
//        [btn setTitleColor:KWhiteColor forState:UIControlStateNormal];
//        btn.tag = [tags[i++] integerValue];
//        [btn sizeToFit];
//        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
//        [items addObject:item];
//    }
//    if (isLeft) {
//        self.navigationItem.leftBarButtonItems = items;
//    } else {
//        self.navigationItem.rightBarButtonItems = items;
//    }
}

//取消请求
- (void)cancelRequest
{
    
}

- (void)dealloc
{
    [self cancelRequest];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
