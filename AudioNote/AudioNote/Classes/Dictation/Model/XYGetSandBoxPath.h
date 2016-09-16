//
//  XYGetSandBoxPath.h
//  AudioNote
//
//  Created by sogou on 16/9/13.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 获取沙盒路径
 */

@interface XYGetSandBoxPath : NSObject

// 获取沙盒Document的文件目录
+ (NSString *)an_getDocumentDirectory;
// 获取沙盒Library的文件目录
+ (NSString *)an_getLibraryDirectory;
// 获取沙盒Library/Caches的文件目录
+ (NSString *)an_getCachesDirectory;
// 获取沙盒Preference的文件目录
+ (NSString *)an_getPreferencePanesDirectory;
// 获取沙盒tmp的文件目录
+ (NSString *)an_getTmpDirectory;
// 删除文件
+ (BOOL)an_removeDocumentWithFilePath:(NSString *)filePath;
@end
