//
//  InformationViewController.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/11.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "InformationViewController.h"
#define BOUNDSWIDTH self.view.frame.size.width
#define BOUNDSHEIGHT self.view.frame.size.height
#import "BaseTableViewController.h"

@interface InformationViewController ()<UIScrollViewDelegate>{
    NSString *urlStr;

}

@property (nonatomic,strong) UIScrollView *titleScrollView;
@property (nonatomic,strong) UIScrollView *showScrollView;
//展示图片的imageView
@property (nonatomic,strong) UIImageView *showImageView;
@property (nonatomic,assign) NSInteger tapTag;
@property (nonatomic,strong) UIPageControl *pageControl;

//@property (nonatomic, strong)NSMutableArray *modelArray;
@property (nonatomic, strong) BaseTableViewController *BaseTableView;
@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tapTag = 100;
 //   _modelArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //[self.navigationItem setTitle:@"资讯"];
    [self loadNews:100];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_max.JPG"] forBarMetrics:UIBarMetricsDefault];
    [self setUpView];
}
#pragma mark - 配置视图
- (void)setUpView{
    //存放标题的数组
    NSArray *titlesArray = @[@"最新",@"赛事",@"娱乐",@"官方",@"美女",@"攻略",@"活动"];
    float jianxi = 25;
    float btnWidth = (BOUNDSWIDTH-15*2-jianxi*3)/4;
    _titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 0, BOUNDSWIDTH-10, 44)];
    [self.navigationItem setTitleView:_titleScrollView];
    for (NSInteger i = 0; i<titlesArray.count; i++) {
        UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(10+(jianxi)*i+(btnWidth)*i, 0, btnWidth, 44)];
        [titleBtn setTitle:[titlesArray objectAtIndex:i] forState:UIControlStateNormal];
        titleBtn.tag = 100+i;
        if (_tapTag ==titleBtn.tag) {
            [titleBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        }
        else{
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [titleBtn addTarget:self action:@selector(clickBtnToCutTitle:) forControlEvents:UIControlEventTouchUpInside];
        [_titleScrollView addSubview:titleBtn];
        //创建箭头Btn
        //UIButton *arrowBtn = [UIButton alloc]initWithFrame:<#(CGRect)#>;
    }
    [_titleScrollView setContentSize:CGSizeMake(10*2+(titlesArray.count-1)*jianxi+btnWidth*(titlesArray.count), 44)];
    //关闭水平滚动条
    [_titleScrollView setShowsHorizontalScrollIndicator:NO];
    //关闭弹簧效果
    [_titleScrollView setBounces:NO];
    
//    //布置展示页ScrollView
//    _showScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(_tableView.frame.origin.x, _tableView.frame.origin.y, BOUNDSWIDTH, 200)];
//    [_showScrollView setBackgroundColor:[UIColor grayColor]];
//    [_showScrollView setContentSize:CGSizeMake(BOUNDSWIDTH*5, 0)];
//    //关闭水平滚动条
//    [_showScrollView setShowsHorizontalScrollIndicator:NO];
//    //关闭图弹簧效果
//    [_showScrollView setBounces:NO];
//    [_showScrollView setPagingEnabled:YES];
//    [_showScrollView setDelegate:self];
//#pragma mark -- scrollView show
//  //  [_tableView addSubview:_showScrollView];
    //创建imageView 放在展示页的滚动视图上
//    for (NSInteger i = 0; i<5; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%.3ld.jpg",i+1]];
//        _showImageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*_showScrollView.frame.size.width, 0, _showScrollView.frame.size.width, _showScrollView.frame.size.height)];
//        [_showImageView setImage:image];
//        [_showScrollView addSubview:_showImageView];
//    }
  //pageControl
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    [pageControl setNumberOfPages:5];
    CGSize pageControlSize = [pageControl sizeForNumberOfPages:5];
    [pageControl setCurrentPageIndicatorTintColor:[UIColor grayColor]];
    [pageControl setPageIndicatorTintColor:[UIColor whiteColor]];
    //设置frame
    [pageControl setFrame:CGRectMake(_showScrollView.frame.size.width-pageControlSize.width, _showScrollView.frame.size.height-pageControlSize.height, pageControlSize.width, pageControlSize.height)];
    _pageControl = pageControl;
#pragma mark -- pageControlShow
//    [_tableView addSubview:pageControl];


}
#pragma mark -UIScrollViewDelegate
//pageControl结束时候的操作，获取当前页，让小圆点指向该页。
#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //判断当为下面的showScrollView时，小圆点指向对应的图片
    if (scrollView == _showScrollView) {
        CGFloat num = scrollView.contentOffset.x;
        NSInteger pageIndex = num/BOUNDSWIDTH;
        _pageControl.currentPage = pageIndex;
        
    }
}
#pragma mark - 标题栏按钮的响应事件
- (void)clickBtnToCutTitle:(UIButton *)senderBtn{
    UIButton *btn = (UIButton *)[_titleScrollView viewWithTag:_tapTag];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [senderBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    if (_tapTag!=senderBtn.tag) {
        [allNews removeAllObjects];
        [self.tableView reloadData];
        [self loadNews:senderBtn.tag];
    }
    _tapTag = senderBtn.tag;
}
-(void)loadNews:(NSInteger)senderTag{
    switch (senderTag) {
        case 100:{
            urlStr = LOLNEWS_URL;
            NSURL *url = [NSURL URLWithString:urlStr];
            NSLog(@"%@",url);
            [self loadNewsWithUrl:url withPath:urlStr];
            break;
        }
        case 101:{
            urlStr = LOLGAME_URL;
            NSURL *url = [NSURL URLWithString:urlStr];
            NSLog(@"%@",url);
            [self loadNewsWithUrl:url withPath:urlStr];
            break;
        }
        case 102:{
            urlStr = LOLFORFUN_URL;
            NSURL *url = [NSURL URLWithString:urlStr];
            NSLog(@"%@",url);
          [self loadNewsWithUrl:url withPath:urlStr];
            break;
        }
        case 103:{
            urlStr = LOLOFFICAL_URL;
            NSURL *url = [NSURL URLWithString:urlStr];
            NSLog(@"%@",url);
            [self loadNewsWithUrl:url withPath:urlStr];
            break;
        }
        case 104:{
            urlStr = LOLPRETTYGIEL_URL;
            NSURL *url = [NSURL URLWithString:urlStr];
            NSLog(@"%@",url);
            [self loadNewsWithUrl:url withPath:urlStr];
            break;
        }
        case 105:{
            urlStr = LOLTACTIC_URL;
            NSURL *url = [NSURL URLWithString:urlStr];
            NSLog(@"%@",url);
            [self loadNewsWithUrl:url withPath:urlStr];
            break;
        }
        case 106:{
            urlStr = LOLACTIVE_URL;
            NSURL *url = [NSURL URLWithString:urlStr];
            NSLog(@"%@",url);
            [self loadNewsWithUrl:url withPath:urlStr];
            break;
        }

        default:
            break;
    }
}

@end
