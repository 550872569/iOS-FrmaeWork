//
//  ANGuideVC.h
//  AudioNote
//
//  Created by Yan on 16/9/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANGuideVC : UIViewController

{
    UIScrollView *_scrollView;
}
//轮播的页码
@property(strong,nonatomic) UIPageControl *pageVC;

@end
