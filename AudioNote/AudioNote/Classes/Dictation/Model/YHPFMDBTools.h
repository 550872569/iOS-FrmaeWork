//
//  YHPFMDBTools.h
//  Demo
//
//  Created by YY on 16/8/22.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YHPFMDBModel;
@interface YHPFMDBTools : NSObject

//增
+(void)insertProduct:(YHPFMDBModel *)model;
//删
+(void)deleteProductWithProID:(int)proID;
//改
+(void)updateProductWithModel:(YHPFMDBModel *)model proID:(int)proID;
//查
+(NSArray *)quertyAllProducts;

@end
