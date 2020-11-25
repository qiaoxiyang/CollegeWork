//
//  UserInfoManager.h
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 杭州有云科技. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class UserModel;
@interface UserInfoManager : NSObject
+(instancetype)shareManager;
//当前登录用户数据
@property (nonatomic,strong)UserModel *userInfo;

@property (nonatomic,assign) BOOL isLogin;

/// 退出登录，清空数据
-(void)logoutClearData;
@end

NS_ASSUME_NONNULL_END
