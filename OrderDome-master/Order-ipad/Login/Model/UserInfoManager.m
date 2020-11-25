//
//  UserInfoManager.m
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 杭州有云科技. All rights reserved.
//

#import "UserInfoManager.h"
#import "UserModel.h"
@implementation UserInfoManager

+(instancetype)shareManager{
    
    static dispatch_once_t onceToken;
    static UserInfoManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[UserInfoManager alloc] init];
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"KUserInfoManager"];
        if (data != nil) {
            UserModel *infoModel = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            manager.userInfo = infoModel;
        }
    });
    return manager;
}

- (void)setUserInfo:(UserModel *)userInfo{
    _userInfo = userInfo;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userInfo];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"KUserInfoManager"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)logoutClearData{

    self.userInfo = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"KUserInfoManager"];
    
}



-(BOOL)isLogin{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"KUserInfoManager"];
    if (data == nil) {
        return NO;
    }
    return YES;
}


@end
