//
//  AppDelegate.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/11.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "AppDelegate+EAIntroView.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //设置导航栏字体颜色
    NSDictionary *textAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:218/255.0 green:189/255.0  blue:73/255.0  alpha:1]};
    [[UINavigationBar appearance]setTitleTextAttributes:textAttributes];
    //设置根视图控制器
    RootViewController *rootVC = [[RootViewController alloc]init];
    [self.window setRootViewController:rootVC];
    _rootViewController = rootVC;
    //if (![[NSUserDefaults standardUserDefaults]objectForKey:@"isFirstLogin"]) {
    // [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstLogin"];
    [self showIntroWithCrossDissolve];
    //}

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
