//
//  ANDictation.m
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANDictationVC.h"
#define kANDictationWEIViewHeight 130

@interface ANDictationVC ()
@property (nonatomic, strong) ANDictationWEIView *viewWriting;
@property (nonatomic, strong) ANDictationWEIView *viewEssay;
@property (nonatomic, strong) ANDictationWEIView *viewInterview;
@end

@implementation ANDictationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_SYSTEM_BACKGROUND;
    [self configUI];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"self%@",self);
}

#pragma mark - ConfigUI(配置UI界面)
- (void)configUI {
    NSLog(@"configUI");
    CGRect rectWriting = CGRectMake(10, 100, SCREEN_WIDTH-100, 150);
    CGRect rectEssay = CGRectMake(10, 100, SCREEN_WIDTH-100, 150);
    CGRect rectInterView = CGRectMake(10, 100, SCREEN_WIDTH-100, 150);
    
    ANDictationWEIView *viewWriting = [[ANDictationWEIView alloc]initWithFrame:rectWriting];
    viewWriting = [viewWriting initWithImage:@"writing" title:@"写作" subTitle:@"说'文章或小说',即可同步转文字"];
    [self.view addSubview:viewWriting];
    [viewWriting mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).with.offset(100);
        make.width.equalTo(@(SCREEN_WIDTH-50*2));
        make.height.equalTo(@(kANDictationWEIViewHeight));
    }];
    self.viewWriting = viewWriting;
    UITapGestureRecognizer *tapGestureWriting = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureWriting:)];
    tapGestureWriting.numberOfTapsRequired = 1;
    tapGestureWriting.numberOfTouchesRequired = 1;
    [self.viewWriting addGestureRecognizer:tapGestureWriting];

    ANDictationWEIView *viewEssay = [[ANDictationWEIView alloc]initWithFrame:rectEssay];
    viewEssay = [viewEssay initWithImage:@"essay" title:@"随笔" subTitle:@"说'灵感或随想',即可同步转文字"];
    [self.view addSubview:viewEssay];
    [viewEssay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.width.equalTo(@(SCREEN_WIDTH-50*2));
        make.height.equalTo(@(kANDictationWEIViewHeight));
    }];
    self.viewEssay = viewEssay;
    UITapGestureRecognizer *tapGestureEssay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureEssay:)];
    tapGestureEssay.numberOfTapsRequired = 1;
    tapGestureEssay.numberOfTouchesRequired = 1;
    [self.viewEssay addGestureRecognizer:tapGestureEssay];

    ANDictationWEIView *viewInterView = [[ANDictationWEIView alloc]initWithFrame:rectInterView];
    viewInterView = [viewInterView initWithImage:@"interview" title:@"随笔" subTitle:@"说'灵感或随想',即可同步转文字"];
    [self.view addSubview:viewInterView];
    [viewInterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-100);
        make.width.equalTo(@(SCREEN_WIDTH-50*2));
        make.height.equalTo(@(kANDictationWEIViewHeight));
    }];
    self.viewInterview = viewInterView;
    UITapGestureRecognizer *tapGestureInterView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureInterView:)];
    tapGestureInterView.numberOfTapsRequired = 1;
    tapGestureInterView.numberOfTouchesRequired = 1;
    [self.viewInterview addGestureRecognizer:tapGestureInterView];
}

#pragma mark - 轻击手势触发方法
-(void)tapGestureWriting:(UITapGestureRecognizer *)sender {
    NSLog(@"tapGestureWriting");
    ANBlueToothVC *vcBluetooth = [ANBlueToothVC new];
    [self.navigationController pushViewController:vcBluetooth animated:YES];
}
-(void)tapGestureEssay:(UITapGestureRecognizer *)sender {
    NSLog(@"tapGestureEssay");
    YHPFMDBViewController *vcBluetooth = [YHPFMDBViewController new];
    [self.navigationController pushViewController:vcBluetooth animated:YES];
}
-(void)tapGestureInterView:(UITapGestureRecognizer *)sender {
    NSLog(@"tapGestureInterView");
}


@end
