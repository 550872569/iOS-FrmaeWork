//
//  YHPFMDBModel.h
//  Demo
//
//  Created by YY on 16/8/22.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHPFMDBModel : NSObject

@property(nonatomic,assign) int proID;             // ID
@property(nonatomic,copy) NSString *proName;       //名称
@property(nonatomic, assign) int proPrice;         //价格
@property(nonatomic, copy) NSString *summaryText;      //摘要
@property(nonatomic, copy) NSString *fileName;         //文件名
@property(nonatomic, copy) NSString *translationText;  //翻译
@property(nonatomic, copy) NSString *audioFile;    //录音文件

@end
