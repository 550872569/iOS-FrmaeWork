//
//  ANThirdLoginView.h
//  AudioNote
//
//  Created by Yan on 16/9/15.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ANThirdLoginViewDelegate <NSObject>
@optional

//Wacht登录
- (void)loginWacht;

//QQ登录
- (void)loginQQ;

//Sina登录
- (void)loginSina;

@end

@interface ANThirdLoginView : UIView

@property (nonatomic, weak) id <ANThirdLoginViewDelegate> delegate;

@end
