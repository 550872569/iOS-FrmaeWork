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
@property (nonatomic, strong) NSArray *arrayAccount;
@property (nonatomic, strong) ANAccountTableViewCell *cell;

@end

@implementation ANAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.plistName = @"accountPlist";
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
    return self.arrayAccount.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ANAccountModel *model = self.arrayAccount[indexPath.row];
    ANAccountTableViewCell *cell = [ANAccountTableViewCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = model;
    NSLog(@"index-@ld",indexPath.row);
    cell.index = [NSString stringWithFormat:@"ld",indexPath.row];
    _cell = cell;
    return _cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kANAccountVCHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
    if (indexPath.row == 0) {
        NSLog(@"自动同步");
    } else if (indexPath.row == 1) {
        ANAccountFeedbackVC *vcFeedBack = [ANAccountFeedbackVC new];
        [self.navigationController pushViewController:vcFeedBack animated:YES];
        NSLog(@"问题反馈");
    } else if (indexPath.row == 2) {
        NSLog(@"关于");
        ANAccountAboutUsVC *vcAboutUs = [ANAccountAboutUsVC new];
        [self.navigationController pushViewController:vcAboutUs animated:YES];
    } else {
        return;
    }
}
#pragma mark -lazy
#pragma mark 退出登录
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
#pragma mark 数据源集合
- (NSArray *)arrayAccount {
    if (_arrayAccount == nil) {
        //读取plist数据
        NSArray *dictArr = [[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@.plist",_plistName] ofType:nil]] lastObject][@"items"];
        //创建可变数据
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        for (NSDictionary *dict in dictArr) {
            ANAccountModel *model = [ANAccountModel accountWithDict:dict];
            [arrM addObject:model];
        }
        _arrayAccount = arrM;
    }
    return _arrayAccount;
}

-(void)setPlistName:(NSString *)plistName {
    //获取plist 数据
    _plistName = plistName;
}

- (void)buttonLogoutAction:(id)sender {
    NSLog(@"buttonLogoutAction");
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    keyWindow.rootViewController = [ANLoginVC new];
}
@end;
