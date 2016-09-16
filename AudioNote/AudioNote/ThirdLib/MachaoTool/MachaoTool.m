//
//  MachaoTool.m
//  qikeyun
//
//  Created by 马超 on 15/6/5.
//  Copyright (c) 2015年 Jerome. All rights reserved.
//

#import "MachaoTool.h"
#import "NSDate+Category.h"

static NSNumberFormatter* currencyNumberFormatter;
static NSCharacterSet* invalidInputCharacterSet;
@interface MachaoTool ()

@end


@implementation MachaoTool

+(void)initialize
{
    invalidInputCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];

    currencyNumberFormatter = [[NSNumberFormatter alloc] init];
    currencyNumberFormatter.locale = [NSLocale currentLocale];
    currencyNumberFormatter.numberStyle = kCFNumberFormatterDecimalStyle;
}

//根据字符串获取NSNumber
+ (NSNumber*) amountFromString: (NSString*) string
{
    

    //必须要去除字符串中的小数dian
    NSString *str = string;
    if ([string rangeOfString:@"."].location != NSNotFound) {
        NSArray *array = [string componentsSeparatedByString:@"."];
        if (array.count) {
            NSString *firstStr = array.firstObject;
            if (firstStr.length) {
                str = firstStr;
            }
        }
    }
   
    NSString* digitString = [[str componentsSeparatedByCharactersInSet: invalidInputCharacterSet] componentsJoinedByString: @""];
    
    //    NSParameterAssert( self.currencyNumberFormatter.maximumFractionDigits == _currencyNumberFormatter.minimumFractionDigits );
    NSInteger fd = currencyNumberFormatter.minimumFractionDigits;
    NSNumber* n = [NSNumber numberWithDouble: [digitString doubleValue] / pow(10.0, fd) ];
    
    return n;
}
//获取文字的高度
+ (CGFloat)GetHeightWithContent:(NSString *)content MaxW:(CGFloat)maxw MaxH:(CGFloat)maxh FontSize:(CGFloat)fontSize
{
    
    NSMutableDictionary *contentdic = [NSMutableDictionary dictionary];
    contentdic[NSFontAttributeName] = [UIFont systemFontOfSize:fontSize];
    
    CGRect rect = [content boundingRectWithSize:CGSizeMake(maxw, maxh) options:NSStringDrawingUsesLineFragmentOrigin attributes:contentdic context:nil];
    CGSize contentSize = rect.size;
    return contentSize.height;
}

//过去带有格式的金钱数字
+ (NSString *)getNumberFormatByNumerString:(NSString *)str
{

    NSNumber *number = [self amountFromString:str];
    NSString *tempStr = [currencyNumberFormatter stringFromNumber:number];
   
    return tempStr;
}

//把带有格式的数字转换成普通的数字
+ (NSString *)getNormalNumberByNumberFormatString:(NSString *)str
{
    NSNumber *tempNumber = [currencyNumberFormatter numberFromString:str];
    
    NSString *tempStr = [NSString stringWithFormat:@"%@",tempNumber];
    
    return tempStr;

}
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen
                                                   mainScreen].scale);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
   
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}
+ (BOOL)FirstDayOfMonthIsSandayWithDate:(NSDate *)date
{
    //设置当前的时间
    NSInteger week;
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = date;
    NSDateComponents *comps = [NSDateComponents new];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit|NSWeekOfMonthCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:now];
    week = [comps weekday];
    if (week == 1) {
        return YES;
    }
    return NO;
}
+ (NSString *)getNextHourWithDate:(NSString *)date
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    //将传入的日期转为NSDate
    NSDate *d = [dateFormat dateFromString:date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
     NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setHour:1];
    NSDate *re = [calendar dateByAddingComponents:comps toDate:d options:NSCalendarMatchNextTime];
    NSString *retStr = [dateFormat stringFromDate:re];
    
    return retStr;
    
}

