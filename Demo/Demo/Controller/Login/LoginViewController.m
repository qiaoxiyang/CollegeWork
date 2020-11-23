//
//  LoginViewController.m
//  Demo
//
//  Created by qiaoxy on 2020/11/23.
//

#import "LoginViewController.h"
#import "Masonry.h"
#import "UserMainViewController.h"
#import "AdminMainViewController.h"

@interface LoginViewController ()

@property (nonatomic,strong)UITextField *userTextField;
@property (nonatomic,strong)UITextField *passwordTextField;
@property (nonatomic,strong)UIButton *loginButton;
@property(nonatomic,strong) UISegmentedControl *segmented;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"欢迎进入奥斯卡酒店";
    [self initSubViews];
}

-(void)initSubViews{
    
    self.segmented = [[UISegmentedControl alloc] initWithItems:@[@"管理员",@"用户"]];
    [self.segmented addTarget:self action:@selector(segmentedChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmented];
    [self.view addSubview:self.userTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    
    UILabel *userLabel = [[UILabel alloc] init];
    userLabel.text = @"用户名";
    userLabel.textColor = [UIColor darkGrayColor];
    userLabel.font = [UIFont systemFontOfSize:14];
    
    UILabel *psdLabel = [[UILabel alloc] init];
    psdLabel.text = @"密码";
    psdLabel.textColor = [UIColor darkGrayColor];
    psdLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:userLabel];
    [self.view addSubview:psdLabel];
    
    [self.segmented mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
        } else {
            // Fallback on earlier versions
            make.top.equalTo(self.view).offset(20);
        }
        make.centerX.equalTo(self.view);
    }];
    
    [userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(self.segmented.mas_bottom).offset(25);
        make.width.mas_equalTo(60);
    }];
    
    [self.userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userLabel.mas_right).offset(8);
        make.centerY.equalTo(userLabel);
        make.right.equalTo(self.view).offset(-15);
    }];
    
    [psdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(userLabel.mas_bottom).offset(30);
        make.width.mas_equalTo(60);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(psdLabel.mas_right).offset(8);
        make.centerY.equalTo(psdLabel);
        make.right.equalTo(self.view).offset(-15);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(49);
    }];
    
    self.segmented.selectedSegmentIndex = 0;
}

-(void)segmentedChanged:(UISegmentedControl *)sender{
    
    self.userTextField.text = nil;
    self.passwordTextField.text = nil;
    
}

//登录事件点击
-(void)loginClick{
    if (![self.userTextField hasText]) {
        [self showAlertWithMessage:@"请输入用户名"];
        return;
    }
    if (![self.passwordTextField hasText]) {
        [self showAlertWithMessage:@"请输入密码"];
        return;
    }
    
    if (self.segmented.selectedSegmentIndex == 0) {
        //管理员登录
        
        if ([self.userTextField.text isEqualToString:@"Admin"]&&[self.passwordTextField.text isEqualToString:@"123456"]) {
            AdminMainViewController *adminVC = [[AdminMainViewController alloc] init];
            [self.navigationController pushViewController:adminVC animated:YES];
        }else{
            [self showAlertWithMessage:@"用户名或密码输入错误，请重新输入"];
        }
    }else{
        //用户登录
        if ([self.userTextField.text isEqualToString:@"Tom"]&&[self.passwordTextField.text isEqualToString:@"qwe123"]) {
            UserMainViewController *adminVC = [[UserMainViewController alloc] init];
            [self.navigationController pushViewController:adminVC animated:YES];
        }else{
            [self showAlertWithMessage:@"用户名或密码输入错误，请重新输入"];
        }
    }
    
    
}

-(void)showAlertWithMessage:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - Getter

- (UITextField *)userTextField
{
   if (!_userTextField) {
        _userTextField = [[UITextField alloc] init];
        _userTextField.delegate = (id)self;
       _userTextField.placeholder = @"请输入用户名";
        _userTextField.font = [UIFont systemFontOfSize:14];
        _userTextField.returnKeyType = UIReturnKeyDone;
        _userTextField.keyboardAppearance = UIKeyboardAppearanceDefault;
        _userTextField.borderStyle = UITextBorderStyleRoundedRect;
        _userTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
   return _userTextField;
}

- (UITextField *)passwordTextField
{
   if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.delegate = (id)self;
       _passwordTextField.placeholder = @"请输入密码";
        _passwordTextField.font = [UIFont systemFontOfSize:14];
        _passwordTextField.returnKeyType = UIReturnKeyDone;
        _passwordTextField.keyboardAppearance = UIKeyboardAppearanceDefault;
        _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTextField.secureTextEntry = NO;
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
   return _passwordTextField;
}

- (UIButton *)loginButton
{
   if (!_loginButton) {
        _loginButton = [[UIButton alloc] init];
        _loginButton.backgroundColor = [UIColor orangeColor];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:15];
       [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
       [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
       [_loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    }
   return _loginButton;
}

@end
