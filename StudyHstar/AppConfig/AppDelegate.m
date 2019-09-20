//
//  AppDelegate.m
//  StudyHstar
//
//  Created by macbook on 2019/9/20.
//  Copyright © 2019 hstar. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //    NSString *key = @"CFBundleVersion";
    //    // 取出沙盒中存储的上次使用软件的版本号
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //    NSString *lastVersion = [defaults stringForKey:key];
    //    // 获得当前软件的版本号
    //    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    //    //添加版本判断启动图
    //    if ([currentVersion isEqualToString:lastVersion]) {
    BaseTabBarController *tab=[BaseTabBarController tabBarController];
    self.window.rootViewController=tab;
    
    //    } else { // 新版本
    //        NewfeatureViewController *vc=[[NewfeatureViewController alloc]init];
    //        self.window.rootViewController=vc;
    //
    //        [defaults setObject:currentVersion forKey:key]; // 存储新版本
    //        [defaults synchronize];
    //    }
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];//小红点
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
