//
//  YanMultiLineLabel.h
//  UILabelExtend
//
//  Created by Yan on 14-9-18.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YanMultiLineLabel : UILabel
{
@private
    long      characterSpacing_;       //字间距
    CGFloat   linesSpacing_;           //行间距
}
@property(nonatomic,assign) long      characterSpacing;
@property(nonatomic,assign) CGFloat   linesSpacing;

/*
 *绘制前获取label高度
 */
- (int)getAttributedStringHeightWidthValue:(int)width;
@end
