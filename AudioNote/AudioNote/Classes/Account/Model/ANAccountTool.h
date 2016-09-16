//
//  ANAccountTool.h
//  AudioNote
//
//  Created by Yan on 16/9/15.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ANAccount;
@class ANAccountGuide;
@interface ANAccountTool : NSObject

/**
 *  存储账号信息
 *
 *  @param account 需要存储的账号
 */
+ (void)saveAccount:(ANAccount *)account;

/**
 *  返回存储的账号信息
 */
+ (ANAccount *)account;

+ (void)saveGuideAccount:(ANAccountGuide *)account;

+ (ANAccountGuide *)accountGuide;

@end
