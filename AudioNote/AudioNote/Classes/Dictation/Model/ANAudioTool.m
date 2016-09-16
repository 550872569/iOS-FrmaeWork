//
//  ZGTXAudioTool.m
//  AudioNote
//
//  Created by sogou on 16/9/13.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANAudioTool.h"
#import "lame.h"
#import <AVFoundation/AVFoundation.h>
#import "XYGetSandBoxPath.h"
#import "NSDate+XYDateEx.h"

@interface ANAudioTool ()<AVAudioRecorderDelegate,AVAudioPlayerDelegate>
//caf文件名
@property (copy, nonatomic) NSString *fileName;
//caf文件路径(包括文件名)
@property (copy, nonatomic) NSString *filePath;
//MP3路径
@property (strong, nonatomic) NSString *mp3FilePath;
//录音对象
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
//时间监控定时器
@property (strong, nonatomic) NSTimer *monitorTime;
//计时时间
@property (assign, nonatomic) NSInteger timeIndex;
//是否需要转码(时间短是时候设置这个属性)
@property (assign, nonatomic) BOOL tooShort;

//播放语音对象(必须全局)
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//播放完的回调
@property (copy, nonatomic) void(^playComplete)();
//是否有录音权限(YES 有权限)
@property (assign, nonatomic) BOOL recordPermission;

@end

@implementation ANAudioTool

static ANAudioTool *obj = nil;

+ (instancetype)sharedAudioTool{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        obj = [[ANAudioTool alloc] init];
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:[[XYGetSandBoxPath an_getCachesDirectory] stringByAppendingPathComponent:@"voice"]]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:[[XYGetSandBoxPath an_getCachesDirectory] stringByAppendingPathComponent:@"voice"] withIntermediateDirectories:YES attributes:nil error:nil];
        }
    });
    return obj;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.recordPermission = [[NSUserDefaults standardUserDefaults] boolForKey:@"recordPermission"];
    }
    return self;
}

#pragma mark - 录制语音

- (void)an_startRecordingAudio{
    
    if (!self.recordPermission) {
        [[[UIAlertView alloc] initWithTitle:nil
                                    message:@"需要访问您的麦克风。\n请启用麦克风-设置/隐私/麦克风"
                                   delegate:nil
                          cancelButtonTitle:@"好"
                          otherButtonTitles:nil] show];
        return;
    }
    
    [self setRecordSession];
    
    self.timeIndex = 0;
    self.recording = YES;
    self.tooShort = NO;
    //确保安全  清空一次定时器
    [self stopTimer];
    
    //开启定时器
    
    self.fileName = [NSString stringWithFormat:@"%@.caf",[NSDate getSystemCurrentTimestamp]];
    
    [self.audioRecorder record];//首次使用应用时如果调用record方法会询问用户是否允许使用麦克风
    
    [self startTheTimer];
}

- (void)an_stopRecordingAudio{
    
    [self.audioRecorder stop];
    [self stopTimer];
    if (self.timeIndex < 2) {
        self.tooShort = YES;
        if ([self.an_delegate respondsToSelector:@selector(durationToShort)]) {
            [self.an_delegate durationToShort];
        }
    }
    self.recording = NO;
}

- (void)an_cancelRecordingAudio{
    
    [self an_stopRecordingAudio];
    [self stopTimer];
    
    [XYGetSandBoxPath an_removeDocumentWithFilePath:self.filePath];
}

- (void)startTheTimer{
    
    self.monitorTime = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                        target:self
                                                      selector:@selector(timerAction)
                                                      userInfo:nil
                                                       repeats:YES];
    
    if (self.monitorTime != nil) {
        
        [[NSRunLoop currentRunLoop] addTimer:self.monitorTime
                                     forMode:UITrackingRunLoopMode];
    }
    [self.monitorTime fire];
}

- (void)timerAction{
    
    self.timeIndex += 1.0;
    
    if (self.timeIndex / 10 >= 50.0 && self.timeIndex % 10 == 0) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if ([self.an_delegate respondsToSelector:@selector(limitTimeComing:)]) {
                [self.an_delegate limitTimeComing:60 - self.timeIndex / 10];
            }
        });
        
    } else if (self.timeIndex / 10 == 60) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if ([self.an_delegate respondsToSelector:@selector(exceededTimeLimit)]) {
                [self.an_delegate exceededTimeLimit];
            }
        });
    }
    //同时监听音量变化
    [self monitorVolume];
}

