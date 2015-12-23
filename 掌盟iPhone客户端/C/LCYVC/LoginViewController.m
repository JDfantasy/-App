//
//  LoginViewController.m
//  UITextField的使用
//
//  Created by JD－高 on 15/9/10.
//  Copyright (c) 2015年 JD－高. All rights reserved.
//

#import "LoginViewController.h"
#import "ZHQUtil.h"
#import "secretCodeViewController.h"
@interface LoginViewController()<UITextFieldDelegate>{
    NSArray *textArr;
    UILabel *Label;
    NSInteger index;
}

@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passWordTextField;
@property (nonatomic, strong) NSMutableArray *imagesArray;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation LoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    textArr = [[NSArray alloc] init];
    
    UIImageView *imagesView =  [[UIImageView alloc]initWithFrame:self.view.bounds];
    //开启交换属性
    [imagesView setUserInteractionEnabled:YES];
    //设置颜色
    imagesView.backgroundColor = [UIColor whiteColor];
    //设置初始图片
    [imagesView setImage:[UIImage imageNamed:@"003.png"]];
    [self.view addSubview:imagesView];
    
    
    _imagesArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self.view setBackgroundColor:[UIColor colorWithRed:15/255.0 green:25/255.0 blue:30/255.0 alpha:1]];
    [self setUpView];
}

#pragma mark -- 配置视图
- (void)setUpView{
    //背景图片
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 15, 100, 100)];
    [self.view addSubview:_imageView];
    for (NSInteger i=0; i<20; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"0%ld.png", i]];
        [_imagesArray addObject:image];
    }
    [self animationWithAnimationImages:_imagesArray animationDuration:100.0 animationRepeatCount:0];
    
    //创建用户名文本框左视图Label
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    [self setLableWithLable:userNameLabel title:@"用户名："];
    
    //创建用户名文本框
    UITextField *userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-340)/2, 280, 340, 50)];
    //设置弹出键盘类型
    [userNameTextField setKeyboardType:UIKeyboardTypeDefault];
    [self setTextFieldDateWithTextField:userNameTextField title:@"输入用户名" lable:userNameLabel selector:@selector(limitUserNameString:)];
    //设置代理
    [userNameTextField setDelegate:self];
    _userNameTextField = userNameTextField;
    [self.view addSubview:userNameTextField];
    
    UILabel *passWordFieldLeftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    [self setLableWithLable:passWordFieldLeftLabel title:@"密码："];
    
    
    UITextField *passWordTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-340)/2, _userNameTextField.frame.size.height+280+10, 340, 50)];
    //设置弹出键盘类型
    [passWordTextField setKeyboardType:UIKeyboardTypeNumberPad];
    //设置加密隐藏状态
    [passWordTextField setSecureTextEntry:YES];
    [self setTextFieldDateWithTextField:passWordTextField title:@"输入密码 密码为6位" lable:passWordFieldLeftLabel selector:@selector(limitPassWordStirng:)];
    _passWordTextField = passWordTextField;
    //设置代理
    [_passWordTextField setDelegate:self];
    [self.view addSubview:_passWordTextField];
    
    //登录按钮
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-150*2-40)/2, _passWordTextField.frame.size.height+_passWordTextField.frame.origin.y+10, 150, 50)];
    //loginBtn.imageView.image = [UIImage imageNamed:@"login_btn_blue_nor.jpg"];
    [self setButtonDateWithBtn:loginBtn title:@"登录" selector:@selector(presentLoginVC:)];
    [self.view addSubview:loginBtn];
    //注册
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-150*2-40)/2+190,_passWordTextField.frame.size.height+_passWordTextField.frame.origin.y+10, 150, 50)];
    [self setButtonDateWithBtn:registerBtn title:@"注册" selector:@selector(presentRegisterVC:)];
    [self.view addSubview:registerBtn];
    
    textArr = @[@"断剑重铸之日 其势归来之时",
                @"别跑啊我的心肝 吓老子一跳",
                @"刀下生 刀下死",
                @"又是一具阴沟里的尸体",
                @"提莫队长正在待命",
                @"是时候表演真正的技术了",
                @"一朵菊花先到 随后枪出如龙",
                @"你看见我的小熊了么？",
                @"好想射点什么",
                @"我的大刀已饥渴难耐",
                @"你的剑 就是我的剑",
                @"人在塔在",
                @"我用双手成就你的梦想",
                @"犯我德邦者，随远必诛",
                @"你要来几发吗",
                @"收获之月 多美妙的名字啊"];

    //江湖格言
    Label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-340)/2, _passWordTextField.frame.size.height+30+ loginBtn.frame.origin.y, 340, 50)];
    [Label setTextColor:[UIColor colorWithRed:147/255.0 green:103/255.0 blue:44/255.0 alpha:1]];
    [Label setBackgroundColor:[UIColor clearColor]];
    [Label setText:@"欢迎来到英雄联盟"];
    //自适应缩小
    // Label.adjustsFontSizeToFitWidth =YES;
    //适应换行
    
    [Label setTextAlignment:NSTextAlignmentCenter];
    [Label setFont:[UIFont systemFontOfSize:25]];
    [self.view addSubview:Label];
    //设置计时器
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(changeTheText:) userInfo:nil repeats:YES];
    //返回设置
    UIButton *goButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-110*2-40)/2, _passWordTextField.frame.size.height+loginBtn.frame.size.height+loginBtn.frame.origin.y+60, 110, 50)];
    [self setButtonDateWithBtn:goButton title:@"安全返回" selector:@selector(leave:)];
    [goButton setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:goButton];
    
    //忘记密码
    UIButton *secretCodeBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-110*2-40)/2+150, _passWordTextField.frame.size.height+loginBtn.frame.size.height+loginBtn.frame.origin.y+60, 110, 50)];
    [self setButtonDateWithBtn:secretCodeBtn title:@"忘记密码？" selector:@selector(presentsecretCodeVC:)];
    [secretCodeBtn setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:secretCodeBtn];
    
    //竖线
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-1)/2, _passWordTextField.frame.size.height+loginBtn.frame.size.height+loginBtn.frame.origin.y+70, 1, 30)];
    [label setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:label];

    
    
}
- (void)animationWithAnimationImages:(NSMutableArray *)imageArray animationDuration:(NSTimeInterval)timeInterval animationRepeatCount:(NSInteger)repeatCount{
    //提取图片
    [_imageView setAnimationImages:imageArray];
    //动画执行时间
    [_imageView setAnimationDuration:timeInterval];
    //动画执行次数
    [_imageView setAnimationRepeatCount:repeatCount];
    //开始执行动画
    [_imageView startAnimating];
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
    [TextField setFont:[UIFont systemFontOfSize:18]];
    //设置字体颜色
    [TextField setTextColor:[UIColor blackColor]];
    //设置键盘显示时外观
    [TextField setKeyboardAppearance:UIKeyboardAppearanceDefault];
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
#pragma mark -- 配置按钮属性
- (void)setButtonDateWithBtn:(UIButton *)btn title:(NSString *)title selector:(SEL)selector{
    [btn setBackgroundColor:[UIColor colorWithRed:33/255.0 green:83/255.0 blue:155/255.0 alpha:1]];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:4];
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
}
- (void)changeTheText:(NSTimer *)timer{
    index = (index + 1)%textArr.count;
        [Label setText:textArr[index]];
// 自动换行
//    [Label setNumberOfLines:0];
//    Label.lineBreakMode = NSLineBreakByWordWrapping;

}
#pragma mark -- 退出按钮的点击事件
- (void)leave:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- 注册按钮的点击事件
- (void)presentRegisterVC:(UIButton *)btn{
}

