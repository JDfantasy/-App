//
//  ZBCell.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/12.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "ZBCell.h"
#import "UIView+Basic.h"
@interface ZBCell ()
@property (nonatomic,strong) UILabel *newsLabel;
@property (nonatomic,strong) UILabel *detalLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UIImageView *newsImageView;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong)UIImageView *showImageView;
@end
@implementation ZBCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpView];
    }
    return self;
}
#pragma mark - 配置cell上的视图
- (void)setUpView{
    _newsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,10, 90, 100)];
    [_newsImageView setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_newsImageView];
    
    _newsLabel = [[UILabel alloc] initWithFrame:CGRectMake(_newsImageView.current_x_w+10, _newsImageView.current_y, self.contentView.current_w-_newsImageView.current_x_w-10, 20)];
    [_newsLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_newsLabel];
    
    _detalLabel = [[UILabel alloc] initWithFrame:CGRectMake(_newsLabel.current_x, _newsLabel.current_y_h+10, _newsLabel.current_w, self.contentView.current_h)];
    [_detalLabel setBackgroundColor:[UIColor clearColor]];
    [_detalLabel setNumberOfLines:0];
    [_detalLabel setFont:[UIFont systemFontOfSize:14]];
    _detalLabel.textAlignment = NSTextAlignmentLeft;
    [_detalLabel setTextColor:[UIColor lightGrayColor]];
    [self.contentView addSubview:_detalLabel];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    [_scrollView setBackgroundColor:[UIColor redColor]];
    [_scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width*5, 0)];
    //关闭水平滚动条
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    //关闭图弹簧效果
    [_scrollView setBounces:NO];
    [_scrollView setPagingEnabled:YES];


}
- (void)layoutSubviews{
    [super layoutSubviews];
    [_newsImageView setFrame:CGRectMake(5,10,110,80)];
    [_newsLabel setFrame:CGRectMake(_newsImageView.current_x_w+10, _newsImageView.current_y-5, self.contentView.current_w-_newsImageView.current_w-20, 20)];
    [_detalLabel setFrame:CGRectMake(_newsLabel.current_x, _newsLabel.current_y_h+10, _newsLabel.current_w, self.contentView.current_h-_newsLabel.current_h-20)];
    //_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];

    
}
-(void)setDataWithModel:(hangmengModel *)model indexPath:(NSIndexPath *)index{
    NSLog(@"index.row:%ld",index.row);
    if (index.row == 0) {

        [self.contentView addSubview:_scrollView];
        for (NSInteger i = 0; i<5; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%.3ld.jpg",i+1]];
            _showImageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
            [_showImageView setImage:image];
            [_scrollView addSubview:_showImageView];
        }
        
    }    
}
@end
