//
//  UserModel.h
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 杭州有云科技. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject<NSCoding>

@property (nonatomic,copy) NSString *user_id;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,assign) BOOL isAdmin;

@end

NS_ASSUME_NONNULL_END
