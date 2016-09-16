//
//  YHPFMDBCell.h
//  Demo
//
//  Created by YY on 16/8/22.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPFMDBCell : UITableViewCell

@property (nonatomic, strong) YHPFMDBModel *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
