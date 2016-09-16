//
//  UIBarButtonItem+Extension.h
//  AudioNote
//
//  Created by Yan on 14/9/1.
//  Copyright © 2016年 YY. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 *  初始化一个UIBarButtonItem
 *
 *  @param image    默认图片
 *  @param hltImage 高亮
 */
+ (UIBarButtonItem *)itemWithImage:(NSString *)image hltImage:(NSString *)hltImage target:(id)target action:(SEL)action;


+ (UIBarButtonItem *)itemWithImage:(NSString *)image hltImage:(NSString *)hltImage target:(id)target action:(SEL)action title:(NSString *)title;

/**
 *  直接返回一个只带有文字的BarButtonItem
 *  自定义一个button作为customView
 *
 *  @param target <#target description#>
 *  @param action <#action description#>
 *  @param title  <#title description#>
 *
 *  @return <#return value description#>
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title;

@end
