//
//  ANListTableViewCell.h
//  AudioNote
//
//  Created by Yan on 16/9/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ANListModel;
@interface ANListTableViewCell : UITableViewCell

@property (nonatomic, strong) ANListModel *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
