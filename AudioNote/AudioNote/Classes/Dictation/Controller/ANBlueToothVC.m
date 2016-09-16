//
//  ANBlueToothVC.m
//  AudioNote
//
//  Created by Yan on 16/9/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANBlueToothVC.h"

@interface ANBlueToothVC ()<ANDictationWEIBottomViewDelegate,ANAudioToolDelegate>
@property (nonatomic, strong) ANAudioTool *audio;
@end

@implementation ANBlueToothVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_SYSTEM_BACKGROUND;
    self.title = @"采访";
    _audio = [ANAudioTool sharedAudioTool];
    _audio.an_delegate = self;
    [self configUI];
}

- (void)configUI {
    ANDictationWEIBottomView *viewBottom = [[ANDictationWEIBottomView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-64, SCREEN_WIDTH, 64)];
    viewBottom.delegate = self;
    [self.view addSubview:viewBottom];
    [self buttonAudioStartAction:nil];
}

#pragma mark 录音开始
- (void)buttonAudioStartAction:(UIButton *)sender {
    [_audio an_startRecordingAudio];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"self%@",self);
}

- (void)recordingAudioMark {
    NSLog(@"recordingAudioMark");
}

-(void)recordingAudioResume {
//    [_audio an_stopRecordingAudio];
    NSLog(@"recordingAudioResume");
}

-(void)recordingAudioSave {
    NSLog(@"recordingAudioSave");
}
@end