+(NSDate *)getDateWithDateStr:(NSString *)dateStr
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    //将传入的日期转为NSDate
    NSDate *d = [dateFormat dateFromString:dateStr];
    return d;
}
+ (NSString *)getBeforeMinutes:(NSString *)minute withDate:(NSString *)date
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    //将传入的日期转为NSDate
    NSDate *d = [dateFormat dateFromString:date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMinute:-minute.intValue];
    NSDate *re = [calendar dateByAddingComponents:comps toDate:d options:NSCalendarMatchNextTime];
    NSString *retStr = [dateFormat stringFromDate:re];
    
    return retStr;
}
+ (NSInteger )getWeekOfMonthWithDate:(NSDate *)date
{
    //设置当前的时间
    NSInteger weekOfMOnth;

    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = date;
    NSDateComponents *comps = [NSDateComponents new];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit|NSWeekOfMonthCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:now];
    weekOfMOnth = [comps weekOfMonth];
    return weekOfMOnth;
}
+(NSString *)getAllDayFormatterWithDate:(NSString *)date
{
    if (date.length != 19) {
        date = @"2015-01-01 00:00:00";
    }
    NSString *str = [date substringToIndex:10];
    NSString *week = [self getWeekByYear:[str substringToIndex:4] Month:[str substringWithRange:NSMakeRange(5, 2)] Day:[str substringWithRange:NSMakeRange(8, 2)]];
    return [NSString stringWithFormat:@"%@ %@",str,week];
}

+ (NSString *)getFormatDateWithDate:(NSDate *)date
{

    if (!date) {
        return @"2015-01-01";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSString *dateStr = [dateFormatter stringFromDate:date];

    if (dateStr.length == 10) {
        return dateStr;
    }
    return @"2015-01-01";
}
+ (NSArray *)getNowDate
{
    //设置当前的时间
    NSInteger year,month,day,hour,min,sec,week;
    NSString *weekStr=nil;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = [NSDate date];;
    NSDateComponents *comps = [NSDateComponents new];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:now];
    year = [comps year];
    week = [comps weekday];
    month = [comps month];
    day = [comps day];
    hour = [comps hour];
    min = [comps minute];
    sec = [comps second];
    if(week==1)
    {
        weekStr=@"周日";
    }else if(week==2){
        weekStr=@"周一";
        
    }else if(week==3){
        weekStr=@"周二";
        
    }else if(week==4){
        weekStr=@"周三";
        
    }else if(week==5){
        weekStr=@"周四";
        
    }else if(week==6){
        weekStr=@"周五";
        
    }else if(week==7){
        weekStr=@"周六";
        
    }
    else {
        //            (@"error!");
    }

    
    NSArray *array = @[[NSString stringWithFormat:@"%ld",(long)year],[NSString stringWithFormat:@"%02d",(int)month],[NSString stringWithFormat:@"%02d",(int)day],[NSString stringWithFormat:@"%02d",(int)hour],[NSString stringWithFormat:@"%02d",(int)min],[NSString stringWithFormat:@"%02d",(int)sec],[NSString stringWithFormat:@"%@",weekStr]];
    return array;
}

//根据年月日获取星期几
+ (NSString *)getWeekByYear:(NSString *)year Month:(NSString *)month Day:(NSString *)day
{
    
    NSDateComponents *_comps = [[NSDateComponents alloc] init];
    [_comps setDay:day.integerValue];
    [_comps setMonth:month.integerValue];
    [_comps setYear:year.integerValue];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *_date = [gregorian dateFromComponents:_comps];
    NSDateComponents *weekdayComponents =
    [gregorian components:NSWeekdayCalendarUnit fromDate:_date];
    int week = (int)[weekdayComponents weekday];
    NSString *weekStr;
    if(week==1)
    {
        weekStr=@"星期日";
    }else if(week==2){
        weekStr=@"星期一";
        
    }else if(week==3){
        weekStr=@"星期二";
        
    }else if(week==4){
        weekStr=@"星期三";
        
    }else if(week==5){
        weekStr=@"星期四";
        
    }else if(week==6){
        weekStr=@"星期五";
        
    }else if(week==7){
        weekStr=@"星期六";
        
    }
    else {
        //            (@"error!");
    }

    return weekStr;
}
+ (NSString *)getDateSinceDate:(NSString *)date byDayNum:(int)dayNum
{
    NSString *retStr = @"";
    if (date.length == 11) {
        NSString *dateStr = [NSString stringWithFormat:@"%@-%@-%@",[date substringWithRange:NSMakeRange(0, 4)],[date substringWithRange:NSMakeRange(5, 2)],[date substringWithRange:NSMakeRange(8, 2)]];
        //把字符串转为下边的饿格式
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        NSDate *from = [dateFormatter dateFromString:dateStr];
        
        NSDate *lastDate;
        if(dayNum!=0)
        {
            NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
            lastDate = [from initWithTimeInterval:-oneDay*dayNum sinceDate:from];
        }
        else
        {
            lastDate = from;
        }
        NSString *lastDateString = [dateFormatter stringFromDate:lastDate];
        if (lastDateString.length == 10 ) {
           lastDateString =  [lastDateString stringByReplacingCharactersInRange:NSMakeRange(4, 1) withString:@"年"];
           lastDateString =  [lastDateString stringByReplacingCharactersInRange:NSMakeRange(7, 1) withString:@"月"];
            retStr = [NSString stringWithFormat:@"%@日",lastDateString];
        }else{
            retStr = @"";
        }
    }
    return retStr;
}
+ (NSString *)getNormalDateStringWithString:(NSString *)str
{
    NSString *res = @"";
    if (str.length == 11) {
        res = str;
        res = [res stringByReplacingCharactersInRange:NSMakeRange(4, 1) withString:@"-"];
        res = [res stringByReplacingCharactersInRange:NSMakeRange(7, 1) withString:@"-"];
        res = [res substringToIndex:res.length- 1];
    }else{
        res = @"";
    }
    
    return res;
}
+ (NSString *)getFormatDateStringWithString:(NSString *)str
{
    NSString *res = @"";
    if (str.length == 10) {
        res = str;
        res = [res stringByReplacingCharactersInRange:NSMakeRange(4, 1) withString:@"年"];
        res = [res stringByReplacingCharactersInRange:NSMakeRange(7, 1) withString:@"月"];
        res = [res stringByAppendingString:@"日"];
    }else{
        res = @"";
    }
    
    return res;
}
+ (NSString *)getFormatNumStringWithNum:(NSString *)num
{
    NSString *str = @"";
    double count = num.doubleValue;
    if (count && count > 0) {
        if (count >= 100000000) {
            str = [NSString stringWithFormat:@"%.2f亿",count/100000000.0];
        }else{
            if (count > 10000) {
                str = [NSString stringWithFormat:@"%.2f万",count/10000.0];
            }else{
                str = [NSString stringWithFormat:@"%.2f",count/1.0];
            }
        }
    }else{
     str = @"0";
    }
    return str;
}

