//
//  AppDelegate.m
//  Order-ipad
//
//  Created by mac on 15/5/22.
//  Copyright (c) 2015年 qxy. All rights reserved.
//

#import "AppDelegate.h"
#import "AdminHomeViewController.h"
#import "LoginViewController.h"
#import "UserInfoManager.h"
#import "UserModel.h"
#import "ILNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:screenRect];
    self.window.backgroundColor = [UIColor whiteColor];
    self.isLoginController = ![[UserInfoManager shareManager] isLogin];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//是否为登录界面
-(void)setIsLoginController:(BOOL)isLoginController{
    _isLoginController = isLoginController;
    UIViewController *vc;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (isLoginController) {
        
        vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginNav"];
    }else{
        BOOL isAdmin = [UserInfoManager shareManager].userInfo.isAdmin;
        if (isAdmin) {
            AdminHomeViewController *homeVc = [[AdminHomeViewController alloc] init];
            vc = [[ILNavigationController alloc] initWithRootViewController:homeVc];
            
        }else {
            vc = [storyboard instantiateViewControllerWithIdentifier:@"mainview"];

        }
    }
    self.window.rootViewController = vc;
}

@end
