//
//  UserDataBaseManager.h
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 qxy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class UserModel;
@interface UserDataBaseManager : NSObject

+(instancetype)sharedManager;

-(BOOL)addNewUser:(UserModel *)model;

-(NSArray *)queryAllUser;

@end

NS_ASSUME_NONNULL_END
