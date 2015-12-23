//
//  BaseTableViewController.h
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/13.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVProgressHUD.h"
#import "hangmengModel.h"
#import "NewsTableViewCell.h"
#import "ZBCell.h"
@interface BaseTableViewController : UITableViewController{
    NSMutableArray *allNews;
}
@property (nonatomic, assign) NSInteger flid;
-(void)loadNewsWithUrl:(NSURL *)url withPath:(NSString *)path;
-(void)loadFromSql:(NSString *)sql;
-(void)saveDataWithflid:(NSInteger)flid;
@end
