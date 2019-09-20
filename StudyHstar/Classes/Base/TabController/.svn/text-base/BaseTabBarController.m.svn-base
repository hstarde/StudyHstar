//
//  BaseTabBarController.m
//  BaseProject
//
//  Created by macbook on 17/2/10.
//  Copyright © 2017年 hstar. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomeController.h"
#import "MyController.h"


@interface BaseTabBarController ()<UITabBarControllerDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) BaseNavigationController *homeNav;
@property (nonatomic, strong) BaseNavigationController *myNav;


@end

@implementation BaseTabBarController



- (BOOL)shouldAutorotate
{
    return [[self.viewControllers objectAtIndex:(int)self.selectedIndex] shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [[self.viewControllers objectAtIndex:(int)self.selectedIndex] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self.viewControllers objectAtIndex:(int)self.selectedIndex] preferredInterfaceOrientationForPresentation];
}

+ (instancetype)tabBarController {
    
    return [[self alloc] init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景图片
    [self setupBarBackgroundImg];
    // 修改TabBar背景样式
    [self setUpTabBarStyle];
    // 修改TabBarItem文字样式
    [self setUpTabBarItemStyle];
    
    // 添加所有子控制器
    [self setUpViewControllers];
    //去除黑线 设置背景
//    [self configureStyle];
}
#pragma mark - 修改TabBar背景样式

- (void)setUpTabBarStyle {
    self.delegate = self;
    self.tabBar.barTintColor = [UIColor whiteColor];
    
}

- (void)configureStyle{
    
    //去掉上部的黑色线条，
    //设置取消tabBar上面的黑色线条
    //去掉tabBar顶部线条
    CGRect rect = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];
    
    UIImageView *imv=[[UIImageView alloc]initWithImage:[UIImage imageWithOriginalName:@"nav_bg"]];
    imv.frame=CGRectMake(0, 0, KScreenWidth, self.tabBar.height);
    
    [self.tabBar insertSubview:imv atIndex:0];
    
    //    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg"]];
}
/**
 *  设置导航栏背景
 */
- (void)setupBarBackgroundImg
{
    //    UIImage *tabBarBackgroundImage = [UIImage imageWithOriginalName:@"tab_bg"];
    //
    //    CGFloat top = 0; // 顶端盖高度
    //    CGFloat bottom = 0 ; // 底端盖高度
    //    CGFloat left = 1; // 左端盖宽度
    //    CGFloat right = 1; // 右端盖宽度
    //    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    //    tabBarBackgroundImage = [tabBarBackgroundImage resizableImageWithCapInsets:insets];
    //
    //
    //
    ////        tabBarBackgroundImage.resizingMode = UIImageResizingModeStretch;
    //    self.tabBar.backgroundImage = tabBarBackgroundImage;
}
#pragma mark - 修改TabBarItem文字样式

- (void)setUpTabBarItemStyle {
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    // 设置文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = KRGBColor(95, 96, 97);
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor hex:@"EEB741"];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

#pragma mark - 添加所有的子控制器

- (void)setUpViewControllers {
    
    HomeController *homeVC = [[HomeController alloc]init];
    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:homeVC];
    homeNav.tabBarItem.tag = 0;
    homeNav.tabBarItem.title = @"设备";
    homeNav.tabBarItem.image = [UIImage imageWithOriginalName:@"tab_mydevice"];
    homeNav.tabBarItem.selectedImage = [UIImage imageWithOriginalName:@"tab_mydevice_sel"];
    _homeNav = homeNav;
    
    MyController *myVC = [[MyController alloc]init];
    BaseNavigationController *myNav = [[BaseNavigationController alloc] initWithRootViewController:myVC];
    myNav.tabBarItem.tag = 1;
    myNav.tabBarItem.title = @"我的";
    myNav.tabBarItem.image = [UIImage imageWithOriginalName:@"tab_my"];
    myNav.tabBarItem.selectedImage = [UIImage imageWithOriginalName:@"tab_my_sel"];
    _myNav = myNav;

    self.viewControllers = @[homeNav,myNav];
}


#pragma mark - tabBarController delegate
//即将点击tab按钮
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (viewController.tabBarItem.tag == 2) {
        return NO;
    }
    return YES;
}


@end
