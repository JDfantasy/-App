//
//  FriendViewController.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/11.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "FriendViewController.h"

@interface FriendViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating>

@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    //[self.navigationItem setTitle:@"好友"];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTap:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:229/255.0 green:89/255.0 blue:46/255.0 alpha:1];
    //分段控制器
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:@[@"好友",@"消息"]];
    segControl.frame = CGRectMake((self.view.frame.size.width-160)/2, 24, 160, 36);
    segControl.backgroundColor = [UIColor clearColor];
    segControl.tintColor = [UIColor grayColor];
    [segControl.layer setMasksToBounds:YES];
    [segControl.layer setCornerRadius:6];
    [segControl addTarget:self action:@selector(changeSeg:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:segControl];
    
    //获得状态栏和导航栏的高度
    CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
    CGRect navigationBarFrame = self.navigationController.navigationBar.frame;
    
    //搜索栏
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, statusBarFrame.size.height+navigationBarFrame.size.height, self.view.frame.size.width, 40)];
    _searchBar.placeholder = @"搜索你的好友";
    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];
    //表视图
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, _searchBar.frame.origin.y+_searchBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-(_searchBar.frame.size.height+navigationBarFrame.size.height)) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    UITableViewController *tableVC = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [tableVC.view setBackgroundColor:[UIColor greenColor]];
    UISearchController *searchControll = [[UISearchController alloc] initWithSearchResultsController:tableVC];
    searchControll.searchBar.placeholder = @"搜索你的好友";
    searchControll.searchBar.autocorrectionType = UITextAutocapitalizationTypeNone;
    //搜索更新
    searchControll.searchResultsUpdater = self;
    [self presentViewController:searchControll animated:YES completion:nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"1"];
    }
    
    return cell;
}

- (void)addTap:(UIBarButtonItem *)sender{
    UITableViewController * tvc=[[UITableViewController alloc]initWithStyle:UITableViewStylePlain];
    //设置大小
    tvc.preferredContentSize=CGSizeMake(100, 100);
    //设定模态显示形式是弹出
    tvc.modalPresentationStyle=UIModalPresentationPopover;
    //弹出控制器s
    UIPopoverPresentationController * ppc=tvc.popoverPresentationController;
    //设置它显示的按钮
    ppc.barButtonItem=sender;
    ppc.permittedArrowDirections=UIPopoverArrowDirectionAny;
    //显示视图
    [self presentViewController:tvc animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeSeg:(UISegmentedControl *)seg{
    
}
#pragma mark --UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
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
