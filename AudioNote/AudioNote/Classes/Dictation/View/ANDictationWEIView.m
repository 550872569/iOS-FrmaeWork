//
//  ANDictationWEIView.m
//  AudioNote
//
//  Created by Yan on 16/9/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANDictationWEIView.h"

#define kImageViewTopOffset 10
#define kImageViewLeftOffset 10
#define kImageViewBottomOffset 10
#define kImageViewWidth 80


@implementation ANDictationWEIView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(78, 87, 105);
        self.layer.borderWidth = 2;
        self.layer.borderColor = RGB(62, 137, 140).CGColor;
        self.layer.cornerRadius = 3;
    }
    return self;
}

- (instancetype)initWithImage:(NSString *)imageName title:(NSString *)title subTitle:(NSString *)subTitle {
    
    CGRect rectImageView = CGRectMake(10, 10, 110, 110);
    CGRect rectLabelTitle = CGRectMake(130, 10, 100, 50);
    CGRect rectLabelSubTitle = CGRectMake(130, 60, 150, 50);
    
    UIImageView *imageView = [[UIImageView alloc]init];
    UIImage *image = [UIImage imageNamed:imageName];
    [imageView setImage:image];

    UILabel *labelTitle = [[UILabel alloc]init];
    labelTitle.text = title;
    labelTitle.textColor = COLOR_WHITE;
    labelTitle.textAlignment = NSTextAlignmentLeft;
    labelTitle.font = kFONT_WEI_TITLE;

    UILabel *labelSubtile = [[UILabel alloc]init];
    labelSubtile.text = subTitle;
    labelSubtile.textColor = COLOR_GRAY;
    labelSubtile.textAlignment = NSTextAlignmentLeft;
    labelSubtile.font = kFONT_WEI_SUBTITLE;
   
    [self addSubview:imageView];
    [self addSubview:labelTitle];
    [self addSubview:labelSubtile];
    [imageView setFrame:rectImageView];
    [labelTitle setFrame:rectLabelTitle];
    [labelSubtile setFrame:rectLabelSubTitle];
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.mas_left).with.offset(10);
//        make.top.equalTo(self.mas_top).with.offset(10);
//        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
//        make.width.equalTo(@(80));
//    }];
//    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(imageView.mas_top);
//        make.left.equalTo(imageView.mas_right).width.offset(10);
//        make.right.equalTo(self.mas_right).with.offset(-10);
//    }];
//    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(imageView.mas_right).width.offset(10);
//        make.right.equalTo(self.mas_right).with.offset(-10);
//        make.bottom.equalTo(imageView.mas_bottom).with.offset(-10);
//    }];
    
    return self;
}
@end