+(BOOL)compareDateWithWholeStartTime:(NSString *)start andEndTime:(NSString *)end
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//设定时间格式,这里可以设置成自己需要的格式
    dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSDate *startDate =[dateFormat dateFromString:start];
    NSDate *endDate =[dateFormat dateFromString:end];
    NSDate *earlyDate =[startDate earlierDate:endDate];
    if ([startDate isEqualToDate:endDate]) {
        return YES;
    }
    
    if ([earlyDate isEqualToDate:startDate]) {
        return YES;
    }
    return NO;
}
+(BOOL)compareDateWithStartTime:(NSString *)start andEndTime:(NSString *)end{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    
    [dateFormat setDateFormat:@"yyyy年MM月dd日"];//设定时间格式,这里可以设置成自己需要的格式
      dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSDate *startDate =[dateFormat dateFromString:start];
    NSDate *endDate =[dateFormat dateFromString:end];
    NSDate *earlyDate =[startDate earlierDate:endDate];
    if ([startDate isEqualToDate:endDate]) {
        return YES;
    }
    
    if ([earlyDate isEqualToDate:startDate]) {
        return YES;
    }
    return NO;
}

+(BOOL)compareTimeWithStartTime:(NSString *)start andEndTime:(NSString *)end{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    
    [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式,这里可以设置成自己需要的格式
    dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSDate *startDate =[dateFormat dateFromString:start];
    NSDate *endDate =[dateFormat dateFromString:end];
    NSDate *earlyDate =[startDate earlierDate:endDate];
    if ([startDate isEqualToDate:endDate]) {
        return YES;
    }
    
    if ([earlyDate isEqualToDate:startDate]) {
        return YES;
    }
    return NO;
}


//根据颜色创建一个图片
+ (UIImage *)createImageWithColor:(UIColor *)color rect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (int)getTotalDateFromStartDate:(NSString *)startDate EndDate:(NSString *)endDate
{
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *fromDate;
    NSDate *toDate;
    [gregorian rangeOfUnit:NSDayCalendarUnit startDate:&fromDate interval:NULL forDate:[dateFormatter dateFromString:startDate]];
    [gregorian rangeOfUnit:NSDayCalendarUnit startDate:&toDate interval:NULL forDate:[dateFormatter dateFromString:endDate]];
    NSDateComponents *dayComponents = [gregorian components:NSDayCalendarUnit fromDate:fromDate toDate:toDate options:0];
    
    return (int)dayComponents.day;

//    NSDateFormatter *date=[[NSDateFormatter alloc] init];
//    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *d = [date dateFromString:[NSString stringWithFormat:@"%@",[self getNormalDateStringWithString:startDate]]];
//    
//    NSTimeInterval late=[d timeIntervalSince1970]*1;
//    
//    
//    NSDate *d1=[date dateFromString:[NSString stringWithFormat:@"%@",[self getNormalDateStringWithString:endDate]]];
//    
//    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
//    NSString *timeString=@"";
//    
//    NSTimeInterval cha=late1-late;
//    
//    if (cha == 0) {
//        return 0;
//    }
//    if (cha/86400>=1)
//    {
//        timeString = [NSString stringWithFormat:@"%f", cha/86400];
//        timeString = [timeString substringToIndex:timeString.length-7];
//        return [timeString intValue] + 1;
//    }else{
//        return -1;
//    }
//    return 0;
    
}

+ (double)getIntWithDouble:(double)max
{
    int a1 = 0;
    int b1 = 0;
    int sum1 = 1;
    while (max/10 >1) {
        
        a1 ++;
        b1 = max/10;
        max = max/10;
    }
    sum1 = b1 + 1;
    for (int i = 0; i < a1 ; i ++) {
        sum1 =  10 *sum1;
    }
    return sum1;
}


/**
 *  今天，明天，昨天
 *
 *  @param date 要转换的日期
 *
 *  @return 今天，明天，昨天
 */
-(NSString *)compareDate:(NSDate *)date{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString])
    {
        return @"今天";
    } else if ([dateString isEqualToString:yesterdayString])
    {
        return @"昨天";
    }else if ([dateString isEqualToString:tomorrowString])
    {
        return @"明天";
    }
    else
    {
        return dateString;
    }
}
//----------------------------------------------

