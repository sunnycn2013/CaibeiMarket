//
//  MainTabBarController.m
//  MiAiApp
//
//  Created by icaibei on 2017/5/18.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import "MainTabBarController.h"

#import "RootNavigationController.h"
#import "CMHomeViewController.h"
#import "PersonListViewController.h"
#import "CMBorrowViewController.h"
#import "CMFindViewController.h"
#import "MineViewController.h"
#import "TabBarItem.h"

@interface MainTabBarController ()<TabBarDelegate>

@property (nonatomic,strong) NSMutableArray * VCS;//tabbar root VC

@end

@implementation MainTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化tabbar
    [self setUpTabBar];

    //添加子控制器
    [self setUpAllChildViewController];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self removeOriginControls];
}

#pragma mark ————— 初始化TabBar —————
-(void)setUpTabBar{
    [self.tabBar addSubview:({
        
        TabBar *tabBar = [[TabBar alloc] init];
        tabBar.frame     = self.tabBar.bounds;
        tabBar.delegate  = self;
        
        self.TabBar = tabBar;
    })];
    
}
#pragma mark - ——————— 初始化VC ————————
-(void)setUpAllChildViewController{
    _VCS = @[].mutableCopy;
    CMHomeViewController *homeVC = [CMHomeViewController new];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"tab_index_normal" seleceImageName:@"tab_index_light"];
    
    CMBorrowViewController *makeFriendVC = [[CMBorrowViewController alloc]init];
    [self setupChildViewController:makeFriendVC title:@"贷款" imageName:@"tab_dai_normal" seleceImageName:@"tab_dai_light"];
    
    CMFindViewController *msgVC = [[CMFindViewController alloc]init];
    [self setupChildViewController:msgVC title:@"发现" imageName:@"tab_find_normal" seleceImageName:@"tab_find_light"];
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    [self setupChildViewController:mineVC title:@"我的" imageName:@"tab_my_normal" seleceImageName:@"tab_my_light"];
    
    self.viewControllers = _VCS;
}

-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    //    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];

//    controller.tabBarItem.badgeValue = _VCS.count%2==0 ? @"100": @"1";
    //包装导航控制器
    RootNavigationController *nav = [[RootNavigationController alloc]initWithRootViewController:controller];
    controller.title = title;
    [_VCS addObject:nav];
    
}

#pragma mark ————— 统一设置tabBarItem属性并添加到TabBar —————
- (void)setViewControllers:(NSArray *)viewControllers {
    
    self.TabBar.badgeTitleFont         = SYSTEMFONT(11.0f);
    self.TabBar.itemTitleFont          = SYSTEMFONT(10.0f);
    self.TabBar.itemImageRatio         = self.itemImageRatio == 0 ? 0.7 : self.itemImageRatio;
//    self.TabBar.itemTitleColor         = KBlackColor;
    self.TabBar.itemTitleColor         = [UIColor colorWithHexString:@"#999999"];
    self.TabBar.selectedItemTitleColor = CNavBgColor;
    
    self.TabBar.tabBarItemCount = viewControllers.count;
    
    [viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIViewController *VC = (UIViewController *)obj;
        
        UIImage *selectedImage = VC.tabBarItem.selectedImage;
        VC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [self addChildViewController:VC];
        
        [self.TabBar addTabBarItem:VC.tabBarItem];
    }];
}

#pragma mark ————— 选中某个tab —————
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    
    [super setSelectedIndex:selectedIndex];
    
    self.TabBar.selectedItem.selected = NO;
    self.TabBar.selectedItem = self.TabBar.tabBarItems[selectedIndex];
    self.TabBar.selectedItem.selected = YES;
}

#pragma mark ————— 取出系统自带的tabbar并把里面的按钮删除掉 —————
- (void)removeOriginControls {
    
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
        
        if ([obj isKindOfClass:[UIControl class]]) {
            
            [obj removeFromSuperview];
        }
    }];
}


#pragma mark - TabBarDelegate Method

- (void)tabBar:(TabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to {
    
    self.selectedIndex = to;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
