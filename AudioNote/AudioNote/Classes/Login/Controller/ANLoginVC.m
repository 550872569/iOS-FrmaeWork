//
//  SGLoginVC.m
//  AudioNote
//
//  Created by Yan on 16/9/11.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ANLoginVC.h"

@interface ANLoginVC ()<ANThirdLoginViewDelegate>
@property (nonatomic, strong) UITextField *textFieldAccount;
@property (nonatomic, strong) UITextField *textFieldPassword;
@end

@implementation ANLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(49, 50, 53);
    [self configUI];
}

- (void)configUI {
    
    [self configUILogin];
    [self configThirdLoginView];
}

- (void)configThirdLoginView {
    
    if (iPhone4s) {
        CGRect rectViewThirdLogin = CGRectMake(0, SCREEN_HEIGHT - 44 -(SCREEN_WIDTH-150)/3, SCREEN_WIDTH, (SCREEN_WIDTH-150)/3);
        ANThirdLoginView *viewThirdLogin = [[ANThirdLoginView alloc]initWithFrame:rectViewThirdLogin];
        viewThirdLogin.delegate = self;
        [self.view addSubview:viewThirdLogin];
    } else {
        CGRect rectViewThirdLogin = CGRectMake(0, SCREEN_HEIGHT - 44 -SCREEN_WIDTH/3, SCREEN_WIDTH, SCREEN_WIDTH/3);
        ANThirdLoginView *viewThirdLogin = [[ANThirdLoginView alloc]initWithFrame:rectViewThirdLogin];
        viewThirdLogin.delegate = self;
        [self.view addSubview:viewThirdLogin];
    }
    
}

