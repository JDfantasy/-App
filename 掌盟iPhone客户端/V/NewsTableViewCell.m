//
//  NewsTableViewCell.m
//  JD－掌沃联盟iPhone客户端
//
//  Created by JD－高 on 15/11/12.
//  Copyright © 2015年 JD－高. All rights reserved.
//

#import "NewsTableViewCell.h"
@interface NewsTableViewCell()
@property (nonatomic, strong) UIImageView *newsImageView;
@property (nonatomic, strong) UILabel *newsLabel;
@property (nonatomic, strong) UILabel *detalLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@end
@implementation NewsTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpView];
    }
    return self;
}
-(void)setUpView{
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
    

}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_newsImageView setFrame:CGRectMake(5,10,110, 80)];
    [_newsLabel setFrame:CGRectMake(_newsImageView.current_x_w+10, _newsImageView.current_y-5, self.contentView.current_w-_newsImageView.current_w-20, 20)];
    [_detalLabel setFrame:CGRectMake(_newsLabel.current_x, _newsLabel.current_y_h+10, _newsLabel.current_w, self.contentView.current_h-_newsLabel.current_h-20)];

}
- (void)awakeFromNib {
    // Initialization code
}
-(void)setDataWithModel:(hangmengModel *)model indexPath:(NSIndexPath *)index{
    [_newsImageView setImageWithURL:[NSURL URLWithString:model.image_url_small] placeholderImage:[UIImage imageNamed:@"00.png"]];
    
    [_newsLabel setText:[NSString stringWithFormat:@"%@",model.title]];
    
    [_detalLabel setText:[NSString stringWithFormat:@"%@",model.summary]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
