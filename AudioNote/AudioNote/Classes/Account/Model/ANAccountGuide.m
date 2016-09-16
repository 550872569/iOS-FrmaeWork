//
//  ANGuideAccount.m
//  AudioNote
//
//  Created by Yan on 16/9/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANAccountGuide.h"

@implementation ANAccountGuide

/**
 *  当从文件中解析出一个对象的时候调用
 *  在这个方法中写清楚：怎么解析文件中的数据
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.guideAccount = [decoder decodeObjectForKey:@"guideAccount"];
    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 *  在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.guideAccount forKey:@"guideAccount"];
}

@end
