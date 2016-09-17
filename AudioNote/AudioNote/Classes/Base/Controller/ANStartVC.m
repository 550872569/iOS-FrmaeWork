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
    [self configNavigationBar];
}

- (void)chooseRootVC {
    //获取keyWindow
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    //获取沙盒中存储的账户信息
    ANAccount *account = [ANAccountTool account];
    //获取沙盒中存储的引导页信息
    ANAccountGuide *guide = [ANAccountTool accountGuide];
    
//    //拿到当前app 的版本
//    NSString *appViersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
//    //沙盒中的版本  从沙盒中获取版本
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *curViewsion = [defaults objectForKey:kAppVersion];
//    //保存当前版本app 值
//    [defaults setObject:appViersion forKey:kAppVersion];
//    //同步提交
//    [defaults synchronize];

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

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBarBackgroundIimage"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setBarTintColor:COLOR_WHITE];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
}

@end
