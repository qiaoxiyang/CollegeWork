//
//  RegistViewController.m
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 杭州有云科技. All rights reserved.
//

#import "RegistViewController.h"
#import "XYProgressShow.h"
#import "UserDataBaseManager.h"
#import "UserModel.h"
@interface RegistViewController ()
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UISwitch *isAdminSwitch;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (IBAction)doneButtonClick {
    [self.view endEditing:YES];
    if (![self.usernameTF hasText]) {
        
        return [XYProgressShow showMessage:@"请输入用户名" inView:self.view];
    }
    if (![self.passwordTF hasText]) {
        return [XYProgressShow showMessage:@"请输入密码" inView:self.view];
    }
    
    NSArray *allUser = [[UserDataBaseManager sharedManager] queryAllUser];
    NSInteger count = 1;
    for (UserModel *model in allUser) {
        if ([model.name isEqualToString:self.usernameTF.text]) {
            return [XYProgressShow showMessage:@"已存在该用户，请直接登录" inView:self.view];
        }
        count += 1;
    }
    UserModel *userModel = [[UserModel alloc] init];
    userModel.name = self.usernameTF.text;
    userModel.user_id = [NSString stringWithFormat:@"%li",count];
    userModel.password = self.passwordTF.text;
    userModel.isAdmin = self.isAdminSwitch.isOn;
    [[UserDataBaseManager sharedManager] addNewUser:userModel];
    
    [XYProgressShow showMessage:@"注册成功，请登录" inView:self.view];
    
    [self performSelector:@selector(back) withObject:nil afterDelay:1.25];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - UIKeyboard
-(void)keyboardWillShow:(NSNotification *)noti{

    UIWindow *window = UIApplication.sharedApplication.keyWindow;
    CGRect passwordFrame = [self.view convertRect:self.doneButton.frame toView:window];
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
