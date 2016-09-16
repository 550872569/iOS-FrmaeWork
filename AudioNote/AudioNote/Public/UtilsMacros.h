//
//  UtilsMacros.h
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//
#pragma mark 实用工具宏定义
#ifndef UtilsMacros_h
#define UtilsMacros_h

//#ifdef __OBJC__
#pragma mark- NSLog DEBUG模式&release模式
#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

#pragma mark- AppDelegate
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#pragma mark- System version utils(系统版本)
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#pragma mark iOS版本大于等于7.0
#define IOS7 [[UIDevice currentDevice] systemVersion].floatValue>=7
#define iOS7_OR_LATER   SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#pragma mark iOS系统版本-iOS7-iOS8
#define iOS7x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
#pragma mark iOS版本大于等于8.0
#define iOS8_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")
#define IOS8_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#pragma mark iOS系统版本-iOS8-iOS9
#define iOS8x [[[UIDevice currentDevice] systemVersion] floatValue] >=8.0f && ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0f)
#pragma mark iOS系统版本-iOS9+
#define iOS9x [[[UIDevice currentDevice] systemVersion] floatValue] >=9.0f

#pragma mark - 判断设备型号
#pragma mark iPhone4s
#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#pragma mark iPhone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#pragma mark iPhone6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#pragma mark  iPhone6P
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark - 字体
//像素对应的字体大小
#define kSystemFont(f) [UIFont systemFontOfSize:f]
#define kBoldFont(f) [UIFont boldSystemFontOfSize:f]
#define kFONTFromePX(PX) [UIFont systemFontOfSize:(PX * 0.5)]
#define kFONT_18PX [UIFont systemFontOfSize:11]
#define kFONT_20PX [UIFont systemFontOfSize:12]
#define kFONT_22PX [UIFont systemFontOfSize:13]
#define kFONT_24PX [UIFont systemFontOfSize:14]
#define kFONT_26PX [UIFont systemFontOfSize:15]
#define kFONT_28PX [UIFont systemFontOfSize:16]
#define kFONT_30PX [UIFont systemFontOfSize:17]
#define kFONT_32PX [UIFont systemFontOfSize:17.5]
#define kFONT_34PX [UIFont systemFontOfSize:18]
#define kFONT_36PX [UIFont systemFontOfSize:19]

#define kFONT_WEI_TITLE [UIFont systemFontOfSize:30]
#define kFONT_WEI_SUBTITLE [UIFont systemFontOfSize:20]

#pragma mark- 获取系统时间戳
#define getCurentTime [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]
#pragma mark - 获得当前的 年 月 日 时 分 秒
#define kCurrentSec [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:[NSDate date]]
#define kCurrentMin [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:[NSDate date]]
#define kCurrentHour [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]]
#define kCurrentDay [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate date]]
#define kCurrentMonth [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]]
#define kCurrentYear [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]]

#pragma mark- 角度转弧度
#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)

#pragma mark- UIImageName有缓存
#define UIImageNamed(image) [UIImage imageNamed:@"image"]
#pragma mark UIImageFile无缓存
#define UIImageFile(image) [UIImage imageWithContentsOfFile:@"image"]

#pragma mark- 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define COLOR_RANDOM [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];      //随机色
#define COLOR_RED [UIColor redColor]                        //红色
#define COLOR_WHITE [UIColor whiteColor]                    //白色
#define COLOR_GRAY [UIColor grayColor]                      //灰色
#define COLOR [UIColor greenColor]                          //绿色
#define COLOR_YELLOW [UIColor yellowColor]                  //黄色
#define COLOR_BLUE [UIColor blueColor]                      //蓝色
#define COLOR_BROWN [UIColor brownColor]                    //棕色
#define COLOR_BLACK [UIColor blackColor]                    //黑色
#define COLOR_DARK [UIColor darkGrayColor]                  //深灰色
#define COLOR_LIGHTGRAY [UIColor lightGrayColor]            //浅灰色
#define COLOR_ORANGE [UIColor orangeColor]                  //橘色
#define COLOR_PURPLE [UIColor purpleColor]                  //紫色
#define COLOR_CLEARN [UIColor clearColor]                   //透明
#define COLOR_SYSTEM_BACKGROUND RGB(80,80,95)                          //系统背景色

//#endif
#endif /* UtilsMacros_h */
