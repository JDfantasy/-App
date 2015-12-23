//
//  hangmengModel.h
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/12.
//  Copyright © 2015年 JD－高. All rights reserved.
//
/*
 article_id
 article_url
 channel_desc
 channel_id
 image_spec
 
 
 image_url_big
 image_url_small
 image_with_btn
 
 insert_date
 is_act
 
 is_direct
 is_hot
 is_new
 is_top
 publication_date
 score
 summary
 targetid
 title
 */
#import <Foundation/Foundation.h>

@interface hangmengModel : NSObject
@property (nonatomic, copy) NSString *article_id;
@property (nonatomic, copy) NSString *article_url;
@property (nonatomic, copy) NSString *channel_desc;
@property (nonatomic, copy) NSString *channel_id;
@property (nonatomic, copy) NSString *image_spec;
@property (nonatomic, copy) NSString *image_url_big;
@property (nonatomic, copy) NSString *image_url_small;
@property (nonatomic, copy) NSString *image_with_btn;
@property (nonatomic, copy) NSString *insert_date;
@property (nonatomic, copy) NSString *is_act;
@property (nonatomic, copy) NSString *is_direct;
@property (nonatomic, copy) NSString *is_hot;
@property (nonatomic, copy) NSString *is_new;
@property (nonatomic, copy) NSString *is_top;
@property (nonatomic, copy) NSString *publication_date;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *targetid;
@property (nonatomic, copy) NSString *title;

//通过初始化的方法直接将赋值使用的字典传过来
-(id)initWithDic:(NSDictionary *)dic;
@end
