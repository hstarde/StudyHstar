//
//  BaseController.m
//  PaoPao
//
//  Created by macbook on 2018/3/23.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

//是否可以旋转
- (BOOL)shouldAutorotate
{
    return NO;
}
//支持
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
//默认
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.navigationController.childViewControllers.count > 1) {
        [self setBackButton];
    }
    self.page=1;
    [self setLGS];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *version = [UIDevice currentDevice].systemVersion;
    if (version.doubleValue >= 10.0&&version.doubleValue < 11.0) {
        //处理ios10的导航条消失问题
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSString *version = [UIDevice currentDevice].systemVersion;
    if (version.doubleValue >= 10.0&&version.doubleValue < 11.0) {
        //处理ios10的导航条消失问题
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
    }
    
}

-(void)setLGS{
    
}
/**
 *  设置返回按钮
 */
-(void)setBackButton
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@" 返回" Image:@"back" highImage:@"back_sel" target:self action:@selector(backBtnClick)];
}
/**
 *  返回按钮 事件
 */
-(void)backBtnClick
{
    if (self.presentingViewController){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
