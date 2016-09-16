//
//  NotificationMacros.h
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//
#pragma mark 系统Notification宏定义
#ifndef NotificationMacros_h
#define NotificationMacros_h

#pragma mark- 取消收藏时
#define TNCancelFavoriteProductNotification     @"TNCancelFavoriteProductNotification"
#pragma mark 标记收藏时
#define TNMarkFavoriteProductNotification       @"TNMarkFavoriteProductNotification"
#pragma mark 下载进度变化
#define kNotficationDownloadProgressChanged     @"kNotficationDownloadProgressChanged"
#pragma mark 暂停下载
#define kNotificationPauseDownload              @"kNotificationPauseDownload"
#pragma mark 开始下载
#define kNotificationStartDownload              @"kNotificationStartDownload"
#pragma mark 下载成功
#define kNotificationDownloadSuccess            @"kNotificationDownloadSuccess"
#pragma mark 下载失败
#define kNotificationDownloadFailed             @"kNotificationDownloadFailed"

#endif /* NotificationMacros_h */