/**
 /////  和当前时间比较
 ////   1）1分钟以内 显示        :    刚刚
 ////   2）1小时以内 显示        :    X分钟前
 ///    3）今天或者昨天 显示      :    今天 09:30   昨天 09:30
 ///    4) 今年显示              :   09月12日
 ///    5) 大于本年      显示    :    2013/09/09
 **/

+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate
{
    
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//设定时间格式,这里可以设置成自己需要的格式

        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        //// 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
        if (time<=60) {  //// 1分钟以内的
            dateStr = @"刚刚";
        }else if(time<=60*60){  ////  一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60*24){   //// 在两天内的
            
            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                //// 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                ////  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"MM-dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
    
    
}
+ (NSString *)getDateFormatWithWeekAndTimeByDateString:(NSString *)dateStr
{
    NSString *retStr = @"";
    @try {
        NSDateFormatter *date=[[NSDateFormatter alloc] init];
        [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *d=[date dateFromString:dateStr];
       // NSString *weakStr ;
      //  long int weak = d.weekday;
//        switch (weak) {
//            case 2:
//                weakStr = @"周一";
//                break;
//            case 3:
//                weakStr = @"周二";
//                break;
//            case 4:
//                weakStr = @"周三";
//                break;
//            case 5:
//                weakStr = @"周四";
//                break;
//            case 6:
//                weakStr = @"周五";
//                break;
//            case 7:
//                weakStr = @"周六";
//                break;
//            case 1:
//                weakStr = @"周日";
//                break;
//            default:
//                break;
//        }
        if (d.isToday) {
            retStr = [NSString stringWithFormat:@"今天 %@",[dateStr substringWithRange:NSMakeRange(11, 5)]];
            
        }else if (d.isYesterday){
            retStr = [NSString stringWithFormat:@"%@ %@",@"昨天",[dateStr substringWithRange:NSMakeRange(11, 5)]];
        }else if (d.isTomorrow){
            retStr = [NSString stringWithFormat:@"%@ %@",@"明天",[dateStr substringWithRange:NSMakeRange(11, 5)]];
        }//else if (d.isThisYear){
        
        //}
    else{
        retStr = [NSString stringWithFormat:@"%@ %@",[dateStr substringWithRange:NSMakeRange(5, 5)],[dateStr substringWithRange:NSMakeRange(11, 5)]];
        
//            retStr = [NSString stringWithFormat:@"%@ %@",[dateStr substringWithRange:NSMakeRange(0, 10)],[dateStr substringWithRange:NSMakeRange(11, 5)]];
        }
        return retStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
    
    
}

+ (NSString *)getDateFormatWithWeekAndTimesByDateString:(NSString *)dateStr
{
    
    
    NSString *retStr = @"";
    @try {
        NSDateFormatter *date=[[NSDateFormatter alloc] init];
        [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *d=[date dateFromString:dateStr];
        if (d.isThisYear){
            retStr = [NSString stringWithFormat:@"%@",[dateStr substringWithRange:NSMakeRange(11, 5)]];
        }else{
            retStr = [NSString stringWithFormat:@"%@",[dateStr substringWithRange:NSMakeRange(11, 5)]];
        }
        return retStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
    
    
}


+ (NSString *)getDateFormatWithWeekByDateString:(NSString *)dateStr
{
    NSString *retStr = @"";
    @try {
        NSDateFormatter *date=[[NSDateFormatter alloc] init];
        [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *d=[date dateFromString:dateStr];
        NSString *weakStr ;
        long int weak = d.weekday;
        switch (weak) {
            case 2:
                weakStr = @"周一";
                break;
            case 3:
                weakStr = @"周二";
                break;
            case 4:
                weakStr = @"周三";
                break;
            case 5:
                weakStr = @"周四";
                break;
            case 6:
                weakStr = @"周五";
                break;
            case 7:
                weakStr = @"周六";
                break;
            case 1:
                weakStr = @"周日";
                break;
            default:
                break;
        }
        if (d.isToday) {
            retStr = [NSString stringWithFormat:@"今天 %@",weakStr];
            
        }else if (d.isYesterday){
            retStr = [NSString stringWithFormat:@"%@ %@",@"昨天",weakStr];
        }else if (d.isTomorrow){
            retStr = [NSString stringWithFormat:@"%@ %@",@"明天",weakStr];
        }else if (d.isThisYear){
            retStr = [NSString stringWithFormat:@"%@ %@",[dateStr substringWithRange:NSMakeRange(5, 5)],weakStr];
        }else{
            retStr = [NSString stringWithFormat:@"%@ %@",[dateStr substringWithRange:NSMakeRange(0, 10)],weakStr];
        }
        return retStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}
+ (NSString *)getDateFormatWithOutWeekByDateString:(NSString *)dateStr
{
    NSString *retStr = @"";
    @try {
        NSDateFormatter *date=[[NSDateFormatter alloc] init];
        [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *d=[date dateFromString:dateStr];
       
        if (d.isToday) {
            retStr = [NSString stringWithFormat:@"今天"];
        }
//        }else if (d.isYesterday){
//            retStr = [NSString stringWithFormat:@"%@",@"昨天"];
//        }else if (d.isTomorrow){
//            retStr = [NSString stringWithFormat:@"%@",@"明天"];
//        }else if (d.isThisYear){
//            retStr = [NSString stringWithFormat:@"%@",[dateStr substringWithRange:NSMakeRange(5, 5)]];
//        }
            else{
            retStr = [NSString stringWithFormat:@"%@",[dateStr substringWithRange:NSMakeRange(0, 10)]];
        }
        return retStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}

+ (NSString *)getDateFormatWithOutWeeksByDateString:(NSString *)dateStr{
    NSString *retStr = @"";
    @try {
        NSDateFormatter *date=[[NSDateFormatter alloc] init];
        [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *d=[date dateFromString:dateStr];
        
        if (d.isToday) {
            retStr = [NSString stringWithFormat:@"今天"];
            
        }else if (d.isYesterday){
            retStr = [NSString stringWithFormat:@"%@",@"昨天"];
        }else if (d.isTomorrow){
            retStr = [NSString stringWithFormat:@"%@",@"明天"];
        }else if (d.isThisYear){
            retStr = [NSString stringWithFormat:@"%@",[dateStr substringWithRange:NSMakeRange(5, 5)]];
        }else{
            retStr = [NSString stringWithFormat:@"%@",[dateStr substringWithRange:NSMakeRange(0, 10)]];
        }
        return retStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}

+ (NSString *)getDateFormatByDateString:(NSString *)dateStr{
    
    NSString *retStr = @"";
    @try {
        NSDateFormatter *date=[[NSDateFormatter alloc] init];
        [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        retStr = [NSString stringWithFormat:@"%@.%@",[dateStr substringWithRange:NSMakeRange(5,2)],[dateStr substringWithRange:NSMakeRange(8,2)]];
        return retStr;
    }
    @catch (NSException *exception) {
        return nil;
    }


}
// 此方法随机产生8位字符串 随机产生的位数。

+(NSString *)ret8bitString

{
    
    char data[8];
    
    for (int x=0;x<8;data[x++] = (char)('A' + (arc4random_uniform(26))));
    NSString *eightStr = [[NSString alloc] initWithBytes:data length:8 encoding:NSUTF8StringEncoding];
    return [NSString stringWithFormat:@"%@",eightStr];
    
}
#pragma mark - 燕航谱查看标记 
//等比例缩放图片
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size{
    
    
    UIImage *newImage = nil;
    
    CGSize imageSize = sourceImage.size;
    
    CGFloat width = imageSize.width;
    
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = size.width;
    
    CGFloat targetHeight = size.height;
    
    CGFloat scaleFactor = 0.0;
    
    CGFloat scaledWidth = targetWidth;
    
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    
    if(CGSizeEqualToSize(imageSize, size) == NO){
        
        
        CGFloat widthFactor = targetWidth / width;
        
        CGFloat heightFactor = targetHeight / height;
        
        
        if(widthFactor > heightFactor){
            
            scaleFactor = widthFactor;
            
            
        }
        
        else{
            
            
            scaleFactor = heightFactor;
            
        }
        
        scaledWidth = width * scaleFactor;
        
        scaledHeight = height * scaleFactor;
        
        
        if(widthFactor > heightFactor){
            
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
            
        }else if(widthFactor < heightFactor){
            
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            
        }
        
    }
    
    
//    UIGraphicsBeginImageContext(size);
    UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(scaledWidth, scaledHeight), NO,1.0);
    CGRect thumbnailRect = CGRectZero;
    
    thumbnailRect.origin = thumbnailPoint;
    
    thumbnailRect.size.width = scaledWidth;
    
    thumbnailRect.size.height = scaledHeight;
    
    
    [sourceImage drawInRect:thumbnailRect];
    
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        
       // NSLog(@"scale image fail");
        
    }
    
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}
+(void)showMBPrograssHUD:(UIView *)view ShowStr:(NSString *)str MB:(MBProgressHUD *)HUD{
HUD = [[MBProgressHUD alloc] initWithView:view];
[view addSubview:HUD];
HUD.mode = MBProgressHUDModeCustomView;
HUD.color = [UIColor whiteColor];
CGSize size = [[NSString stringWithFormat:@"%@",str]boundingRectWithSize:CGSizeMake(SCREEN_WIDTH * 3 / 5, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
UILabel *Label = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH * 3 / 5, size.height)];
Label.numberOfLines = 0;
Label.textAlignment = NSTextAlignmentCenter;
Label.text = str;
Label.textColor = [UIColor blackColor];
Label.font = [UIFont systemFontOfSize:15];
Label.backgroundColor = [UIColor whiteColor];
UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 5 - 20, SCREEN_HEIGHT / 4, SCREEN_WIDTH * 3 / 5 + 40, size.height + 20)];
bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.borderColor = RGB(230, 230, 230).CGColor;
bgView.layer.borderWidth = 1;
bgView.layer.cornerRadius = 8;
bgView.clipsToBounds = YES;
[bgView addSubview:Label];
HUD.color = [UIColor clearColor];
HUD.backgroundColor= [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:0.40];
[HUD addSubview:bgView];
[HUD show:YES];
[HUD hide:YES afterDelay:2.0];
}
+(void)showMBPrograssHUD:(UIView *)view ShowStr:(NSString *)str MB:(MBProgressHUD *)HUD IN:(NSTextAlignment )Alignment{
    HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:HUD];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.color = [UIColor whiteColor];
    CGSize size = [[NSString stringWithFormat:@"%@",str]boundingRectWithSize:CGSizeMake(SCREEN_WIDTH * 3 / 5, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    UILabel *Label = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH * 3 / 5, size.height)];
    Label.numberOfLines = 0;
    Label.textAlignment = Alignment;
    Label.text = str;
    Label.textColor = [UIColor blackColor];
    Label.font = [UIFont systemFontOfSize:15];
    Label.backgroundColor = [UIColor whiteColor];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 5 - 20, SCREEN_HEIGHT / 4, SCREEN_WIDTH * 3 / 5 + 40, size.height + 20)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.borderColor = RGB(230, 230, 230).CGColor;
    bgView.layer.borderWidth = 1;
    bgView.layer.cornerRadius = 8;
    bgView.clipsToBounds = YES;
    [bgView addSubview:Label];
    HUD.color = [UIColor clearColor];
    HUD.backgroundColor= [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:0.40];
    [HUD addSubview:bgView];
    [HUD show:YES];
    [HUD hide:YES afterDelay:2.0];
}
@end