#pragma mark -- 密码按钮的点击事件
- (void)presentsecretCodeVC:(UIButton *)btn{
    secretCodeViewController *secret = [[secretCodeViewController alloc] init];
    [self presentViewController:secret animated:YES completion:nil];
}

#pragma mark -- 通过点击view退出键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_userNameTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
}

#pragma mark -- 用户名输入框的响应事件
- (void)limitUserNameString:(UITextField *)textField{
    if (textField.text.length > 12) {
        [textField setText:[textField.text substringToIndex:12]];
    }
}

#pragma mark -- 密码输入框的响应事件
- (void)limitPassWordStirng:(UITextField *)textField{
    if (textField.text.length > 6) {
        [textField setText:[textField.text substringToIndex:6]];
        
    }
 }
#pragma mark -- 登录按钮的点击事件
- (void)presentLoginVC:(UIButton *)btn{
    if (_userNameTextField.text.length == 0) {
       [ZHQUtil alertWithMessage:@"用户名不能为空" andWithVC:self];
    }
    else if (_passWordTextField.text.length == 0){
        [ZHQUtil alertWithMessage:@"密码不能为空" andWithVC:self];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
#pragma mark -- UITextFieldDelegate
//是否允许编辑
// return NO to disallow editing.
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == _passWordTextField) {
        if (_userNameTextField.text.length == 0) {
            [ZHQUtil alertWithMessage:@"用户名不能为空" andWithVC:self];
            //开启键盘
            [_userNameTextField becomeFirstResponder];
            return NO;
        }
    }
    return YES;
}

@end







