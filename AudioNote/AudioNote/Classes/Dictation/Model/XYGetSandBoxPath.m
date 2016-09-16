//
//  XYGetSandBoxPath.m
//  AudioNote
//
//  Created by sogou on 16/9/13.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "XYGetSandBoxPath.h"

@implementation XYGetSandBoxPath

#pragma mark - 获取沙盒Document的文件目录
+ (NSString *)an_getDocumentDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}
#pragma mark - 获取沙盒Library的文件目录
+ (NSString *)an_getLibraryDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}
#pragma mark - 获取沙盒Library/Caches的文件目录
+ (NSString *)an_getCachesDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}
#pragma mark - 获取沙盒Preference的文件目录
+ (NSString *)an_getPreferencePanesDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}
#pragma mark - 获取沙盒tmp的文件目录
+ (NSString *)an_getTmpDirectory{
    return NSTemporaryDirectory();
}

+ (BOOL)an_removeDocumentWithFilePath:(NSString *)filePath{
    BOOL isRemove;
    NSFileManager* fileManager=[NSFileManager defaultManager];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
       isRemove = [fileManager removeItemAtPath:filePath error:nil];
    }
    return isRemove;
}

@end
