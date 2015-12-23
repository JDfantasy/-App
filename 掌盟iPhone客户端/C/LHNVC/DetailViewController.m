//
//  DetailViewController.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/16.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIWebView *webView = [[UIWebView alloc] init];
    [webView setBackgroundColor:[UIColor clearColor]];
    //[webView set];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DETAIL_URL,((hangmengModel *)self.modelArray[self.index]).article_url]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    self.view = webView;
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