- (void)stopTimer{
    
    [self.monitorTime invalidate];
    self.monitorTime = nil;
}

#pragma mark - 监听声音大小的变化
- (void)monitorVolume{
    
    [self.audioRecorder updateMeters];
    
    CGFloat myVolume = powf(10, 0.05 * [self.audioRecorder peakPowerForChannel:1]);
    
    UIImage *image = nil;
    
    if (myVolume < 0.5) {
        
        image = [UIImage imageNamed:@"dahuatong-1"];
    } else if (myVolume <= 0.15) {
        
        image = [UIImage imageNamed:@"dahuatong-2"];
    } else if (myVolume > 0.15 && myVolume <= 0.3) {
        
        image = [UIImage imageNamed:@"dahuatong-3"];
    } else if (myVolume > 0.3 && myVolume <= 0.45) {
        
        image = [UIImage imageNamed:@"dahuatong-4"];
    } else if (myVolume > 0.45 && myVolume <= 0.6) {
        
        image = [UIImage imageNamed:@"dahuatong-5"];
    } else if (myVolume > 0.6) {
        
        image = [UIImage imageNamed:@"dahuatong-6"];
    }

    if ([self.an_delegate respondsToSelector:@selector(retuenVolumeImage:)]) {
        
        [self.an_delegate retuenVolumeImage:image];
    }
}

//获取录音对象
-(AVAudioRecorder *)audioRecorder{
    
    if (!_audioRecorder) {
        
        //创建录音文件保存路径
        NSURL *filePath = [self getSavePath];
        
        //创建录音格式设置
        NSDictionary *setting = [self getAudioSetting];
        
        //创建录音机
        NSError *error = nil;
        _audioRecorder = [[AVAudioRecorder alloc]initWithURL:filePath settings:setting error:&error];
        _audioRecorder.delegate = self;
        _audioRecorder.meteringEnabled = YES;//如果要监控声波则必须设置为YES
        
        if (error) {
            NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
            return nil;
        }
    }
    return _audioRecorder;
}

//获得路径
-(NSURL *)getSavePath{
    
    NSString *cachePath =[XYGetSandBoxPath an_getCachesDirectory];
    NSString *filePath = [cachePath stringByAppendingPathComponent:self.fileName];
    self.filePath = filePath;
    NSLog(@"file path:%@",filePath);
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    return fileURL;
}

