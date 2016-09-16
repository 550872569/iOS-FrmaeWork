//  UIView+Extension.h
//
//  VillageSpirits
//
//  Created by Yan on 16/6/30.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/**
 *  自定义View
 *
 *  @param backgroundColor 背景色
 *  @param ract            frame
 *
 *  @return view
 */
+ (UIView *)viewWithBackgroundColor:(UIColor *)backgroundColor ract:(CGRect)ract;
/**
 *  自定义button
 *
 *  @param title           文字
 *  @param font            字体
 *  @param image           图片
 *  @param backgroundImage 背景图片
 *  @param backgroundColor 背景颜色
 *
 *  @return button
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleFont:(CGFloat)font titleColor:(UIColor *)titleColor image:(NSString *)image backgroundImage:(NSString *)backgroundImage backgroundColor:(UIColor *)backgroundColor  ract:(CGRect)ract;
/**
 *  自定义label
 *
 *  @param title           文字
 *  @param font            字体
 *  @param backgroundColor 背景颜色
 *  @param textAlignment   居中样式
 *  @param ract            frame
 *  @param numberOfLines   行数
 *
 *  @return label
 */
+ (UILabel *)labelWithTitle:(NSString *)title titleFont:(CGFloat)font backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)textAlignment ract:(CGRect)ract numberOfLines:(NSInteger)numberOfLines;
@end
