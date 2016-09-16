//  UIVieh+Extension.m
//  VillageSpirits
//
//  Created by Yan on 16/6/30.
//  Copyright © 2016年 YY. All rights reserved.
//


#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


-(CGFloat)x{
    return self.frame.origin.x;
}


-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


-(CGFloat)height{
    return self.frame.size.height;
}


-(void)setSize:(CGSize)size{
    CGRect frame =  self.frame;
    frame.size = size;
    self.frame = frame;
}

-(CGSize)size{
    return self.frame.size;
}


-(CGFloat)centerX{
    return self.center.x;
}

-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerY{
    return self.center.y;
}

-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

+ (UIView *)viewWithBackgroundColor:(UIColor *)backgroundColor ract:(CGRect)ract {
    UIView *view = [[UIView alloc]initWithFrame:ract];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
+(UIButton *)buttonWithTitle:(NSString *)title titleFont:(CGFloat)font titleColor:(UIColor *)titleColor image:(NSString *)image backgroundImage:(NSString *)backgroundImage backgroundColor:(UIColor *)backgroundColor  ract:(CGRect)ract {
    UIButton *button = [[UIButton alloc]init];
    [button setFrame:ract];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundColor:backgroundColor];
    if (image.length) {
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (backgroundImage.length) {
        [button setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
    }
    return button;
}
+ (UILabel *)labelWithTitle:(NSString *)title titleFont:(CGFloat)font backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)textAlignment ract:(CGRect)ract numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [[UILabel alloc]init];
    [label setText:title];
    [label setFrame:ract];
    [label setTextAlignment:textAlignment];
    [label setBackgroundColor:backgroundColor];
    [label setNumberOfLines:numberOfLines];
    return label;
}


@end
