//
//  ViewController.m
//  eight
//
//  Created by 涂婉丽 on 15/7/28.
//  Copyright (c) 2015年 www.xcxy.eud.cn. All rights reserved.
//

#import "AdminHomeViewController.h"
#import "UIBarButtonItem+MJ.h"

@interface AdminHomeViewController ()

@end

@implementation AdminHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"有云餐馆";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"bar_button_item_account_normal" highlightedIcon:nil target:self action:@selector(settingClick)];
    
    
}

-(void)settingClick{
    
    
    
}


@end