#pragma mark -configUI(配置UI)
- (void)configUILogin {
    
    UIImageView *imageViewBg = [[UIImageView alloc]init];
    imageViewBg.backgroundColor = RGB(99, 113, 132);
    imageViewBg.image = UIImageNamed(@"");
    [self.view addSubview:imageViewBg];
    [imageViewBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    UIView *viewLoginBg = [UIView new];
    [self.view addSubview:viewLoginBg];
    viewLoginBg.backgroundColor = RGB(81, 91, 109);
    [viewLoginBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(10+64);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        if (iPhone4s) {
            make.height.equalTo(@(SCREEN_HEIGHT*0.6));//  350/667
        } else {
            make.height.equalTo(@(SCREEN_HEIGHT*0.5247));//  350/667
        }
    }];
    viewLoginBg.layer.cornerRadius = 5;
    viewLoginBg.layer.masksToBounds = YES;
    
    UILabel *labelTop = [[UILabel alloc]init];
    labelTop.text = @"搜狗通行证";
    labelTop.textColor = COLOR_WHITE;
    labelTop.textAlignment = NSTextAlignmentCenter;
    labelTop.font = kSystemFont(25);
    labelTop.numberOfLines = 1;
    [self.view addSubview:labelTop];
    [labelTop mas_makeConstraints:^(MASConstraintMaker *make) {
        if (iPhone4s || iPhone5) {
            make.top.equalTo(viewLoginBg.mas_top).with.offset(10);
        } else {
            make.top.equalTo(viewLoginBg.mas_top).with.offset(20);
        }
        make.centerX.equalTo(viewLoginBg.mas_centerX);
    }];
    UIImageView *imageViewLine = [[UIImageView alloc]init];
    imageViewLine.backgroundColor = RGB(92, 98, 117);
    [self.view addSubview:imageViewLine];
    [imageViewLine mas_makeConstraints:^(MASConstraintMaker *make) {
        if (iPhone4s || iPhone5) {
            make.top.equalTo(labelTop.mas_bottom).with.offset(10);
        } else {
            make.top.equalTo(labelTop.mas_bottom).with.offset(20);
        }
        make.centerX.equalTo(labelTop);
        make.width.equalTo(@(SCREEN_WIDTH-2*100));
        make.height.equalTo(@(2));
    }];
    
    UILabel *labelTitle = [[UILabel alloc]init];
    labelTitle.text = @"可共享搜狗输入法个人词库，让语音转写更准确";
    labelTitle.textColor = RGB(185, 185, 191);
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.font = kSystemFont(15);
    labelTitle.numberOfLines = 1;
    [self.view addSubview:labelTitle];
    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        if (iPhone5 || iPhone4s) {
            make.top.equalTo(imageViewLine.mas_bottom).with.offset(10);
        } else {
            make.top.equalTo(imageViewLine.mas_bottom).with.offset(20);
        }
        make.centerX.equalTo(viewLoginBg.mas_centerX);
        make.left.equalTo(self.view.mas_left).with.offset(25);
        make.right.equalTo(self.view.mas_right).with.offset(-25);
    }];
    
    UIImageView *imageViewAccountBg = [[UIImageView alloc]init];
    imageViewAccountBg.backgroundColor = RGB(66, 69, 76);
    imageViewAccountBg.image = UIImageNamed(@"");
    imageViewAccountBg.layer.borderWidth = 2;
    imageViewAccountBg.layer.cornerRadius = 5;
    imageViewAccountBg.layer.borderColor = RGB(78, 81, 90).CGColor;
    [self.view addSubview:imageViewAccountBg];
    [imageViewAccountBg mas_makeConstraints:^(MASConstraintMaker *make) {
        if (iPhone5 || iPhone4s) {
            make.top.equalTo(labelTitle.mas_bottom).with.offset(15);
        } else {
            make.top.equalTo(labelTitle.mas_bottom).with.offset(30);
        }
        make.left.equalTo(viewLoginBg.mas_left).with.offset(20);
        make.right.equalTo(viewLoginBg.mas_right).with.offset(-20);
        make.height.equalTo(@100);
    }];
    
    UILabel *labelAccount = [[UILabel alloc]init];
    labelAccount.text = @"账号: ";
    labelAccount.textColor = COLOR_WHITE;
    labelAccount.textAlignment = NSTextAlignmentLeft;
    labelAccount.font = kSystemFont(20);
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
    labelPassword.font = kSystemFont(20);
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
        make.left.equalTo(imageViewAccountBg);
        if (iPhone5 || iPhone4s) {
            make.top.equalTo(imageViewAccountBg.mas_bottom).with.offset(15);
        } else {
            make.top.equalTo(imageViewAccountBg.mas_bottom).with.offset(30);
        }
        make.width.equalTo(@(0.4*SCREEN_WIDTH));
        make.height.equalTo(@(0.06*SCREEN_HEIGHT));
    }];
    
    UIButton *buttonLogin = [[UIButton alloc]init];
    buttonLogin.layer.cornerRadius = 3;
    buttonLogin.layer.masksToBounds = YES;
    buttonLogin.backgroundColor = RGB(49, 217, 215);
    [buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    buttonLogin.font = kSystemFont(20);
    [buttonLogin setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
    [self.view addSubview:buttonLogin];
    [buttonLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageViewAccountBg);
        if (iPhone5 || iPhone4s) {
            make.top.equalTo(imageViewAccountBg.mas_bottom).with.offset(15);
        } else {
            make.top.equalTo(imageViewAccountBg.mas_bottom).with.offset(30);
        }
        make.width.equalTo(@(0.4*SCREEN_WIDTH));
        make.height.equalTo(@(0.06*SCREEN_HEIGHT));
    }];
    [buttonRegister addTarget:self action:@selector(buttonRegisterAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonLogin addTarget:self action:@selector(buttonLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *labelForgetPassword = [[UILabel alloc]init];
    labelForgetPassword.text = @"忘记密码？";
    labelForgetPassword.textColor = RGB(174, 188, 205);
    labelForgetPassword.backgroundColor = RGB(81, 91, 109);
    labelForgetPassword.font = kSystemFont(15);
    labelForgetPassword.textAlignment = UITextAlignmentRight;
    [self.view addSubview:labelForgetPassword];
    [labelForgetPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageViewAccountBg);
        make.top.equalTo(buttonLogin.mas_bottom).with.offset(20);
        make.width.equalTo(@(0.3*SCREEN_WIDTH));
        make.height.equalTo(@(20));
    }];
    
    UITapGestureRecognizer *tapGestureForgetPassword = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureForgetPassword:)];
    tapGestureForgetPassword.numberOfTapsRequired = 1;
    tapGestureForgetPassword.numberOfTouchesRequired = 1;
    labelForgetPassword.userInteractionEnabled = YES;
    [labelForgetPassword addGestureRecognizer:tapGestureForgetPassword];
    
    UILabel *labelBottom = [[UILabel alloc]init];
    labelBottom.text = @"其他登录方式";
    labelBottom.textColor = COLOR_WHITE;
    labelBottom.textAlignment = NSTextAlignmentCenter;
    labelBottom.font = kSystemFont(20);
    labelBottom.numberOfLines = 1;
    [self.view addSubview:labelBottom];
    [labelBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        if (iPhone5 || iPhone4s) {
            make.top.equalTo(viewLoginBg.mas_bottom).with.offset(15);
        } else {
            make.top.equalTo(viewLoginBg.mas_bottom).with.offset(30);
        }
    }];
    
    UIImageView *imageViewLineleft = [[UIImageView alloc]init];
    imageViewLineleft.backgroundColor = RGB(92, 98, 117);
    [self.view addSubview:imageViewLineleft];
    [imageViewLineleft mas_makeConstraints:^(MASConstraintMaker *make) {
        if (iPhone5 || iPhone4s) {
            make.width.equalTo(@(0.2*SCREEN_WIDTH));
        } else {
            make.width.equalTo(@(0.3*SCREEN_WIDTH));
        }
        make.centerY.equalTo(labelBottom);
        make.height.equalTo(@(2));
        make.left.equalTo(viewLoginBg.mas_left).with.offset(10);
    }];
    
    UIImageView *imageViewLineRight = [[UIImageView alloc]init];
    imageViewLineRight.backgroundColor = RGB(92, 98, 117);
    [self.view addSubview:imageViewLineRight];
    [imageViewLineRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageViewLineleft);
        if (iPhone5 || iPhone4s) {
            make.width.equalTo(@(0.2*SCREEN_WIDTH));
        } else {
            make.width.equalTo(@(0.3*SCREEN_WIDTH));
        }
        make.height.equalTo(@(2));
        make.right.equalTo(viewLoginBg.mas_right).with.offset(-10);
    }];
}

