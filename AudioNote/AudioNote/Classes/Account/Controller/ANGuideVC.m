//
//  ANGuideVC.m
//  AudioNote
//
//  Created by Yan on 16/9/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANGuideVC.h"

@interface ANGuideVC ()<UIScrollViewDelegate>

@end

@implementation ANGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configGuideView];
}

-(void)configGuideView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    //_scrollView.indicatorStyle =UIScrollViewIndicatorStyleWhite;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    //通过循环给滚动视图添加图片
    for (int i = 0; i < 3; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"anGuideAccountPage_%d.png",i + 1]];
        iv.userInteractionEnabled = YES;
        [_scrollView addSubview:iv];
        
        if (i == 2) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 3.5/ 12, (667- 90) * SCREEN_HEIGHT / 667, SCREEN_WIDTH  * 5 / 12, 60  *SCREEN_HEIGHT / 667)];
            button.layer.cornerRadius = 6;
            button.layer.borderColor = RGB(252, 65, 44).CGColor;
            button.layer.borderWidth = 1;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitle:@"开始体验" forState:UIControlStateNormal];
            button.titleLabel.adjustsFontSizeToFitWidth = YES;
            [button setTitleColor:RGB(252, 65, 44) forState:UIControlStateNormal];
            [button addTarget:self action:@selector(toStart:) forControlEvents:UIControlEventTouchUpInside];
            button.userInteractionEnabled = YES;
            [iv addSubview:button];
        }
    }
    [self.view addSubview:_scrollView];
    //初始化轮播页码控件
    self.pageVC=[[UIPageControl alloc]init];
    //设置轮播页码的位置
    self.pageVC.numberOfPages= 3;
    self.pageVC.frame=CGRectMake(0,self.view.frame.size.height-30, self.view.frame.size.width, 30);
    self.pageVC.currentPageIndicatorTintColor = [UIColor blackColor];
    self.pageVC.pageIndicatorTintColor = [UIColor grayColor];
    [self.view addSubview:self.pageVC];
}
- (void) toStart:(UIButton *)sender{
    
    [_scrollView removeFromSuperview];

    ANAccountGuide *guide = [ANAccountGuide new];
    guide.guideAccount = @"ANAccountGuide";
    [ANAccountTool saveGuideAccount:guide];

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[ANLoginVC alloc] init];
}

#pragma mark- UIScrollViewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self updataPageControl];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //当最后或者最前一张图片时改变坐标
    [self updataPageControl];
}


#pragma mark- 轮播页码改变
-(void)updataPageControl
{
    NSInteger index=contentOffSet_x/frame_width;
    self.pageVC.currentPage=index;
}

@end
