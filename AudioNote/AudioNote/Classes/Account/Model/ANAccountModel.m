//
//  ANAccountModel.m
//  AudioNote
//
//  Created by Yan on 16/9/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANAccountModel.h"

@implementation ANAccountModel


//实现字典转模型
-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)accountWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}
@end
