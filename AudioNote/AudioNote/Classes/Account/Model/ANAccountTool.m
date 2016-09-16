//
//  ANAccountTool.m
//  AudioNote
//
//  Created by Yan on 16/9/15.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANAccountTool.h"

@implementation ANAccountTool


+ (void)saveAccount:(ANAccount *)account
{
    NSDate *now = [NSDate date];
    account.expiresTime = [now dateByAddingTimeInterval:account.expires_in];
    [NSKeyedArchiver archiveRootObject:account toFile:kPathAccountFile];
}

+ (ANAccount *)account
{
    // 取出账号
    ANAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:kPathAccountFile];
    // 判断账号是否过期
    NSDate *now = [NSDate date];
    if ([now compare:account.expiresTime] == NSOrderedAscending) { // 还没有过期
        return account;
    } else { // 过期
        return nil;
    }
}

+ (void)saveGuideAccount:(ANAccountGuide *)account
{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:kPathGuideAccountFile];
    
}

+ (ANAccountGuide *)accountGuide
{
    // 读取帐号
    ANAccountGuide *account = [NSKeyedUnarchiver unarchiveObjectWithFile:kPathGuideAccountFile];
    
    return account;
}

/*
//存储帐号
+ (void)save:(VGAccount *)account{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:VGAccountFilepath];
}

//读取帐号
+ (VGAccount *)account{
    // 读取帐号
    VGAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:VGAccountFilepath];
    
    return account;
}

+ (void)saveGuideAccount:(VGGuideAccount *)account
{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:VGGuideAccountFilepath];
    
}

+ (VGGuideAccount *)guideAccount
{
    // 读取帐号
    VGGuideAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:VGGuideAccountFilepath];
    
    return account;
}
*/

@end
