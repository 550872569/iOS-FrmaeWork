//
//  ANAccountTableViewCell.m
//  AudioNote
//
//  Created by sogou on 16/9/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANAccountTableViewCell.h"

@interface  ANAccountTableViewCell()
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelSubTitle;
@property (nonatomic, strong) UIImageView *imageViewRight;
@end
@implementation ANAccountTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ANAccountTableViewCellID = @"ANAccountTableViewCellID";
    ANAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ANAccountTableViewCellID];
    if (cell == nil) {
        cell = [[ANAccountTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ANAccountTableViewCellID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
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
        _labelTitle = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.centerY.equalTo(self.contentView);
        }];
        
        UILabel *labelAccount = [UILabel new];
//        labelAccount.text = @"SGAudioNote@gmail.com";
        labelAccount.font = kSystemFont(20);
        labelAccount.numberOfLines = 1;
        labelAccount.textColor = COLOR_WHITE;
        labelAccount.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:labelAccount];
        _labelSubTitle = labelAccount;
        [labelAccount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label.mas_right).with.offset(10);
            make.centerY.equalTo(self.contentView);
        }];
        
        UIImageView *imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:imageView];
        _imageViewRight = imageView;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}

-(void)setModel:(ANAccountModel *)model {
    _model = model;
    //根据accessoryType 创建对象
    //创建指定对象  通过字符串创建一个类
    Class accessoryClass = NSClassFromString(model.accessoryTypeName);
    //通过类创建一个对象
    id accessoryObj = [[accessoryClass alloc]init];
    //如果是一个uiimageview 则设置图片  通过imgV 指针指向 [[accessoryClass alloc]init] 对象
    //     对象                          哪个类
    if ([accessoryObj isKindOfClass:[UIImageView class]]) {
        //设置图片
        _imageViewRight.image = [UIImage imageNamed:model.accessoryTypeName];
        //没有尺寸 sizeToFit 根据图片大小填充图片框大小
        [_imageViewRight sizeToFit];
    }
    _labelTitle.text = [NSString stringWithFormat:@"%@",model.title];
    [_imageViewRight setImage:[UIImage imageNamed:model.accessoryTypeName]];
    if ([self.index isEqualToString:@"0"]) {
        self.labelSubTitle.hidden = YES;
    } else {
        self.labelSubTitle.hidden = NO;
    }
    NSLog(@"index%@",self.index);
    _labelSubTitle.text = model.subTitle;
}
-(void)setIndex:(NSString *)index {
    _index = index;
}

@end
