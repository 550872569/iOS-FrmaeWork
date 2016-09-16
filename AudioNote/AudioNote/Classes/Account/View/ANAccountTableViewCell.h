//
//  ANAccountTableViewCell.h
//  AudioNote
//
//  Created by sogou on 16/9/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ANAccountModel;
@interface ANAccountTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) ANAccountModel *model;
@property (nonatomic, copy) NSString *index;
@end
