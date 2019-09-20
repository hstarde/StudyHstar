//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+MJ.h"

@implementation MBProgressHUD (MJ)

#pragma mark 显示信息

+ (void)show:(NSString *)text
{
    if (text.length>0) {
        [self show:text icon:nil view:nil];
    }
}

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.label.text = text;
    hud.detailsLabel.text=text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 视图上控件的活动事件不会被阻塞
    hud.userInteractionEnabled = NO;
    
    // 2秒之后再消失
//    [hud hide:NO afterDelay:2.0];
    [hud hideAnimated:NO afterDelay:2.0];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

#pragma mark 显示成功信息
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.label.text = message;
    hud.detailsLabel.text=message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    // 视图上控件的活动事件不会被阻塞
    hud.userInteractionEnabled = YES;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:[UIApplication sharedApplication].keyWindow];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:[UIApplication sharedApplication].keyWindow];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:[UIApplication sharedApplication].keyWindow];
}

+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
@end
