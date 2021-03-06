//
//  NSDate+Extension.h
//  AudioNote
//
//  Created by Yan on 14/9/1.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  当前的date与tagetDate进行对比，判断targetDate是否是昨天
 *
 *  @param targetDate
 *
 *  @return
 */
- (BOOL)isYesterdayWithTargetDate:(NSDate *)targetDate;


/**
 *  是否是今年：通过现在的时间的与传入的时间的年份进行对比。
 *
 *  @param targetDate 目标时间
 *
 *  @return <#return value description#>
 */
- (BOOL)isThisYearWithTargetDate:(NSDate *)targetDate;

/**
 *  根据target Date判断 是否是今天
 *
 *  @param targetDate <#targetDate description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)isTodayWithTargetDate:(NSDate *)targetDate;


@end