//录音文件设置
-(NSDictionary *)getAudioSetting{
    
    //LinearPCM 是iOS的一种无损编码格式,但是体积较为庞大
    //录音设置
    NSMutableDictionary *recordSettings = [[NSMutableDictionary alloc] init];
    //录音格式 无法使用
    [recordSettings setValue :[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey: AVFormatIDKey];
    //采样率(跟lame_set_in_samplerate(lame, 8000.0);数值相同)
    [recordSettings setValue :[NSNumber numberWithFloat:8000.0] forKey: AVSampleRateKey];//44100.0
    //通道数
    [recordSettings setValue :[NSNumber numberWithInt:2] forKey: AVNumberOfChannelsKey];
    //线性采样位数(不要设置为8,会有问题,其他的没测试)
    //    [recordSettings setValue :[NSNumber numberWithInt:8] forKey: AVLinearPCMBitDepthKey];
    //音频质量,采样质量
    [recordSettings setValue:[NSNumber numberWithInt:AVAudioQualityMin] forKey:AVEncoderAudioQualityKey];
    
    return recordSettings;
}

//准备会话
-(void)setRecordSession{
    
    AVAudioSession *audioSession=[AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive:YES error:nil];
}

-(void)setPlayerSession{
    
    AVAudioSession *audioSession=[AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
}


//转MP3
- (void)formatConversionToMP3WithCompleted:(void(^)(NSString *filePath ,NSInteger time))completed{
    
    if (self.tooShort) {
        [XYGetSandBoxPath an_removeDocumentWithFilePath:self.filePath];
    } else {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            self.mp3FilePath = [[XYGetSandBoxPath an_getCachesDirectory] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp3",[self.fileName  stringByReplacingOccurrencesOfString:@".caf" withString:@""]]];
            
            @try {
                int read, write;
                
                FILE *pcm = fopen([self.filePath cStringUsingEncoding:1], "rb");  //source 被转换的音频文件位置
                fseek(pcm, 4*1024, SEEK_CUR);                                   //skip file header
                FILE *mp3 = fopen([self.mp3FilePath cStringUsingEncoding:1], "wb");  //output 输出生成的Mp3文件位置
                
                const int PCM_SIZE = 8192;
                const int MP3_SIZE = 8192;
                short int pcm_buffer[PCM_SIZE*2];
                unsigned char mp3_buffer[MP3_SIZE];
                
                lame_t lame = lame_init();
                lame_set_in_samplerate(lame, 8000.0);
                lame_set_VBR(lame, vbr_default);
                lame_init_params(lame);
                
                do {
                    read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
                    if (read == 0)
                        write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
                    else
                        write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
                    
                    fwrite(mp3_buffer, write, 1, mp3);
                    
                } while (read != 0);
                
                lame_close(lame);
                fclose(mp3);
                fclose(pcm);
            }
            @catch (NSException *exception) {
                NSLog(@"%@",[exception description]);
            }
            @finally {
#pragma mark 在这里完成转MP3
                //删除 caf 文件
                NSLog(@"转 MP3 成功");
                [XYGetSandBoxPath an_removeDocumentWithFilePath:self.filePath];
                typeof(self)weakSelf = self;
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if (completed) {
                        completed(weakSelf.mp3FilePath ,self.timeIndex / 4);
                    }
                });
            }
        });
    }
}

#pragma mark - 播放语音
#pragma mark 本地
- (void)preparePlayLocalAuidoWithAudioURLStr:(NSString *)audioFile{
    NSError *error = nil;
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:audioFile] error:&error];
    
    [self setPlayerSession];
    
    [self preparePlay];
}
#pragma mark 网络
- (void)preparePlayNetAuidoWithAudioURLStr:(NSString *)audioFile{
    
    NSString *filePath = [[XYGetSandBoxPath an_getCachesDirectory] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp3",[NSDate getSystemCurrentTimestamp]]];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:audioFile]];
    [data writeToFile:filePath atomically:YES];
    
    [self preparePlayLocalAuidoWithAudioURLStr:filePath];
    
}
#pragma mark 抽一下
- (void)preparePlay{
    
    self.audioPlayer.delegate = self;
    
    [self.audioPlayer prepareToPlay];
    
}
#pragma mark 播放
- (void)playAudio{
    [self setPlayerSession];
    
    [self.audioPlayer stop];
    [self handleNotification:YES];
    [self.audioPlayer play];
}
#pragma mark 暂停
- (void)playPause{
    
    [self.audioPlayer pause];
}
#pragma mark 停止
- (void)stopAudio{
    
    [self.audioPlayer stop];
    [self handleNotification:NO];
}
#pragma mark 播完了
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
    [self handleNotification:NO];
    if ([self.an_delegate respondsToSelector:@selector(audioPlayCompleted)]) {
        [self.an_delegate audioPlayCompleted];
    }
}

#pragma mark - 监控距离
- (void) handleNotification:(BOOL)state
{
    [[UIDevice currentDevice] setProximityMonitoringEnabled:state]; //建议在播放之前设置yes，播放结束设置NO，这个功能是开启红外感应
    
    if(state)//添加监听
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(sensorStateChange:) name:@"UIDeviceProximityStateDidChangeNotification"
                                                   object:nil];
    else//移除监听
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UIDeviceProximityStateDidChangeNotification" object:nil];
}

//处理监听触发事件
-(void)sensorStateChange:(NSNotificationCenter *)notification;
{
    //如果此时手机靠近面部放在耳朵旁，那么声音将通过听筒输出，并将屏幕变暗（省电啊）
    if ([[UIDevice currentDevice] proximityState] == YES)
    {
        NSLog(@"Device is close to user");
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    }
    else
    {
        NSLog(@"Device is not close to user");
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
}


@end
