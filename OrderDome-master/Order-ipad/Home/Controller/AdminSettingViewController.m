//
//  AdminSettingViewController.m
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 杭州有云科技. All rights reserved.
//

#import "AdminSettingViewController.h"
#import "UserInfoManager.h"
#import "UserModel.h"
#import "AppDelegate.h"
@interface AdminSettingViewController ()<UIAlertViewDelegate>

@end

@implementation AdminSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UserModel *model = [UserInfoManager shareManager].userInfo;
    self.nameLabel.text = [NSString stringWithFormat:@"管理员：%@",model.name];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        //订单详情
    }else if(indexPath.row == 2){
        //退出登录
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定要退出登录吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        //退出登录
        [[UserInfoManager shareManager] logoutClearData];
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate setIsLoginController:YES];
    }
}

@end
