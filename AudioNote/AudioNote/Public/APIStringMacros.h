//
//  APIStringMacros.h
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//
#pragma mark 接口名称相关

#ifndef APIStringMacros_h
#define APIStringMacros_h

#ifdef DEBUG
#pragma mark Debug-API(测试API-基地址)
#define API_BASE_URL  @"http://test-api.ok-keji.com"
#else
#pragma mark Release-API(线上API-基地址)
#define API_BASE_URL  @"https://api.ok-keji.com"
#endif

#endif /* APIStringMacros_h */
