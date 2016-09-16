//
//  PathMacros.h
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//
#pragma mark 文件目录
#ifndef PathMacros_h
#define PathMacros_h

#pragma mark- 文件目录-Temp
#define kPathTemp                   NSTemporaryDirectory()
#pragma mark 文件目录-Document
#define kPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#pragma mark 文件目录-Cache
#define kPathCache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#pragma mark 文件目录-Search
#define kPathSearch                 [kPathDocument stringByAppendingPathComponent:@"Search.plist"]
#pragma mark 文件目录-Magazine
#define kPathMagazine               [kPathDocument stringByAppendingPathComponent:@"Magazine"]
#pragma mark 文件目录-DownloadedMgzs
#define kPathDownloadedMgzs         [kPathMagazine stringByAppendingPathComponent:@"DownloadedMgz.plist"]
#pragma mark 文件目录-DownloadURLs
#define kPathDownloadURLs           [kPathMagazine stringByAppendingPathComponent:@"DownloadURLs.plist"]
#pragma mark 文件目录-Operation
#define kPathOperation              [kPathMagazine stringByAppendingPathComponent:@"Operation.plist"]
#pragma mark 文件目录-SplashScreen
#define kPathSplashScreen [kPathCache stringByAppendingPathComponent:@"splashScreen"]
#pragma mark 文件目录-AccountFilepath-账户
#define kPathAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]
#pragma mark 文件目录-GuideAccountFile-引导页
#define kPathGuideAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"guideAccount.data"]


#endif /* PathMacros_h */
