//
//  UIWindow+SwitchRootViewCtrl.m
//  AudioNote
//
//  Created by Yan on 14/9/1.
//  Copyright © 2016年 YY. All rights reserved.
//


#import "UIWindow+SwitchRootViewCtrl.h"

@implementation UIWindow (SwitchRootViewCtrl)

- (void)switchRootViewCtrl{
    UIViewController *ctrl = nil;
//    if ([ANAccountTool account]) {
//        //进入到软件的主页面
//        ctrl = [[ANTabBarController alloc] init];
//    }else{
//        ctrl = [ANOAuthViewCtrl new];
//    }
    [self setRootViewController:ctrl];
}

@end
