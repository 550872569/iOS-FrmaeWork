//
//  DimensMacros.h
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//
#pragma mark Frame宏
#ifndef DimensMacros_h
#define DimensMacros_h

#pragma mark- 状态栏高度
#define STATUS_BAR_HEIGHT 20                                                         
#pragma mark NavBar高度
#define NAVIGATION_BAR_HEIGHT 44
#pragma mark 状态栏 ＋ 导航栏 高度
#define STATUS_AND_NAVIGATION_HEIGHT ((STATUS_BAR_HEIGHT) + (NAVIGATION_BAR_HEIGHT))
#pragma mark 屏幕rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)
#pragma mark 屏幕width
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#pragma mark 屏幕height
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#pragma mark view
#define CONTENT_HEIGHT (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)
#pragma mark 屏幕分辨率
#define SCREEN_RESOLUTION (SCREEN_WIDTH * SCREEN_HEIGHT * ([UIScreen mainScreen].scale))


#define contentOffSet_x _scrollView.contentOffset.x
#define frame_width _scrollView.frame.size.width
#define contentSize_x _scrollView.contentSize.width
#endif /* DimensMacros_h */
