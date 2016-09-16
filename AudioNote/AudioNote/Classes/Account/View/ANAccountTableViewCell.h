//
//  ANAccountTableViewCell.h
//  AudioNote
//
//  Created by sogou on 16/9/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANAccountTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


@end
