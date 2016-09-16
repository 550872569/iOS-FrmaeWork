//  UIVieh+Extension.m
//  VillageSpirits
//
//  Created by Yan on 16/6/30.
//  Copyright © 2016年 HCJ. All rights reserved.
//


#import "UIView+Extension.h"

@implementation UIView (Extension)

//创建setX 方法
-(void)setX:(CGFloat)x
{

    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y
{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setW:(CGFloat)w
{
    CGRect rect = self.frame;
    rect.size.width = w;
    self.frame = rect;
}
-(CGFloat)w
{
    return self.frame.size.width;
}

-(void)setH:(CGFloat)h
{
    CGRect rect = self.frame;
    rect.size.height = h;
    self.frame = rect;
}
-(CGFloat)h
{
    return self.frame.size.height;
}

@end
