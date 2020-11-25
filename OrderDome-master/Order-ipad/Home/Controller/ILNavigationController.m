//
//  ILNavigationController.m
//  Lottery
//
//  Created by app25 on 15/7/9.
//  Copyright (c) 2015年 app25. All rights reserved.
//

#import "ILNavigationController.h"


@interface ILNavigationController ()

@end

@implementation ILNavigationController

#pragma mark 一个类只会调用一次
//
+ (void)initialize
{
    // 1.取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    // 2.设置导航栏的背景图片
    NSString *navBarBg = @"navBG";
    // 设置导航栏的渐变色为白色（iOS7中返回箭头的颜色变为这个颜色：白色）
    navBar.tintColor = [UIColor whiteColor];
//    NSString *navBarBg = nil;
//    if (iOS7) { // iOS7
//        navBarBg = @"NavBar64";
//        
//        // 设置导航栏的渐变色为白色（iOS7中返回箭头的颜色变为这个颜色：白色）
//        navBar.tintColor = [UIColor whiteColor];
//    } else { // 非iOS7
//        navBarBg = @"NavBar";
//        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
//        

    
//        [barItem setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//        
//        // 设置导航栏返回按钮的背景图片
//        [barItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//        [barItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//    }
    
    [navBar setBackgroundImage:[UIImage imageNamed:navBarBg] forBarMetrics:UIBarMetricsDefault];
    
    // 3.设置导航栏标题颜色为白色
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName : [UIColor whiteColor]
                                     }];
    
    // 4.设置导航栏按钮文字颜色为白色
    [barItem setTitleTextAttributes:@{
            NSForegroundColorAttributeName : [UIColor whiteColor],
                NSFontAttributeName : [UIFont systemFontOfSize:13]
                    } forState:UIControlStateNormal];
}



#pragma mark 控制状态栏的样式
/*
 状态栏的管理：
 1> iOS7之前：UIApplication
 2> iOS7开始：交给对应的控制器去管理
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    // 白色样式
    return UIStatusBarStyleLightContent;
}


@end
