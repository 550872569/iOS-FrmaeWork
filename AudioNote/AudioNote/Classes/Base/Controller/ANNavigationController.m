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
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

@end
