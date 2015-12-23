//
//  BaseTableViewController.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/13.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "BaseTableViewController.h"
#import "DetailViewController.h"

@interface BaseTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSString *whichPath;
@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   // [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    allNews = [[NSMutableArray alloc] initWithCapacity:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"hereIS%lu",(unsigned long)allNews.count);
    return allNews.count;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.modelArray = allNews;
    detailVC.index = indexPath.row;
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_whichPath  isEqual:LOLNEWS_URL]) {
        if (indexPath.row == 0) {
            static NSString *firstPageCell = @"firstPageCell";
            ZBCell *zbCell = [tableView dequeueReusableCellWithIdentifier:firstPageCell];
            if (!zbCell) {
                zbCell = [[ZBCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:firstPageCell];
            }
//            else {
//                while ([zbCell.contentView.subviews lastObject] != nil) {
//                    [(UIView *)[zbCell.contentView.subviews lastObject] removeFromSuperview];
//                }
//            }
            [zbCell setDataWithModel:allNews[indexPath.row] indexPath:indexPath];
            return zbCell;
        }
        else {
            static NSString *newsTableCellIdentifer = @"newsTableViewCell";
            NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:newsTableCellIdentifer];
            if (cell==nil) {
                cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:newsTableCellIdentifer];
            }
            [cell setDataWithModel:allNews[indexPath.row] indexPath:indexPath];
            return cell;
        }
    }
    else {
    static NSString *newsTableCellIdentifer = @"newsTableViewCell";
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:newsTableCellIdentifer];
    if (cell==nil) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:newsTableCellIdentifer];
    }
    [cell setDataWithModel:allNews[indexPath.row] indexPath:indexPath];
    return cell;
    }
    //return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_whichPath isEqualToString:LOLNEWS_URL]) {
        if (indexPath.row == 0) {
            return 200;
        }
        else{
            return 92;
        }
    }
    return 92;
    
}

-(void)loadNewsWithUrl:(NSURL *)url withPath:(NSString *)path{
    _whichPath = path;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self actionData:data];
        });
    }];
    [SVProgressHUD showWithStatus:@"我就不出来！！" maskType:SVProgressHUDMaskTypeBlack];
    [task resume];
}
-(void)actionData:(NSData *)data{
    [SVProgressHUD dismiss];
    if (data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (dic) {
            // NSLog(@"%@",dic);
            [self handleDataForUpData:dic];
            if (allNews.count > 0) {
                [self.tableView reloadData];
            }
            [SVProgressHUD dismiss];
            NSLog(@"oo");
        }
        else{
            [ZHQUtil alertWithMessage:@"老子出不来了" andWithVC:self];
            [SVProgressHUD dismiss];
        }

    }
    else{
        
    }
    
}
-(void)handleDataForUpData:(NSDictionary *)dic{
    [allNews removeAllObjects];
    NSArray *dataArray = [[NSArray alloc] initWithArray:dic[@"list"]];
   // NSLog(@"%@",dataArray);
    //封装数据模型
    [dataArray enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        hangmengModel *news = [[hangmengModel alloc] initWithDic:dic];
        [allNews addObject:news];
     //   NSLog(@"allnews%lu",(unsigned long)allNews.count);
    }];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
