//
//  UIView+Basic.m
//  Picnote
//
//  Created by Mac_ZL on 14-8-26.
//  Copyright (c) 2014年 Baijiahulian. All rights reserved.
//

#import "UIView+Basic.h"

@implementation UIView(Basic)

- (CGFloat)current_x
{
    return self.frame.origin.x;
}
- (CGFloat)current_y
{
    return self.frame.origin.y;
}
- (CGFloat)current_w
{
    return self.frame.size.width;
}
- (CGFloat)current_h
{
    return self.frame.size.height;
}
- (CGFloat)current_y_h
{
    return self.frame.size.height + self.frame.origin.y;
}
- (CGFloat)current_x_w
{
    return self.frame.size.width + self.frame.origin.x;
}
- (CGPoint)current_innerCenter
{
    return CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
}
@end
