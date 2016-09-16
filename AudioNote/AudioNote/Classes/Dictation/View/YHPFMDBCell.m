//
//  YHPFMDBCell.m
//  Demo
//
//  Created by YY on 16/8/22.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPFMDBCell.h"

@interface  YHPFMDBCell() {
    
    UILabel *_labelProID;
    UILabel *_labelProName;
    UILabel *_labelProPrice;
    
}

@end


@implementation YHPFMDBCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *YHPFMDBCellID = @"YHPFMDBCell";
    YHPFMDBCell *cell = [tableView dequeueReusableCellWithIdentifier:YHPFMDBCellID];
    if (cell == nil) {
        cell = [[YHPFMDBCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YHPFMDBCellID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = COLOR_WHITE;
        //昵称
        CGRect rect = CGRectMake(0, 0, 0, 0);
        _labelProName = [UILabel labelWithTitle:@"labelProName" titleFont:17 backgroundColor:COLOR_YELLOW textAlignment:NSTextAlignmentCenter ract:rect numberOfLines:1];
        [self.contentView addSubview:_labelProName];
        [_labelProName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.centerY.equalTo(self.contentView);
        }];
        _labelProPrice = [UILabel labelWithTitle:@"labelProPrice" titleFont:15 backgroundColor:COLOR_GRAY textAlignment:NSTextAlignmentCenter ract:rect numberOfLines:1];
        [self.contentView addSubview:_labelProPrice];
        [_labelProPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}
- (void)setModel:(YHPFMDBModel *)model {
    _model = model;
    if (_model.proName.length) {
        _labelProName.text = [NSString stringWithFormat:@"%@",_model.proName];
    } else {
        NSLog(@"proName为空");
    }
    if (_model.proPrice) {
        _labelProPrice.text = [NSString stringWithFormat:@"%d",_model.proPrice];
    } else {
        NSLog(@"proPrice为空");
    }
}
@end
