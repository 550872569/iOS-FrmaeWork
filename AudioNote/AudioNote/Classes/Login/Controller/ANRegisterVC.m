//
//  ANRegisterVC.m
//  AudioNote
//
//  Created by sogou on 16/9/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANRegisterVC.h"

@interface ANRegisterVC ()
@property (nonatomic, strong) UITextField *textFieldAccount;
@property (nonatomic, strong) UITextField *textFieldPassword;
@end

@implementation ANRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}
- (void)configUI {
    UIImageView *imageViewBg = [[UIImageView alloc]init];
    imageViewBg.backgroundColor = RGB(99, 113, 132);
    imageViewBg.image = UIImageNamed(@"");
    [self.view addSubview:imageViewBg];
    [imageViewBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    UILabel *labelTop = [[UILabel alloc]init];
    labelTop.text = @"注册";
    labelTop.textColor = COLOR_WHITE;
    labelTop.textAlignment = NSTextAlignmentCenter;
    labelTop.font = kSystemFont(30);
    labelTop.numberOfLines = 1;
    [self.view addSubview:labelTop];
    [labelTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(20+64);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    UIImageView *imageViewLine = [[UIImageView alloc]init];
    imageViewLine.backgroundColor = RGB(92, 98, 117);
    [self.view addSubview:imageViewLine];
    [imageViewLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelTop.mas_bottom).with.offset(20);
        make.centerX.equalTo(labelTop);
        make.width.equalTo(@(SCREEN_WIDTH-2*100));
        make.height.equalTo(@(2));
    }];
    
    
    UILabel *labelTitle = [[UILabel alloc]init];
    labelTitle.text = @"使用搜狗输入法个人词库，让语音转写更准确";
    labelTitle.textColor = RGB(185, 185, 191);
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.font = kSystemFont(15);
    labelTitle.numberOfLines = 1;
    [self.view addSubview:labelTitle];
    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewLine.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    UIImageView *imageViewAccountBg = [[UIImageView alloc]init];
    imageViewAccountBg.backgroundColor = RGB(66, 69, 76);
    imageViewAccountBg.image = UIImageNamed(@"");
    imageViewAccountBg.layer.borderWidth = 2;
    imageViewAccountBg.layer.cornerRadius = 5;
    imageViewAccountBg.layer.borderColor = RGB(78, 81, 90).CGColor;
    [self.view addSubview:imageViewAccountBg];
    [imageViewAccountBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelTitle.mas_bottom).with.offset(30);
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.right.equalTo(self.view.mas_right).with.offset(-20);
        make.height.equalTo(@100);
    }];
    
    UILabel *labelAccount = [[UILabel alloc]init];
    labelAccount.text = @"账号: ";
    labelAccount.textColor = COLOR_WHITE;
    labelAccount.textAlignment = NSTextAlignmentLeft;
    labelAccount.font = kSystemFont(26);
    labelAccount.numberOfLines = 1;
    [self.view addSubview:labelAccount];
    [labelAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewAccountBg.mas_top).with.offset(10);
        make.left.equalTo(imageViewAccountBg.mas_left).with.offset(10);
        make.width.equalTo(@60);
    }];

    _textFieldAccount = [[UITextField alloc]init];
    _textFieldAccount.placeholder = @"请输入邮箱或者手机号码";
    _textFieldAccount.font = kSystemFont(20);
    [self.view addSubview:_textFieldAccount];
    [_textFieldAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(labelAccount);
        make.left.equalTo(labelAccount.mas_right).with.offset(10);
        make.right.equalTo(imageViewAccountBg.mas_right).with.offset(-10);
        make.height.equalTo(@44);
    }];
    
    UIImageView *imageViewLinecenter = [[UIImageView alloc]init];
    imageViewLinecenter.backgroundColor = RGB(92, 98, 117);
    [self.view addSubview:imageViewLinecenter];
    [imageViewLinecenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageViewAccountBg.mas_left).with.offset(10);
        make.right.equalTo(imageViewAccountBg.mas_right).with.offset(-10);
        make.centerY.equalTo(imageViewAccountBg);
        make.height.equalTo(@(2));
    }];
    
    UILabel *labelPassword = [[UILabel alloc]init];
    labelPassword.text = @"密码: ";
    labelPassword.textColor = COLOR_WHITE;
    labelPassword.textAlignment = NSTextAlignmentLeft;
    labelPassword.font = kSystemFont(26);
    labelPassword.numberOfLines = 1;
    [self.view addSubview:labelPassword];
    [labelPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(imageViewAccountBg.mas_bottom).with.offset(-10);
        make.left.equalTo(imageViewAccountBg.mas_left).with.offset(10);
        make.width.equalTo(@60);
    }];

    _textFieldPassword = [[UITextField alloc]init];
    _textFieldPassword.placeholder = @"不少于6位";
    _textFieldPassword.font = kSystemFont(20);
    [self.view addSubview:_textFieldPassword];
    [_textFieldPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelPassword.mas_right).with.offset(10);
        make.right.equalTo(imageViewAccountBg.mas_right).with.offset(-10);
        make.centerY.equalTo(labelPassword);
        make.height.equalTo(@44);
    }];
    
    UIButton *buttonRegister = [[UIButton alloc]init];
    buttonRegister.layer.cornerRadius = 3;
    buttonRegister.layer.masksToBounds = YES;
    buttonRegister.backgroundColor = RGB(49, 199, 218);
    [buttonRegister setTitle:@"注册" forState:UIControlStateNormal];
    buttonRegister.font = kSystemFont(20);
    [buttonRegister setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
    [self.view addSubview:buttonRegister];
    [buttonRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewAccountBg.mas_bottom).with.offset(30);
        make.width.equalTo(@(150));
        make.height.equalTo(@(40));
        make.centerX.equalTo(self.view);
    }];
    
    [buttonRegister addTarget:self action:@selector(buttonRegisterAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonRegisterAction:(id)sender {
    NSLog(@"buttonRegisterAction");
    [_textFieldAccount resignFirstResponder];
    [_textFieldPassword resignFirstResponder];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    keyWindow.rootViewController = [ANBaseTabBarVC new];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"self%@",self);
    [_textFieldAccount resignFirstResponder];
    [_textFieldPassword resignFirstResponder];
}
@end
