//
//  ZGTXAudioTool.h
//  AudioNote
//
//  Created by sogou on 16/9/13.
//  Copyright © 2016年 YY. All rights reserved.
//


#import <UIKit/UIKit.h>

/*
 
 下面代码添加到 appDelegate 里面获取麦克风权限
 
 // 获取录音权限
 AVAudioSession *session = [AVAudioSession sharedInstance];
 if ([session respondsToSelector:@selector(requestRecordPermission:)]){
 [session requestRecordPermission:^(BOOL granted) {
 
 [[NSUserDefaults standardUserDefaults] setBool:granted forKey:@"recordPermission"];
 [[NSUserDefaults standardUserDefaults] synchronize];
 }];
 }
 */

@protocol ANAudioToolDelegate <NSObject>
@optional

//时间倒计时10秒
- (void)limitTimeComing:(NSInteger)timeLeft;

//录音时间超过60秒会调用此方法
- (void)exceededTimeLimit;

//说话时间过短
- (void)durationToShort;

//语音播放完毕
- (void)audioPlayCompleted;

//返回对应的 image 对象
- (void)retuenVolumeImage:(UIImage *)image;

@end

@interface ANAudioTool : NSObject

//单例
+ (instancetype)sharedAudioTool;

//开始录音
- (void)an_startRecordingAudio;

//结束录音
- (void)an_stopRecordingAudio;

//取消录音
- (void)an_cancelRecordingAudio;

//转码压缩
- (void)formatConversionToMP3WithCompleted:(void(^)(NSString *filePath ,NSInteger time))completed;

//播放本地语音
- (void)preparePlayLocalAuidoWithAudioURLStr:(NSString *)audioFile;

//播放网络语音
- (void)preparePlayNetAuidoWithAudioURLStr:(NSString *)audioFile;

//播放录音
- (void)playAudio;

//暂停录音
- (void)playPause;

// 停止录音
- (void)stopAudio;

@property (weak, nonatomic) id<ANAudioToolDelegate> an_delegate;

//是否在录音
@property (assign, nonatomic ,getter = isRecording) BOOL recording;

@end
