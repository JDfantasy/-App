//
//  DiscoverViewController.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/11.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "DiscoverViewController.h"
#import "firstViewController.h"
#import "secondViewController.h"
#import "thirdViewController.h"
#import "ZHQUtil.h"
#define BUTTONWHITE self.view.frame.size.width/3
@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor cyanColor]];
    [self.navigationItem setTitle:@"发现"];
    //创建UIScrollView对象
    //UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44)];
    //设置背景色
    [scrollView setBackgroundColor:[UIColor colorWithRed:236/255.0 green:234/255.0 blue:241/255.0 alpha:1]];
    //设置滚动范围
    [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 80+20+(43+20)+87+20+87+20+43+20+131)];
    //隐藏水平滚动条
    [scrollView setShowsHorizontalScrollIndicator:NO];
    //隐藏垂直滚动条
    [scrollView setShowsVerticalScrollIndicator:NO];
    NSArray *array= @[@"7.27.39.png", @"7.30.46.png", @"7.31.11.png"];
    NSArray *textArray= @[@"英雄资料", @"召唤师查询", @"附近玩家"];
    for (NSInteger i=0; i<3; i++) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(BUTTONWHITE*i, 0, BUTTONWHITE, 80)];
        button.backgroundColor=[UIColor whiteColor];
        button.tag=1000+i;
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake((BUTTONWHITE-35)/2+BUTTONWHITE*i, 15, 35, 35)];
        imageView.backgroundColor=[UIColor whiteColor];
        imageView.image=[UIImage imageNamed:array[i]];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(BUTTONWHITE*i, 60, BUTTONWHITE, 18)];
        label.text=textArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        //添加响应事件
        
        [button addTarget:self action:@selector(nextView:) forControlEvents:UIControlEventTouchUpInside];
        label.font=[UIFont systemFontOfSize:16];
        label.backgroundColor=[UIColor whiteColor];
        [scrollView addSubview:button];
        [scrollView addSubview:label];
        [scrollView addSubview:imageView];
    }
    NSArray *frameArray=@[@"100",@"163",@"207",@"270",@"314",@"377",@"440",@"484",@"528"];
    
    NSArray *labelText=@[@"对战助手",@"物品资料",@"天赋模拟",@"官方论坛",@"兴趣部落",@"英雄时刻",@"掌盟二维码",@"扫一扫",@"知识学院"];
    for (NSInteger i=0; i<9; i++) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, [frameArray[i]floatValue], self.view.frame.size.width, 43)];
        button.backgroundColor=[UIColor whiteColor];
        button.tag=2000+i;
        [button addTarget:self action:@selector(pushView:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(50, [frameArray[i] floatValue], 200, 43)];
        lable.backgroundColor=[UIColor clearColor];
        lable.text=labelText[i];
        UILabel *moreLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-30,[frameArray[i] floatValue],50 , 43)];
        moreLabel.text=@">";
        moreLabel.backgroundColor=[UIColor clearColor];
        moreLabel.textColor=[UIColor colorWithRed:236/255.0 green:234/255.0 blue:241/255.0 alpha:1];
        [scrollView addSubview:button];
        [scrollView addSubview:moreLabel];
        
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 11+[frameArray[i] floatValue], 22, 22)];
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",i+1]];
        [scrollView addSubview:imageView];
        [scrollView addSubview:lable];
    }
    NSArray *lineframeArray= @[@"206",@"313",@"483",@"527"];
    for (NSInteger a=0; a<4; a++) {
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,[lineframeArray[a] floatValue], 14, 1)];
        lineLabel.backgroundColor=[UIColor whiteColor];
        
        [scrollView addSubview:lineLabel];
    }
    
    
    [self.view addSubview:scrollView];
    
}
//对战助手等点击时间
-(void)pushView:(UIButton *)btn{
    NSLog(@"123");
}
//英雄资料~~附近玩家的点击事件
-(void)nextView:(UIButton *)btn{
    if (btn.tag==1000) {
        firstViewController *firstVC=[[firstViewController alloc]init];
        [self.navigationController pushViewController:firstVC animated:YES];
    }
    if (btn.tag==1001) {
        secondViewController *secondVC=[[secondViewController alloc]init];
        [self.navigationController pushViewController:secondVC animated:YES];
    }
    if (btn.tag==1002) {
        [ZHQUtil alertWithTwoMessage:@"请在你iPhone中设置-隐私-定位服务，进入并打开对“掌上英雄联盟”的定位，即可进入附近的人群" andWithVC:self];
        return;
        
        //thirdViewController *thirdVC=[[thirdViewController alloc]init];
        // [self.navigationController pushViewController:thirdVC animated:YES];
    }
    
    
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
