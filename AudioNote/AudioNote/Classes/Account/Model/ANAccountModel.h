//
//  ANAccountModel.h
//  AudioNote
//
//  Created by Yan on 16/9/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ANAccountModel : NSObject

/*
 accessoryType = "arrow_right";
 accessoryTypeName = "arrow_right";
 icon = MoreUpdate;
 targetVC = ANAboutTableViewController;
 title = "\U81ea\U52a8\U540c\U6b65";
 */

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *accessoryType;
@property (nonatomic, copy) NSString *targetVC;
@property (nonatomic, copy) NSString *accessoryTypeName;

//类方法根据字典转模型
+ (instancetype)accountWithDict:(NSDictionary *)dict;
//提供一个对象方法,字典转模型
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
