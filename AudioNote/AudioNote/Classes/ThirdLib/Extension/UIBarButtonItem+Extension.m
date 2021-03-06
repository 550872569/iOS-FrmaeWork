//
//  UIBarButtonItem+Extension.m
//  AudioNote
//
//  Created by Yan on 14/9/1.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image hltImage:(NSString *)hltImage target:(id)target action:(SEL)action{
    //用一个自定义的button去作为UIBarButtonItem 的customView
    
    //初始化一个button
    UIButton *button = [[UIButton alloc] init];
    //设置默认与高亮的图片
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hltImage] forState:UIControlStateHighlighted];
    
    //设置button的大小
    button.size = [button currentImage].size;
    //给按钮添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

+ (UIBarButtonItem *)itemWithImage:(NSString *)image hltImage:(NSString *)hltImage target:(id)target action:(SEL)action title:(NSString *)title{
    //初始化一个button
    UIButton *button = [[UIButton alloc] init];
    //设置默认与高亮的图片
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hltImage] forState:UIControlStateHighlighted];
    
    //设置title
    [button setTitle:title forState:UIControlStateNormal];
    //设置文字颜色
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    //设置文字 大小
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    
    //设置button的大小
//    button.size = [button currentImage].size;
    [button sizeToFit];
    //给按钮添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title{
    //初始化一个button
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    //设置文字颜色
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    //设置文字 大小
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

@end