- (void)buttonLoginAction:(id)sender {
    NSLog(@"buttonLoginAction");
    [_textFieldAccount resignFirstResponder];
    [_textFieldPassword resignFirstResponder];
    NSMutableDictionary *dictAccount = [NSMutableDictionary dictionary];
    ANAccount *account = [ANAccount accountWithDict:dictAccount];
    [ANAccountTool saveAccount:account];
    
    //登录请求
    //登录成功之后
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    keyWindow.rootViewController = [ANBaseTabBarVC new];
}
- (void)buttonRegisterAction:(id)sender {
    NSLog(@"buttonRegisterAction");
    [_textFieldAccount resignFirstResponder];
    [_textFieldPassword resignFirstResponder];
    //注册页面
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    keyWindow.rootViewController = [ANRegisterVC new];
}
- (void)tapGestureForgetPassword:(UITapGestureRecognizer *)tap {
    NSLog(@"tapGestureForgetPassword");
    [_textFieldAccount resignFirstResponder];
    [_textFieldPassword resignFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"self%@",self);
    [_textFieldAccount resignFirstResponder];
    [_textFieldPassword resignFirstResponder];
}
- (void)loginWacht {
    NSLog(@"loginWacht");
    [_textFieldAccount resignFirstResponder];
    [_textFieldPassword resignFirstResponder];
}
-(void)loginQQ {
    NSLog(@"loginQQ");
    [_textFieldAccount resignFirstResponder];
    [_textFieldPassword resignFirstResponder];
}
-(void)loginSina {
    NSLog(@"loginSina");
    [_textFieldAccount resignFirstResponder];
    [_textFieldPassword resignFirstResponder];
}

@end
