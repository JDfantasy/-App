//
//  secondViewController.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/12.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"召唤师查询"];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClicked:)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    [self.view setBackgroundColor:[UIColor colorWithRed:236/255.0 green:234/255.0 blue:241/255.0 alpha:1]];
}
#pragma mark -- 导航栏左侧按钮的点击事件
- (void)leftBarButtonItemClicked:(UIBarButtonItem *)barBtn{
    [self.navigationController popToRootViewControllerAnimated:YES];


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
