//
//  LoginViewController.m
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 qxy. All rights reserved.
//

#import "LoginViewController.h"
#import "UserDataBaseManager.h"
#import "UserModel.h"
#import "XYProgressShow.h"
#import "UserInfoManager.h"
#import "AppDelegate.h"
#import "MenuDataBaseManager.h"
#import "MenuModel.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)loginButtonClick;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    

    
    NSArray *foodlist=@[@{
                          @"descrip":@"干辣椒不是主料胜似主料，充分体现了江湖厨师\"下手重\"的特点",
                          @"id":@"30958",
                          @"image_pic":@"5.jpg",
                          @"price":@"35",
                          @"discount_price":@"20",
                          @"tags":@"偏辣",
                          @"name":@"重庆辣子鸡",
                          @"type":@"热菜",
    },
                        @{
                          @"descrip":@"马铃薯色拉凉拌菜，凉粉肉丝凉拌菜",
                          @"id":@"7454",
                          @"image_pic":@"2.jpg",
                          @"price":@"15",
                          @"discount_price":@"20",
                          @"tags":@"偏咸",
                          @"name":@"凉拌菜",
                          @"type":@"凉菜",
                        },
                        @{
                          @"descrip":@"白萝卜:100g 芹菜:50g 红椒:50g 李锦记纯香芝麻油:1 ",
                          @"id":@"7455",
                          @"image_pic":@"3.jpg",
                          @"price":@"15",
                          @"discount_price":@"20",
                          @"tags":@"凉拌",
                          @"name":@"凉拌三丝",
                          @"type":@"凉菜",
                        },
                        @{
                          @"descrip":@"芒果和西柚都含有丰富的维生素，是一道营养丰富的甜品",
                          @"id":@"7456",
                          @"image_pic":@"4.jpg",
                          @"price":@"10",
                          @"discount_price":@"20",
                          @"tags":@"有点甜",
                          @"name":@"杨枝甘露",
                          @"type":@"甜品",
                        },
                        @{
                          @"descrip":@"选用净仔公鸡肉为主料",
                          @"id":@"30960",
                          @"image_pic":@"1.jpg",
                          @"price":@"30",
                          @"discount_price":@"20",
                          @"tags":@"偏辣",
                          @"name":@"宫爆鸡丁",
                          @"type":@"热菜",
                        },
                        ];
    
    for (NSDictionary *dict in foodlist) {
        MenuModel *model = [[MenuModel alloc] initWithDict:dict];
        [[MenuDataBaseManager sharedDataBaseManager] addNewMenu:model];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)loginButtonClick {
    [self.view endEditing:YES];
    if (![self.usernameTextField hasText]) {
        
        return [XYProgressShow showMessage:@"请输入用户名" inView:self.view];
    }
    if (![self.passwordTextField hasText]) {
        return [XYProgressShow showMessage:@"请输入密码" inView:self.view];
    }
    
    NSArray *allUser = [[UserDataBaseManager sharedManager] queryAllUser];
    
    UserModel *loginModel;
    for (UserModel *model in allUser) {
        if ([model.name isEqualToString:self.usernameTextField.text]) {
            loginModel  = model;
            break;
        }
    }
    
    if (loginModel) {
        if ([loginModel.password isEqualToString:self.passwordTextField.text]) {
            //登录成功
            [[UserInfoManager shareManager] setUserInfo:loginModel];
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            delegate.isLoginController = NO;
        }else{
            [XYProgressShow showMessage:@"密码输入错误，请重新输入" inView:self.view];
        }
    }else{
        [XYProgressShow showMessage:@"此用户不存在" inView:self.view];
    }
}


#pragma mark - UIKeyboard
-(void)keyboardWillShow:(NSNotification *)noti{

    UIWindow *window = UIApplication.sharedApplication.keyWindow;
    CGRect passwordFrame = [self.view convertRect:self.loginBtn.frame toView:window];
    CGRect keyboardFrame = [[[noti userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat marginY = CGRectGetMaxY(passwordFrame) - CGRectGetMinY(keyboardFrame);
    if (marginY > 0) {
        double time = [[[noti userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        [UIView animateWithDuration:time animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, -marginY);
        }];
    }

}

-(void)keyboardWillHide:(NSNotification *)noti{
    double time = [[[noti userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    [UIView animateWithDuration:time animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];

}

@end
