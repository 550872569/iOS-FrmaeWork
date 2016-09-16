//
//  ANWEIBottomView.m
//  AudioNote
//
//  Created by sogou on 16/9/13.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANDictationWEIBottomView.h"

@implementation ANDictationWEIBottomView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(78, 87, 105);
        self.layer.borderWidth = 2;
        self.layer.borderColor = RGB(62, 137, 140).CGColor;
        self.layer.cornerRadius = 3;
        
        CGFloat w = SCREEN_WIDTH / 3;
        CGFloat y = 0;
        CGFloat h = frame.size.height;
        for (int index = 0; index<3; index++) {
            UIButton *btn = [UIButton new];
            [btn setFrame:CGRectMake(index * w, y, w, h)];
            [self addSubview:btn];
            btn.tag = index;
            if (index == 0) {
                [btn setTitle:@"标重点" forState:UIControlStateNormal];
            } else if (index == 1) {
                 [btn setTitle:@"暂停" forState:UIControlStateNormal];
            } else if (index == 2) {
                [btn setTitle:@"保存" forState:UIControlStateNormal];
            }
            [btn addTarget:self action:@selector(buttonThirdLoginAction:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

- (void)buttonThirdLoginAction:(UIButton *)sender {
    if (sender.tag == 0) {
        if ([self.delegate respondsToSelector:@selector(recordingAudioMark)]) {
            [self.delegate recordingAudioMark];
        }
    } else if (sender.tag == 1) {
        if ([self.delegate respondsToSelector:@selector(recordingAudioResume)]) {
            [self.delegate recordingAudioResume];
        }
    } else if (sender.tag == 2) {
        if ([self.delegate respondsToSelector:@selector(recordingAudioSave)]) {
            [self.delegate recordingAudioSave];
        }
    }
}

@end
