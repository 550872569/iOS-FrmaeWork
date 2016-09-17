//
//  ANBlueToothVC.m
//  AudioNote
//
//  Created by Yan on 16/9/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANBlueToothVC.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface ANBlueToothVC ()<ANDictationWEIBottomViewDelegate,ANAudioToolDelegate,CBCentralManagerDelegate,CBPeripheralDelegate> {

    /** 录音工具 */
    ANAudioTool *_audio;
    /** 蓝牙管理器 */
    CBCentralManager *_mangerCentral;
    NSMutableArray *_arrayCentralManger;
}

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
    [self configBluetooth];
}

- (void)configUI {
    ANDictationWEIBottomView *viewBottom = [[ANDictationWEIBottomView alloc]initWithFrame:CGRectMake(0, CONTENT_HEIGHT-64, SCREEN_WIDTH, 64)];
    viewBottom.delegate = self;
    [self.view addSubview:viewBottom];
}

#pragma mark 录音开始
- (void)buttonAudioStartAction:(UIButton *)sender {
    [_audio an_startRecordingAudio];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"self%@",self);
}
#pragma mark 标记-暂停-保存
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
/**
 蓝牙步骤
 1. 建立中心设备
 
 2. 扫描外设（Discover Peripheral）
 
 3. 连接外设(Connect Peripheral)
 
 4. 扫描外设中的服务和特征(Discover Services And Characteristics)
 
 5. 利用特征与外设做数据交互(Explore And Interact)
 
 6. 断开连接(Disconnect)
 */
#pragma mark- 蓝牙
- (void)configBluetooth {
    /** 1.初始化管理者 设置代理 */
    _mangerCentral = [[CBCentralManager alloc]initWithDelegate:self queue:nil options:0];
    /** 2. 开始扫描所有设备 */
    [_mangerCentral scanForPeripheralsWithServices:nil options:0];
    _arrayCentralManger = [NSMutableArray array];
}
#pragma mark 蓝牙代理方法 获取链接状态
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSLog(@"state:%ld",(long)central.state);
}

- (void)centralManager:(CBCentralManager *)central willRestoreState:(NSDictionary<NSString *, id> *)dict {
    
    
}
#pragma mark 3. 当扫描到外围设备的时候会调用的方法
/**
 1. peripheral: 扫描到的外围设备
 2. advertisementData: 数据
 3. RSSI: 信号强度
 */
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *, id> *)advertisementData RSSI:(NSNumber *)RSSI {
    
    if (![_arrayCentralManger containsObject:peripheral]) {
        [_arrayCentralManger addObject:peripheral];
    }
}
#pragma mark 5. 当连接外设时会调用的方法
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    //5.1 需要使用外设来扫描服务 --> 接下来的操作, 都是外设来完成
    //如果知道服务的UUID, 就传. 如果传nil, 代表扫描所有服务
    [peripheral discoverServices:nil];
    
    //5.2 设置外设的代理
    peripheral.delegate = self;
}
- (void)connectPeripheral:(CBPeripheral *)peripheral {
    [_mangerCentral connectPeripheral:peripheral options:0];
   
}


- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    
}

#pragma mark 6. 当扫描到服务时会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    //这里需要遍历服务, 来找到指定的服务. 然后我们才能去找特征
    //peripheral有一个services属性, 装载着扫描到的所有服务
    for (CBService *service in peripheral.services) {
        
        //假如蓝牙厂商提供的服务的UUID为"123456"
        if ([service.UUID.UUIDString isEqualToString:@"123456"]) {
            
            //如果进入了此方法中, 那么就代表已经找到了指定的服务
            [peripheral discoverCharacteristics:nil forService:service];
        }
    }
}
#pragma mark 7. 当扫描到指定服务的特征时会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error
{
    //这里需要遍历特征, 来找到指定的特征. 然后我们才能去读写操作(收发信息的操作)
    ////service有一个Characteristics属性, 装载着扫描到的所有服务
    for (CBCharacteristic *characteristic in service.characteristics) {
        
        //假如蓝牙厂商提供的特征的UUID为"654321"
        if ([characteristic.UUID.UUIDString isEqualToString:@"654321"]) {
            //如果进入了此方法中, 那么就代表已经找到了指定的特征
            //接下来就可以再这里进行数据收发操作
            
            //写入数据
            //peripheral writeValue:<#(nonnull NSData *)#> forCharacteristic:<#(nonnull CBCharacteristic *)#> type:<#(CBCharacteristicWriteType)#>
            
            //获取数据
            //[peripheral readValueForCharacteristic:characteristic];
            
        }
        
    }
}

#pragma mark 8. 停止扫描
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //在合适的地方, 来停止扫描
    [_mangerCentral stopScan];
}

@end
