//
//  AppDelegate.m
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate ()

@end

@implementation AppDelegate
#pragma mark - UIApplicationDelegate(程序生命周期代理方法)
#pragma mark 程序启动
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"didFinishLaunchingWithOptions程序启动");
    [self configKeyWindowAndRootVC];
    [self configAudio];
    return YES;
}
#pragma mark 程序休眠准备进入后台
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"applicationWillResignActive程序休眠准备进入后台");
}
#pragma mark 程序进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
NSLog(@"applicationDidEnterBackground程序进入后台");
}
#pragma mark 程序进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"applicationWillEnterForeground程序进入前台");
}
#pragma mark 程序激活
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"applicationDidBecomeActive程序激活");
}
#pragma mark 程序退出
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"applicationWillTerminate程序退出");
}
#pragma mark - ConfigWindowAndRootVC(配置Window&根控制器)
- (void)configKeyWindowAndRootVC {
    NSLog(@"configWindowAndRootVC配置Window&根控制器");
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = COLOR_WHITE;
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[ANStartVC alloc]init];
}
#pragma mark 获取录音权限
- (void)configAudio {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    if ([session respondsToSelector:@selector(requestRecordPermission:)]){
        [session requestRecordPermission:^(BOOL granted) {
            [[NSUserDefaults standardUserDefaults] setBool:granted forKey:@"recordPermission"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];
    }
}
@end
