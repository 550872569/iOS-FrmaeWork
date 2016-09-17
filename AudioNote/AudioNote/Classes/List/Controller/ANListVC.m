//
//  ANListVC.m
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANListVC.h"

@interface ANListVC ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *_tableView;
    NSArray *_arrayData;
}
@end

@implementation ANListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_GRAY;
    [self configTableView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"self%@",self);
}

- (void)configTableView {
    CGRect rectTableView = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _tableView = [[UITableView alloc]initWithFrame:rectTableView style:UITableViewStylePlain];
    _tableView.backgroundColor = COLOR_WHITE;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    _arrayData = [NSArray array];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_arrayData.count) {
        return _arrayData.count;
    } else {
        return 20;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    ANListModel *model = _arrayData[indexPath.row];
    ANListTableViewCell *cell = [ANListTableViewCell cellWithTableView:tableView];
//    cell.model = model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath%ld",indexPath.row);
}
@end
