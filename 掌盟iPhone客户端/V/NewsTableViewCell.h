//
//  NewsTableViewCell.h
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/12.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hangmengModel.h"
@interface NewsTableViewCell : UITableViewCell
//通过数据模型配置 cell
-(void)setDataWithModel:(hangmengModel *)model indexPath:(NSIndexPath *)index;
@end
