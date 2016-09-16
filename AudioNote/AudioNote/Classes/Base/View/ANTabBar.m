//
//  ANTabBar.m
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANTabBar.h"
#import "UIView+extension.h"
#define kTabBarItermCount 3


@implementation ANTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //计算tabBarButton的宽度
    CGFloat tabBarButtonW = self.width/kTabBarItermCount;
    
    NSInteger buttonIndex = 0;
    
    for (int i = 0; i < self.subviews.count; ++i) {
        UIView *childView = self.subviews[i];
        //调整UITabBarButton的位置。其他 的view不用管
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            NSLog(@"%@",childView);
            //设置宽度
            childView.width = tabBarButtonW;
            //调整位置，
            childView.x = buttonIndex*tabBarButtonW;
            buttonIndex++;
        }
    }
}


@end
