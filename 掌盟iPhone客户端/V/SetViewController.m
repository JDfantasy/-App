//
//  SetViewController.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/11.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "SetViewController.h"
#import "LoginViewController.h"
#import "ZHQUtil.h"
@interface SetViewController ()
@property (nonatomic,strong) UIView *V;
@property (nonatomic,strong) UIView *V0;

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self.navigationItem setTitle:@"设置"];[self setUpView];
}
#pragma mark -- 配置视图
- (void)setUpView{
    UIView *view0 = [[UIView alloc] initWithFrame:self.view.bounds];
    [view0 setBackgroundColor:[UIColor lightGrayColor]];
    _V0 =view0;
    [self.view addSubview:view0];
    UIImageView *imagesView =  [[UIImageView alloc]initWithFrame:view0.bounds];
    //开启交换属性
    [imagesView setUserInteractionEnabled:YES];
    //设置初始图片
    [imagesView setImage:[UIImage imageNamed:@"LCY1.jpg"]];
    [view0 addSubview:imagesView];
    
    //添加按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 94, view0.frame.size.width, 60)];
    //设置按钮属性
    [self setButtonWithBtn:button title:@"绑定大区" selector:@selector(tieCalmRegion:)];
    [view0 addSubview:button];
    //添加按钮
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 184, view0.frame.size.width, 60)];
    //设置按钮属性
    [self setButtonWithBtn:button1 title:@"清除缓存" selector:@selector(chuckAwayRubbish:)];
    [view0 addSubview:button1];
    //添加按钮
    UIButton *button5 = [[UIButton alloc]initWithFrame:CGRectMake(0, 254, view0.frame.size.width, 60)];
    //设置按钮属性
    [self setButtonWithBtn:button5 title:@"灯光模式" selector:@selector(lamplight:)];
    [view0 addSubview:button5];
    //添加按钮
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 324, view0.frame.size.width, 60)];
    //设置按钮属性
    [self setButtonWithBtn:button2 title:@"意见反馈" selector:@selector(ideaFeedBack:)];
    [view0 addSubview:button2];
    //添加按钮
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(0, 394, view0.frame.size.width, 60)];
    //设置按钮属性
    [self setButtonWithBtn:button3 title:@"关于我们" selector:@selector(aboutOur:)];
    [view0 addSubview:button3];
    
    //添加按钮
    UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake((view0.frame.size.width-130)/2, 530, 130, 50)];
    
    //设置按钮属性
    [self setButtonWithBtn:button4 title:@"用户登录" selector:@selector(loginConsumer:)];
    //    [button4 setBackgroundColor:[UIColor colorWithRed:100/255.0 green:130/255.0 blue:160/255.0 alpha:1]];
    [view0 addSubview:button4];
    [self setUpViewtieCalmRegion];
    
}
- (void)setUpViewtieCalmRegion{
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height-(50*8+1*8+20), self.view.frame.size.width-10*2, 50*8+1*8+20)];
    
    //开启交换属性
    [view setUserInteractionEnabled:YES];
    //设置颜色
    view.backgroundColor = [UIColor whiteColor];
    //设置初始图片
    [view setImage:[UIImage imageNamed:@"006.jpg"]];
    [self.view addSubview:view];
    
    view.backgroundColor = [UIColor clearColor];
    _V= view;
    [self.view addSubview:view];
    
    //设置Label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 50)];
    label.backgroundColor = [UIColor clearColor];
    [label setText:@"请选择大区"];
    [label setFont:[UIFont systemFontOfSize:20]];
    label.textColor = [UIColor whiteColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    //设置边框
    [label.layer setBorderWidth:1];
    [label.layer setBorderColor:[UIColor clearColor].CGColor];
    //设置弧度
    [label.layer setMasksToBounds:YES];
    [label.layer setCornerRadius:4];
    [view addSubview:label];
    
    //添加按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 51, view.frame.size.width, 50)];
    //设置按钮属性
    [self setButtonWithBtn:button title:@"比尔吉沃特" selector:@selector(Cliched:)];
    //设置颜色
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [view addSubview:button];
    UIButton *button0 = [[UIButton alloc]initWithFrame:CGRectMake(0, 102, view.frame.size.width, 50)];
    //设置按钮属性
    [self setButtonWithBtn:button0 title:@"德玛西亚" selector:@selector(Cliched:)];
    //设置颜色
    [button0 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button0 setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    [view addSubview:button0];
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 153, view.frame.size.width, 50)];
    //设置按钮属性
    [self setButtonWithBtn:button1 title:@"弗雷尔卓德" selector:@selector(Cliched:)];
    //设置颜色
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    [view addSubview:button1];
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 204, view.frame.size.width, 50)];
    //设置按钮属性
    [self setButtonWithBtn:button2 title:@"无畏先锋" selector:@selector(Cliched:)];
    //设置颜色
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    [view addSubview:button2];
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(0, 255, view.frame.size.width, 50)];
    //设置按钮属性
    [self setButtonWithBtn:button3 title:@"怒瑞玛" selector:@selector(Cliched:)];
    //设置颜色
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    [view addSubview:button3];
    UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(0, 306, view.frame.size.width, 50)];
    //设置按钮属性
    [self setButtonWithBtn:button4 title:@"扭曲丛林" selector:@selector(Cliched:)];
    //设置颜色
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    [view addSubview:button4];
    UIButton *button5 = [[UIButton alloc]initWithFrame:CGRectMake(0, 366, view.frame.size.width, 50)];
    //设置按钮属性
    [self setButtonWithBtn:button5 title:@"取消" selector:@selector(Cliched:)];
    //设置颜色
    [button5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    [view addSubview:button5];
    
    [_V setFrame:CGRectMake(10, self.view.frame.size.height, self.view.frame.size.width-10*2, 0)];
}
#pragma mark -- 取消的响应事件
- (void)Cliched:(UIButton *)button{
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        //设置动画
        //设置缩小之后的frame
        [_V setFrame:CGRectMake(10, self.view.frame.size.height, self.view.frame.size.width-10*2, 0)];
        _V0.alpha = 1;
        
    } completion:^(BOOL finished) {
        //动画执行完毕，可以在里面做一些操作
    }];
    
}
#pragma mark -- 配置按钮属性
- (void)setButtonWithBtn:(UIButton *)btn title:(NSString *)title selector:(SEL)selector{
    //设置颜色
    [btn setBackgroundColor:[UIColor clearColor]];
    //设置边框
    [btn.layer setBorderWidth:1];
    [btn.layer setBorderColor:[UIColor clearColor].CGColor];
    
    //设置弧度
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:6];
    //设置按钮文本
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:24]];
    //设置颜色
    [btn setTitleColor:[UIColor colorWithRed:218/255.0 green:189/255.0  blue:73/255.0  alpha:1] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    //   titil靠左对齐
    //    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    //    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    //添加响应事件
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
}
//绑定大区的响应事件
- (void)tieCalmRegion:(UIButton *)sender{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        //设置放大之后的frame
        [_V setFrame:CGRectMake(10, self.view.frame.size.height-(50*8+1*8+20), self.view.frame.size.width-10*2,  50*8+1*8+20)];
        _V0.alpha = 0.3;
    } completion:^(BOOL finished) {
        //动画执行完毕，可以在里面做一些操作
    }];
    
    
}
//清除缓存
- (void)chuckAwayRubbish:(UIButton *)sender{
    [ZHQUtil alertWithMessage:@"已清理干净" andWithVC:self];
}
//灯光模式的响应事件
- (void)lamplight:(UIButton *)sender{
    [ZHQUtil alertWithMessage:@"正常灯光" andWithVC:self];
}
//关于我们的响应事件
- (void)aboutOur:(UIButton *)sender{
    [ZHQUtil alertWithMessage:@"神秘大陆探险开始了" andWithVC:self];
}

//意见反馈的响应事件
- (void)ideaFeedBack:(UIButton *)sender{
    [ZHQUtil alertWithMessage:@"功能完美" andWithVC:self];
}
//用户登录响应事件
- (void)loginConsumer:(UIButton *)sender{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
