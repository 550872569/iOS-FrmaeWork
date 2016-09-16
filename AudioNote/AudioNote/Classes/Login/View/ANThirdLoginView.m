//
//  ANThirdLoginView.m
//  AudioNote
//
//  Created by Yan on 16/9/15.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANThirdLoginView.h"

@implementation ANThirdLoginView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(78, 87, 105);
        CGFloat w = frame.size.height;
        CGFloat y = 0;
        CGFloat h = w;
        for (int index = 0; index<3; index++) {
            UIButton *btn = [UIButton new];
            
            if (iPhone4s) {
                [btn setFrame:CGRectMake(150/4+index *(150/4+w), y, w, h)];
            } else {
                [btn setFrame:CGRectMake(index * w, y, w, h)];
            }
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"buttonLoginImage_%d",index]] forState:UIControlStateNormal];
            [self addSubview:btn];
            btn.tag = index;
            [btn addTarget:self action:@selector(buttonThirdLoginAction:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

- (void)buttonThirdLoginAction:(UIButton *)sender {
    if (sender.tag == 0) {
        if ([self.delegate respondsToSelector:@selector(loginWacht)]) {
            [self.delegate loginWacht];
        }
    } else if (sender.tag == 1) {
        if ([self.delegate respondsToSelector:@selector(loginQQ)]) {
            [self.delegate loginQQ];
        }
    } else if (sender.tag == 2) {
        if ([self.delegate respondsToSelector:@selector(loginSina)]) {
            [self.delegate loginSina];
        }
    }
}


@end
