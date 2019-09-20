//
//  NewfeatureViewController.m
//  CarAppBuyers
//
//  Copyright © 2015年 Copyright © 1998 - 2015 autoapp. All rights reserved.
//

#import "NewfeatureViewController.h"
#import "BaseTabBarController.h"


#import "BaseNavigationController.h"
//#import "HomeController.h"


#define kNewfeatureImageCount 4
#define kUIPageControlHidden YES
#define kCurrentPageIndicatorTintColor RGBColor(255, 255, 255)
#define kPageIndicatorTintColor RGBColor(59, 75, 174)
#define kbottomViewH 40

@interface NewfeatureViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic,strong) UIScrollView *scrollView;


@end

@implementation NewfeatureViewController

-(UIPageControl *)pageControl
{
    if (_pageControl==nil) {
        _pageControl=[[UIPageControl alloc] init];
                _pageControl.hidden = kUIPageControlHidden;
        _pageControl.numberOfPages = kNewfeatureImageCount;
//        CGFloat centerX = self.view.frame.size.width * 0.5;
//        CGFloat centerY = self.view.frame.size.height - 130;
//        _pageControl.center = CGPointMake(centerX, centerY);
        _pageControl.frame = CGRectMake(0, KScreenHeight-kbottomViewH, KScreenWidth, kbottomViewH);
        _pageControl.userInteractionEnabled = NO;
        _pageControl.backgroundColor=[UIColor clearColor];
        // 2.设置圆点的颜色
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor =[UIColor grayColor];
    }
    return _pageControl;
}

-(UIScrollView *)scrollView
{
    if (_scrollView==nil) {
        _scrollView=[[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        _scrollView.delegate = self;
    }
    return _scrollView;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 添加UISrollView
    [self setupScrollView];
}

/**
 *  添加UISrollView
 */
- (void)setupScrollView {
    
    
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
    // 添加图片
    CGFloat imageW = self.scrollView.frame.size.width;
    CGFloat imageH = self.scrollView.frame.size.height;
    
    for (int index = 0; index < kNewfeatureImageCount; index++) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        
        imageView.userInteractionEnabled = YES;
        NSString *name;
        if (IS_IPHONE_Xs_Max) {
            name = [NSString stringWithFormat:@"1-%diPhoneXS-Max", index + 1];
        }else if(IS_IPHONE_Xr){
            name = [NSString stringWithFormat:@"1-%diPhoneXR", index + 1];
        }else if(IS_IPHONE_X){
            name = [NSString stringWithFormat:@"1-%diPhoneX", index + 1];
        }else if(kiPhone6Plus){
            name = [NSString stringWithFormat:@"1-%diPhone6Plus", index + 1];
        }else if(kiPhone6){
            name = [NSString stringWithFormat:@"1-%diPhone6", index + 1];
        }else if(kiPhone5){
            name = [NSString stringWithFormat:@"1-%diPhone5", index + 1];
        }else if(kiPhone4){
            name = [NSString stringWithFormat:@"1-%diPhone4s", index + 1];
        }else{
            name = [NSString stringWithFormat:@"1-%diPhone6", index + 1];
        }
        imageView.image = [UIImage imageNamed:name];
        
        // 设置frame
        CGFloat imageX = index * imageW;
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        
       
        [self.scrollView addSubview:imageView];
        
        // 在最后一个图片上面添加点击事件
        if (index == kNewfeatureImageCount - 1) {
            [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(start)]];
            self.imageView = imageView;
        }
    }
    
    // 设置滚动的内容尺寸
    self.scrollView.contentSize = CGSizeMake(imageW * kNewfeatureImageCount, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
}

/**
 *  点击进入首页
 */
- (void)start//:(UITapGestureRecognizer *)recognizer
{
//    [UIApplication sharedApplication].statusBarHidden = NO;
    // 切换窗口的根控制器

    BaseTabBarController *tab=[BaseTabBarController tabBarController];
    self.view.window.rootViewController=tab;
    
//    HomeController *homeVC = STBVC(@"Home",@"HomeController");
//    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:homeVC];
//    self.view.window.rootViewController=homeNav;
    
    
    
}

/**
 *  只要UIScrollView滚动了,就会调用
 *
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 取出水平方向上滚动的距离
    CGFloat offsetX = scrollView.contentOffset.x;
    // 求出页码
    CGFloat pageDouble = offsetX / scrollView.frame.size.width;
    NSInteger pageInt = (NSInteger)(pageDouble + 0.5);
    self.pageControl.currentPage = pageInt;
}

@end
