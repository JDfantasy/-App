//
//  secretCodeViewController.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/12.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "secretCodeViewController.h"
#import "ZHQUtil.h"
@interface secretCodeViewController ()
{
    NSInteger _seconds;
    UIButton *_timerBtn;
    NSTimer *_timer;

}

@property (nonatomic, strong) UITextField *userPhotoTextField;


@end

@implementation secretCodeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *imagesView =  [[UIImageView alloc]initWithFrame:self.view.bounds];
    //开启交换属性
    [imagesView setUserInteractionEnabled:YES];
    //设置颜色
    imagesView.backgroundColor = [UIColor whiteColor];
    //设置初始图片
    [imagesView setImage:[UIImage imageNamed:@"kate.png"]];
    [self.view addSubview:imagesView];
    //退出
    UIButton *goButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 28, 70, 50)];
    [self setButtonDateWithBtn:goButton title:@"退出" selector:@selector(leave:)];
    [goButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.view addSubview:goButton];

    //创建用户名文本框左视图Label
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [self setLableWithLable:userNameLabel title:@"手机号："];
    
    //创建用户名文本框
    _userPhotoTextField= [[UITextField alloc] initWithFrame:CGRectMake(goButton.frame.origin.x+goButton.frame.size.width+10, 28, self.view.frame.size.width-200, 50)];
    //设置弹出键盘类型
    [_userPhotoTextField setKeyboardType:UIKeyboardTypeDefault];
    [self setTextFieldDateWithTextField:_userPhotoTextField title:@"请输入手机号" lable:userNameLabel selector:@selector(limitUserPhotoString:)];
    [self.view addSubview:_userPhotoTextField];
    //验证码
    _timerBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-105, 28, 100, 50)];
    [self setButtonDateWithBtn:_timerBtn title:@"获取验证码" selector:@selector(testAndVerify:)];
    [self.view addSubview:_timerBtn];

}
#pragma mark -- 通过点击view退出键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_userPhotoTextField resignFirstResponder];
    
}
#pragma mark -- 配置按钮属性
- (void)setButtonDateWithBtn:(UIButton *)btn title:(NSString *)title selector:(SEL)selector{
    [btn setBackgroundColor:[UIColor colorWithRed:33/255.0 green:83/255.0 blue:155/255.0 alpha:1]];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:4];
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -- 配置Lable属性
- (void)setLableWithLable:(UILabel *)Lable title:(NSString *)title{
    [Lable setText:title];
    [Lable setTextColor:[UIColor blackColor]];
    [Lable setAdjustsFontSizeToFitWidth:YES];
    [Lable setBackgroundColor:[UIColor clearColor]];
    [Lable setTextAlignment:NSTextAlignmentRight];
    [Lable setFont:[UIFont systemFontOfSize:18]];
}
#pragma mark -- 配置TextField属性
- (void)setTextFieldDateWithTextField:(UITextField *)TextField title:(NSString *)title lable:(UIView *)selector0 selector:(SEL)selector{
    //设置边框样式
    [TextField setBorderStyle:UITextBorderStyleNone];
    //设置边框
    [TextField.layer setBorderWidth:1];
    [TextField.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    //设置背景色
    [TextField setBackgroundColor:[UIColor colorWithRed:150/255.0 green:170/255.0 blue:190/255.0 alpha:1]];
    //设置默认提示文字
    [TextField setPlaceholder:title];
    //设置字体大小
    [TextField setFont:[UIFont systemFontOfSize:14]];
    //设置字体颜色
    [TextField setTextColor:[UIColor blackColor]];
    //设置键盘显示时外观
    [TextField setKeyboardAppearance:UIKeyboardAppearanceDefault];
    //设置弹出键盘类型
    [TextField setKeyboardType:UIKeyboardTypeNumberPad];
    //设置清空按钮
    [TextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    //设置圆角
    [TextField.layer setMasksToBounds:YES];
    [TextField.layer setCornerRadius:4];
    //设置左视图
    [TextField setLeftView:(UIView*)selector0];
    [TextField setLeftViewMode:UITextFieldViewModeAlways];
    //添加点击事件
    [TextField addTarget:self action:selector forControlEvents:UIControlEventEditingChanged];
}
//验证响应事件
- (void)testAndVerify:(UIButton *)sender{
    [_timerBtn setEnabled:NO];
    
    _seconds = 60;
    
    [sender setTitle:@"60"forState:UIControlStateNormal];
    [sender.titleLabel setFont:[UIFont systemFontOfSize:14]];
    //设置计时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeTheTime:) userInfo:nil repeats:YES];
}
#pragma mark -- 计时器的响应事件
- (void)changeTheTime:(NSTimer *)timer{
    if (_seconds>1) {
        --_seconds; //每次进入减一秒
        [_timerBtn setTitle:[NSString stringWithFormat:@"%ld", _seconds] forState:UIControlStateNormal];
        [_timerBtn setEnabled:NO];
    }
    else{
        [_timerBtn setTitle:@"重新获取验证码" forState:UIControlStateNormal];

        //关闭并删除计时器
        [_timer invalidate];
        
        //设置button是否可以点击
        [_timerBtn setEnabled:YES];
        
        _seconds = 60;
    }
}
#pragma mark -- 手机号输入框的响应事件
- (void)limitUserPhotoString:(UITextField *)textField{
    if (textField.text.length > 11) {
        [textField setText:[textField.text substringToIndex:11]];
    }
}
#pragma mark -- 退出按钮的点击事件
- (void)leave:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
