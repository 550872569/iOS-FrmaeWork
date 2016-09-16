//
//  SGAccountVC.m
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANAccountVC.h"
#define kANAccountVCHeight 60.0f

@interface ANAccountVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *buttonLogout;
@property (nonatomic, assign) NSInteger login;

@end

@implementation ANAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _login = 0;
    self.view.backgroundColor = RGB(49, 50, 53);
    [self configUILogin];
}

- (void)configUILogin {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, (kANAccountVCHeight*5)) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = RGB(49, 50, 53);
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [self.view addSubview:self.buttonLogout];
    [self.buttonLogout mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom).with.offset(50);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(150));
        make.height.equalTo(@(60));
    }];
    [self.buttonLogout addTarget:self action:@selector(buttonLogoutAction:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark -tableviewdelegate&datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ANAccountTableViewCell *cell = [ANAccountTableViewCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kANAccountVCHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
    if (indexPath.row == 0) {
        return;
    } else if (indexPath.row == 1) {
        NSLog(@"自动同步");
    } else if (indexPath.row == 2) {
        NSLog(@"问题反馈");
    } else if (indexPath.row == 3) {
        NSLog(@"关于");
    } else {
        return;
    }
}
#pragma mark -lazy
- (UIButton *)buttonLogout {
    if (!_buttonLogout) {
        _buttonLogout =[[UIButton alloc]init];
        [_buttonLogout setTitle:@"退出登录" forState:UIControlStateNormal];
        [_buttonLogout setTitleColor:RGB(52, 199, 198) forState:UIControlStateNormal];
        _buttonLogout.font = kSystemFont(30);
        [_buttonLogout setBackgroundColor:RGB(67, 73, 77)];
    }
    return _buttonLogout;
}

- (void)buttonLogoutAction:(id)sender {
    NSLog(@"buttonLogoutAction");
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    keyWindow.rootViewController = [ANLoginVC new];
}
@end;
