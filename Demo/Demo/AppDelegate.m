//
//  AppDelegate.m
//  Demo
//
//  Created by qiaoxy on 2020/11/23.
//

#import "AppDelegate.h"
#import "BaseNavigationViewController.h"
#import "LoginViewController.h"
#import "AdminMainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:bounds];
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    AdminMainViewController *admin = [[AdminMainViewController alloc] init];
    BaseNavigationViewController *naviVC = [[BaseNavigationViewController alloc] initWithRootViewController:admin];
    self.window.rootViewController = naviVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
