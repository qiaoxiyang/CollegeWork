//
//  LoginViewController.m
//  Demo
//
//  Created by qiaoxy on 2020/11/23.
//

#import "LoginViewController.h"
#import "Masonry.h"
@interface LoginViewController ()

@property (nonatomic,strong)UITextField *userTextField;
@property (nonatomic,strong)UITextField *passwordTextField;
@property (nonatomic,strong)UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubViews];
}

-(void)initSubViews{
    
    [self.view addSubview:self.userTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    
    
}

-(void)loginClick{
    
    
    
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
