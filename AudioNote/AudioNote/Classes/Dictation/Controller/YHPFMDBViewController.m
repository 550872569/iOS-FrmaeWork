//
//  YHPFMDBViewController.m
//  Demo
//
//  Created by YY on 16/8/22.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPFMDBViewController.h"

@interface YHPFMDBViewController ()<UITableViewDelegate,UITableViewDataSource> {
    UIButton *_buttonInsert;//增
    UIButton *_buttonDelete;//删
    UIButton *_buttonUpdate;//改
    UIButton *_buttonCheck;//查
    UITableView *_tableview;//tableview
    NSMutableArray *_mArrayData;//数据源数组
}

@end

@implementation YHPFMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_WHITE;
    [self configUI];
}

- (void)configUI {
    
    CGRect rectInsert = CGRectMake(10, 64, 100, 50);
    CGRect rectDelete = CGRectMake(110, 64, 100, 50);
    CGRect rectUpdate = CGRectMake(210, 64, 100, 50);
    CGRect rectCheck = CGRectMake(310, 64, 100, 50);
    CGRect rectTableView = CGRectMake(0, 64+50, SCREEN_WIDTH, SCREEN_HEIGHT-50);

    _buttonInsert = [UIButton buttonWithTitle:@"Insert" titleFont:17 titleColor:COLOR_BLACK image:nil backgroundImage:nil backgroundColor:COLOR_RED ract:rectInsert];
    _buttonDelete = [UIButton buttonWithTitle:@"Delete" titleFont:17 titleColor:COLOR_BLACK image:nil backgroundImage:nil backgroundColor:COLOR_YELLOW ract:rectDelete];
    _buttonUpdate = [UIButton buttonWithTitle:@"Update" titleFont:17 titleColor:COLOR_BLACK image:nil backgroundImage:nil backgroundColor:COLOR_BLUE ract:rectUpdate];
    _buttonCheck = [UIButton buttonWithTitle:@"Check" titleFont:17 titleColor:COLOR_BLACK image:nil backgroundImage:nil backgroundColor:COLOR_PURPLE ract:rectCheck];
    _tableview = [[UITableView alloc]initWithFrame:rectTableView style:UITableViewStylePlain];
    _tableview.backgroundColor = COLOR_WHITE;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_buttonInsert];
    [self.view addSubview:_buttonDelete];
    [self.view addSubview:_buttonUpdate];
    [self.view addSubview:_buttonCheck];
    [self.view addSubview:_tableview];

    [self addTarget];
}
- (void)addTarget {
    [_buttonInsert addTarget:self action:@selector(buttonInsertClick:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonDelete addTarget:self action:@selector(buttonDeleteClick:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonUpdate addTarget:self action:@selector(buttonUpdateClick:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonCheck addTarget:self action:@selector(buttonCheckClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}
#pragma mark buttonClick(增删改查)
- (void)buttonInsertClick:(id)sender {
    NSLog(@"buttonInsertClick");
    YHPFMDBModel *model = [YHPFMDBModel new];
    model.proName = [NSString stringWithFormat:@"iPhone %d",arc4random_uniform(10)];
    model.proPrice = arc4random_uniform(500) + 100;
    [YHPFMDBTools insertProduct:model];
}
- (void)buttonDeleteClick:(id)sender {
    NSLog(@"buttonDeleteClick");
    [YHPFMDBTools deleteProductWithProID:arc4random_uniform(50)];
}
- (void)buttonUpdateClick:(id)sender {
    NSLog(@"buttonUpdateClick");
    YHPFMDBModel *model = [YHPFMDBModel new];
    model.proName = [NSString stringWithFormat:@"iPhone %d",arc4random_uniform(10)];
    model.proPrice = arc4random_uniform(500) + 100;
    [YHPFMDBTools updateProductWithModel:model proID:3];
}
- (void)buttonCheckClick:(id)sender {
    NSLog(@"buttonCheckClick");
    _mArrayData = [[YHPFMDBTools quertyAllProducts] copy];
    [_tableview reloadData];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_mArrayData.count) {
        return _mArrayData.count;
    } else {
        return 20;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YHPFMDBModel *model = _mArrayData[indexPath.row];
    YHPFMDBCell *cell = [YHPFMDBCell cellWithTableView:tableView];
    cell.model = model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath%ld",indexPath.row);
}
@end
