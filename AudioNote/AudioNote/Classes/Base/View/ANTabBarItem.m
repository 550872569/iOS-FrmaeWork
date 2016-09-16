//
//  ANTabBarItem.m
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANTabBarItem.h"
#import "ANTabBar.h"
#import <objc/runtime.h>

@interface ANTabBarItem()

@property (nonatomic, strong) UIImage *badgeImage;

@end

@implementation ANTabBarItem


- (void)setBadgeValue:(NSString *)badgeValue{
    [super setBadgeValue:badgeValue];
    
    //在这个地方遍历子控件。然后去调整背景image
    if (badgeValue==nil) {
        return;
    }
    UITabBarController *tabBarCtrl = [self valueForKeyPath:@"_target"];
    
    ANTabBar *tabbar = (ANTabBar *)tabBarCtrl.tabBar;
    for (int i = 0; i < tabbar.subviews.count; ++i) {
        UIView *tabbarChildView = tabbar.subviews[i];
        //拿到UITabBarButton
        if ([tabbarChildView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (int j = 0; j < tabbarChildView.subviews.count; ++j) {
                UIView *tabbarButtonChildView = tabbarChildView.subviews[j];
                if ([tabbarButtonChildView isKindOfClass:NSClassFromString(@"_UIBadgeView")]) {
                    for (int k = 0; k < tabbarButtonChildView.subviews.count; ++k) {
                        UIView *backgroundView = tabbarButtonChildView.subviews[k];
                        if ([backgroundView isKindOfClass:NSClassFromString(@"_UIBadgeBackground")]) {
                            //                            [backgroundView setBackgroundColor:[UIColor blueColor]];
                            //不知道怎么改里面的东西，因不系统的东西我们是看不到的，这个时候就可以利用运行时去动态获取属性
                            
                            Class clazz = [backgroundView class];
                            unsigned int outCount;
                            //取出class里面对应的成员变量列表
                            Ivar *ivars = class_copyIvarList(clazz, &outCount);
                            for (int l = 0; l < outCount; ++l) {
                                Ivar ivar = ivars[l];
                                
                                //取ivar的name
                                NSString *ivarName = [NSString  stringWithUTF8String:ivar_getName(ivar)];
                                NSString *ivarType = [NSString  stringWithUTF8String:ivar_getTypeEncoding(ivar)];
                                NSLog(@"ivarName=%@\nivarType=%@",ivarName,ivarType);
                                
                                //                                ivarName=_image
                                //                                ivarType=@"UIImage"
                                
                                //判断是不是我们想要的
                                if ([ivarName isEqualToString:@"_image"]) {
                                    UIImage *badgeImage = [UIImage imageNamed:@"main_badge"];
                                    
                                    self.badgeImage = badgeImage;
                                    //这个方法不亲切
                                    object_setIvar(backgroundView, ivar, badgeImage);
                                    //kvc
                                    //                                    [backgroundView setValue:badgeImage forKeyPath:@"_image"];
                                }
                            }
                            free(ivars);
                        }
                    }
                }
            }
        }
    }
}

@end
