//
//  ANListModel.h
//  AudioNote
//
//  Created by Yan on 16/9/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ANListModel : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 子标题 */
@property (nonatomic, copy) NSString *subTitle;
/** 内容 */
@property (nonatomic, copy) NSString *titleContent;
/** 时间 */
@property (nonatomic, copy) NSString *titleTime;
/** 地址 */
@property (nonatomic, copy) NSString *address;
/** 内容字数 */
@property (nonatomic, copy) NSString *titleContentNumber;
/** 状态 */
@property (nonatomic, copy) NSString *status;

@end
