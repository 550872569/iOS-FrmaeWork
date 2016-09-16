//
//  ANAccount.h
//  AudioNote
//
//  Created by Yan on 16/9/15.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ANAccount : NSObject

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, strong) NSDate *expiresTime; // 账号的过期时间
// 如果服务器返回的数字很大, 建议用long long(比如主键, ID)
@property (nonatomic, assign) long long expires_in;
@property (nonatomic, assign) long long remind_in;
@property (nonatomic, assign) long long uid;

+ (instancetype)accountWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
