//
//  ANListVC.m
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANListVC.h"

@interface ANListVC ()

@end

@implementation ANListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_GRAY;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"self%@",self);
}

@end
