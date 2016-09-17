//
//  ANListTableViewCell.m
//  AudioNote
//
//  Created by Yan on 16/9/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANListTableViewCell.h"

@interface ANListTableViewCell () {
    UILabel *_labelTitle;
    UILabel *_labelSubTitle;
    UILabel *_labelTitleContent;
    UILabel *_labelTitleTime;
    UILabel *_labelTitleAddress;
    UILabel *_labelTitleContentNumber;
    UILabel *_labelTitleStatus;
    UIButton *_buttonStatus;
}

@end
@implementation ANListTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ANListTableViewCellID = @"ANListTableViewCell";
    ANListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ANListTableViewCellID];
    if (cell == nil) {
        cell = [[ANListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ANListTableViewCellID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = COLOR_WHITE;
        //昵称
        CGRect rect = CGRectMake(0, 0, 0, 0);
        _labelTitle = [UILabel labelWithTitle:@"labelProName" titleFont:17 backgroundColor:COLOR_YELLOW textAlignment:NSTextAlignmentCenter ract:rect numberOfLines:1];
        [self.contentView addSubview:_labelTitle];
        [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.centerY.equalTo(self.contentView);
        }];
        _labelTitleTime = [UILabel labelWithTitle:@"labelProPrice" titleFont:15 backgroundColor:COLOR_GRAY textAlignment:NSTextAlignmentCenter ract:rect numberOfLines:1];
        [self.contentView addSubview:_labelTitleTime];
        [_labelTitleTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setModel:(ANListModel *)model {
    _model = model;
}

@end
