//
//  ANTabbarVC.m
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANBaseTabBarVC.h"

@interface ANBaseTabBarVC ()

@end

@implementation ANBaseTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(49, 50, 53);
    [self configUI];
//    [self configTabbar];
}

- (void)configTabbar {
    ANTabBar *anTabBar = [ANTabBar new];
    [self setValue:anTabBar forKey:@"tabBar"];
}
- (void)configUI {
    [self createChildVCWithUIViewController:[ANDictationVC new] tabBarItermTitle:@"听写" tabBarItermImage:@"home_normal" selectedImage:@"home_highlight"];
    [self createChildVCWithUIViewController:[ANListVC new] tabBarItermTitle:@"列表" tabBarItermImage:@"home_normal" selectedImage:@"home_highlight"];
    [self createChildVCWithUIViewController:[ANAccountVC new] tabBarItermTitle:@"账户" tabBarItermImage:@"home_normal" selectedImage:@"home_highlight"];
}

- (void)createChildVCWithUIViewController:(UIViewController *)viewController tabBarItermTitle:(NSString *)title tabBarItermImage:(NSString *)image selectedImage:(NSString *)selectedImage{
    ANNavigationController *nav = [[ANNavigationController alloc]initWithRootViewController:viewController];
    viewController.title = title;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    dic[NSForegroundColorAttributeName] = COLOR_BLACK;
    [viewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];

    viewController.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *originalImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",selectedImage]];
    viewController.tabBarItem.selectedImage = [originalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}


- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    ANNavigationController *nav = [[ANNavigationController alloc] initWithRootViewController:Vc];
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

@end
