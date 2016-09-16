//
//  ANAccountTableViewCell.m
//  AudioNote
//
//  Created by sogou on 16/9/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANAccountTableViewCell.h"

@implementation ANAccountTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ANAccountTableViewCellID = @"ANAccountTableViewCellID";
    ANAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ANAccountTableViewCellID];
    if (cell == nil) {
        cell = [[ANAccountTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ANAccountTableViewCellID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = RGB(49, 50, 53);
        UILabel *label = [UILabel new];
        label.text = @"当前账户";
        label.font = kSystemFont(20);
        label.numberOfLines = 1;
        label.textColor = COLOR_WHITE;
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(50);
            make.centerY.equalTo(self.contentView);
        }];
        
        UILabel *labelAccount = [UILabel new];
        labelAccount.text = @"SGAudioNote@gmail.com";
        labelAccount.font = kSystemFont(20);
        labelAccount.numberOfLines = 1;
        labelAccount.textColor = COLOR_WHITE;
        labelAccount.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:labelAccount];
        [labelAccount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-50);
            make.centerY.equalTo(self.contentView);
        }];
        
    }
    return self;
}

@end
