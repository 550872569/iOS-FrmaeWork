//
//  NSDate+XYDateEx.m
//  XMPPTestZGXCW
//
//  Created by 123 on 16/8/15.
//  Copyright © 2016年 ZGXCW. All rights reserved.
//

#import "NSDate+XYDateEx.h"

@implementation NSDate (XYDateEx)

+ (NSString *)getSystemCurrentTimestamp{
    
    return [NSString stringWithFormat:@"%d",(int)[[NSDate date] timeIntervalSince1970]];
}

@end
