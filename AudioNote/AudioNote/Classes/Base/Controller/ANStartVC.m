//
//  ANStartVC.m
//  
//
//  Created by Yan on 16/9/16.
//
//

#import "ANStartVC.h"

@interface ANStartVC ()

@end

@implementation ANStartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self chooseRootVC];
}

- (void)chooseRootVC {
    //获取keyWindow
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    //获取沙盒中存储的账户信息
    ANAccount *account = [ANAccountTool account];
    //获取沙盒中存储的引导页信息
    ANAccountGuide *guide = [ANAccountTool accountGuide];
    /*
     1. 进入引导页
     2. 开始
     3. 登录页
     4. 登录成功进入首页
     5. 没有登录进入注册页
     6. 第三方登录
     */
    //如果引导页数据存在--> 不是第一次使用--> 直接进入登录页
    if (guide) {
        //判断本地-->用户账户信息
        if (!account) {
            //未登录-->进入登录页
            keyWindow.rootViewController = [ANLoginVC new];
        } else {
            //已登录-->进入主页
            keyWindow.rootViewController = [[ANBaseTabBarVC alloc]init];
        }
    } else {
        //进入引导页
        keyWindow.rootViewController = [ANGuideVC new];
    }


}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
