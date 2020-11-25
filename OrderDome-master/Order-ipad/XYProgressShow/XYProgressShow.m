//
//  XYProgressShow.m
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 杭州有云科技. All rights reserved.
//

#import "XYProgressShow.h"
#import "MBProgressHUD.h"
@implementation XYProgressShow
+(void)showMessage:(NSString *)message inView:(UIView *)view{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    [hud hide:YES afterDelay:1.5];
    
}
@end
