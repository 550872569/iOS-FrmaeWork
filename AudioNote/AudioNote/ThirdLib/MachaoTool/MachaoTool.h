//
//  MachaoTool.h
//  qikeyun
//
//  Created by 马超 on 15/6/5.
//  Copyright (c) 2015年 Jerome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MachaoTool : NSObject
//获取文字的高度
+ (CGFloat)GetHeightWithContent:(NSString *)content MaxW:(CGFloat)maxw MaxH:(CGFloat)maxh FontSize:(CGFloat)fontSize;

//获取带有格式的金钱数字
+ (NSString *)getNumberFormatByNumerString:(NSString *)str;

//把带有格式的数字转换成普通的数字
+ (NSString *)getNormalNumberByNumberFormatString:(NSString *)str;

//对图片的尺寸进行剪切
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

//获取当前的时间，返回的是个数组，顺序分别为年，月，日，时，分，秒，星期
+ (NSArray *)getNowDate;

//根据日期获取是第几周
+ (BOOL)FirstDayOfMonthIsSandayWithDate:(NSDate *)date;
+ (NSInteger)getWeekOfMonthWithDate:(NSDate *)date;
/**
 *  根据NSDate获取日期。格式为2015-05-12
 */
+ (NSString *)getFormatDateWithDate:(NSDate *)date;
/**
 *  根据标准的字符串获取nsdate
 */
+ (NSDate *)getDateWithDateStr:(NSString *)dateStr;

/**
 *  根据一个标准的时间，获取格式为2015-01-10 周四 
 */
+ (NSString *)getAllDayFormatterWithDate:(NSString *)date;
/**
 *  获取下一个小时的日期格式
 */
+ (NSString *)getNextHourWithDate:(NSString *)date;
/**
 *  获取某个时间之前多少分钟的时间
 */
+ (NSString *)getBeforeMinutes:(NSString *)minute withDate:(NSString *)date;
//根据年月日获取星期几
+ (NSString *)getWeekByYear:(NSString *)year Month:(NSString *)month Day:(NSString *)day;

//根据某个日期获取某些天之前的数据，格式为2015年01月21日 没有十分秒的概念,返回的格式为2015年03月24日
+ (NSString *)getDateSinceDate:(NSString *)date byDayNum:(int)dayNum;

//日期转换格式 例如 2015年03月23日 ----》 2015-03-23

+ (NSString *)getNormalDateStringWithString:(NSString *)str;

//日期转换格式 例如   2015-03-23----》2015年03月23日

+ (NSString *)getFormatDateStringWithString:(NSString *)str;


+ (NSString *)getFormatNumStringWithNum:(NSString *)num;
/**
 *  根据一个标准的时间字符串比较日期
 */
+(BOOL)compareDateWithWholeStartTime:(NSString *)start andEndTime:(NSString *)end;
//对比两个日期，开始时间>结束事件->NO OR 开始时间<=结束事件->YES

+(BOOL)compareDateWithStartTime:(NSString *)start andEndTime:(NSString *)end;

+ (UIImage *)createImageWithColor:(UIColor *)color rect:(CGRect)rect;

//获取两个日期中的间隔天数 ，格式都是2015年03月23日
+ (int)getTotalDateFromStartDate:(NSString *)startDate EndDate:(NSString *)endDate;

//根据一个数字获得它头部最大的值
+ (double)getIntWithDouble:(double)max;

//根据一个标准的日期字符(2015-08-29 14:05:20.599)串获取需要的格式 (08月29日 周几 14：05)，包括今天 昨天 和 明天 以及是不是显示去年和今年，
//此方法需要依赖NSDate的分类
+ (NSString *)getDateFormatWithWeekAndTimeByDateString:(NSString *)dateStr;

+ (NSString *)getDateFormatWithWeekAndTimesByDateString:(NSString *)dateStr;
/**
 *  根据一个标准的日期字符(2015-08-29 14:05:20.599)串获取需要的格式 (08月29日 周几 )，包括今天 昨天 和 明天 以及是不是显示去年和今年，今天 周二 不显示小时和分钟
 *
 *  @param dateStr 标准的时间字符串
 *
 *  @return 返回的参数
 */
+ (NSString *)getDateFormatWithWeekByDateString:(NSString *)dateStr;
/**
 *  根据一个标准的日期字符(2015-08-29 14:05:20.599)串获取需要的格式 (08月29日  )，包括今天 昨天 和 明天 以及是不是显示去年和今年，今天  不显示小时和分钟,周几
 *
 *  @param dateStr 标准的时间字符串
 *
 *  @return 返回的参数
 */
+ (NSString *)getDateFormatWithOutWeekByDateString:(NSString *)dateStr;
//只保留年月日  去除分秒
+ (NSString *)getDateFormatByDateString:(NSString *)dateStr;

+(BOOL)compareTimeWithStartTime:(NSString *)start andEndTime:(NSString *)end;


+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate;

//4.10形式
+ (NSString *)getDateFormatWithOutWeeksByDateString:(NSString *)dateStr;
// 此方法产生时间戳+随机产生8位字符串 随机产生的位数。

+(NSString *)ret8bitString;

//等比例缩放图片

+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;


//MBPrograssHUD自定义方法
//******注意:使用该方法HUD需要单独设置代理，实现如下协议方法
/*
 #pragma -mbPrograssDelegate
 -(void)hudWasHidden:(MBProgressHUD *)hud
 
 {
 
 [hud removeFromSuperview];
 
 hud = nil;
 
 }
 
 */
+(void)showMBPrograssHUD:(UIView *)view ShowStr:(NSString *)str MB:(MBProgressHUD *)HUD;//默认居中的方法
+(void)showMBPrograssHUD:(UIView *)view ShowStr:(NSString *)str MB:(MBProgressHUD *)HUD IN:(NSTextAlignment *)Alignment;
@end
