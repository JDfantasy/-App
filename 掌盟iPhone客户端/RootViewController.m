//
//  RootViewController.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/11.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "RootViewController.h"
#import "InformationViewController.h"
#import "FriendViewController.h"
#import "DiscoverViewController.h"
#import "SetViewController.h"
#import "RDVTabBarItem.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor cyanColor]];
    [self createViewControllers];
}
#pragma mark - 配置tabbar对应的视图
- (void)createViewControllers{
    //咨询
    InformationViewController *inforVC = [[InformationViewController alloc]init];
    UINavigationController *inforNav = [[UINavigationController alloc]initWithRootViewController:inforVC];
    //好友
    FriendViewController *friendVC = [[FriendViewController alloc]init];
    UINavigationController *friendNav = [[UINavigationController alloc]initWithRootViewController:friendVC];
    //发现
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc]init];
    UINavigationController *discoverNav = [[UINavigationController alloc]initWithRootViewController:discoverVC];
    //设置
    SetViewController *setVC = [[SetViewController alloc]init];
    UINavigationController *setNav = [[UINavigationController alloc]initWithRootViewController:setVC];
    //调用RDV三方方法，设置VC
    [self setViewControllers:@[inforNav,friendNav,discoverNav,setNav]];
    [self setUpTabBarAttributes];
}
#pragma mark - 配置标签栏属性
- (void)setUpTabBarAttributes{
    //图片资源暂时用不相关的照片代替
    
    NSArray *tabBarItemImagesArray = @[@"home",@"maps",@"myplan",@"settings"];
    NSArray *vcNameArray = @[@"资讯",@"好友",@"发现",@"设置"];
    //attributes： 属性 属性字符串
    NSDictionary *textAttributes_unselected = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:12]};
    NSDictionary *textAttributes_selected = @{NSForegroundColorAttributeName:[UIColor colorWithRed:41/255.0 green:165/255.0 blue:251/255.0 alpha:1]};
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar]items]) {
        UIImage *selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",[tabBarItemImagesArray objectAtIndex:index]]];
        UIImage *unSelectedImage = [UIImage imageNamed:[tabBarItemImagesArray objectAtIndex:index]];
        //设置选中状态下和没选中状态下的Image
        [item setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unSelectedImage];
        [item setBackgroundSelectedImage:[UIImage imageNamed:@"tabbar.png"] withUnselectedImage:[UIImage imageNamed:@"tabbar.png"]];
        [item setSelectedTitleAttributes:textAttributes_selected];
        [item setUnselectedTitleAttributes:textAttributes_unselected];
        [item setTitle:[vcNameArray objectAtIndex:index]];
        index+=1;
    }

}

@end
