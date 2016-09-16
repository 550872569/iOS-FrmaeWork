//
//  ANWEIBottomView.h
//  AudioNote
//
//  Created by sogou on 16/9/13.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ANDictationWEIBottomViewDelegate <NSObject>
@optional

//开始录音
- (void)recordingAudioMark;

//结束录音
- (void)recordingAudioResume;

//取消录音
- (void)recordingAudioSave;

@end

@interface ANDictationWEIBottomView : UIView

@property (nonatomic, weak) id <ANDictationWEIBottomViewDelegate> delegate;

@end
