//
//  ANNavigationController.m
//  AudioNote
//
//  Created by Yan on 16/9/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANNavigationController.h"

@interface ANNavigationController ()

@end

@implementation ANNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNavigationBar];
}

- (void)configNavigationBar {
    UINavigationBar *bar = [UINavigationBar appearance];
    // 状态栏
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    // 2.设置导航栏文字属性
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    [barAttrs setObject:COLOR_WHITE forKey:UITextAttributeTextColor];
    [barAttrs setObject:[NSValue valueWithUIOffset:UIOffsetMake(0, 0)] forKey:UITextAttributeTextShadowOffset];
    [bar setTitleTextAttributes:barAttrs];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBarBackgroundIimage"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setBarTintColor:COLOR_WHITE];
    [self.navigationBar setTintColor:COLOR_WHITE];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
}

- (void)configBarButtonItem {
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = COLOR_WHITE;
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:15.0];
    //    textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置高亮状态的文字属性
    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    highTextAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
    
    // 设置不可用状态(disable)的文字属性
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    disableTextAttrs[NSForegroundColorAttributeName] = COLOR_WHITE;
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    /**设置背景**/
    // 技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片
    [appearance setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count!=0) {
        //发push新控制器的时候把底部的tabbar隐藏
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    UIViewController *ctrl =  self.viewControllers.firstObject;
    if(self.viewControllers.count>=1){
        
        NSString *title = @"返回";
        if (self.viewControllers.count==1) {
            title = ctrl.title;
            //            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_back_withtext" hltImage:@"navigationbar_back_withtext_highlighted" target:nil action:nil title:ctrl.title];
        }else{
            //            title = @"";
            //            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_back_withtext" hltImage:@"navigationbar_back_withtext_highlighted" target:nil action:nil title:@"返回"];
        }
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_back_withtext" hltImage:@"navigationbar_back_withtext_highlighted" target:self action:@selector(back) title:title];
        
    }
    [self configBarButtonItem];
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

@end
