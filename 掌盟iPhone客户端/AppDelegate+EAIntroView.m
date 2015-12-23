//
//  AppDelegate+EAIntroView.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/12.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "AppDelegate+EAIntroView.h"
#import "EAIntroPage.h"
#import "EAIntroView.h"
@implementation AppDelegate (EAIntroView)
- (void)showIntroWithCrossDissolve{
    EAIntroPage *introPageOne = [EAIntroPage page];
    introPageOne.bgImage = [UIImage imageNamed:@"zb01.png"];
    EAIntroPage *introPageTwo = [EAIntroPage page];
    introPageTwo.bgImage = [UIImage imageNamed:@"zb02.png"];
    EAIntroPage *introPageThree = [EAIntroPage page];
    introPageThree.bgImage = [UIImage imageNamed:@"zb03.png"];
    EAIntroPage *introPageFour = [EAIntroPage page];
    introPageFour.bgImage = [UIImage imageNamed:@"zb04.png"];
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.rootViewController.view.bounds andPages:@[introPageOne,introPageTwo,introPageThree,introPageFour]];
    //[intro setDelegate:self];
    [intro showInView:self.rootViewController.view animateDuration:0.0];

}

@end
