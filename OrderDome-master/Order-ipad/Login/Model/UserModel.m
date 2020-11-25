//
//  UserModel.m
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 杭州有云科技. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel



- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (self.name != nil) {
        [aCoder encodeObject:self.name forKey:@"name"];
    }
    if (self.password != nil) {
        [aCoder encodeObject:self.password forKey:@"password"];
    }
    if (self.user_id != nil) {
        [aCoder encodeObject:self.user_id forKey:@"user_id"];
    }
   
    [aCoder encodeBool:self.isAdmin forKey:@"isAdmin"];
        
    

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.user_id  = [aDecoder decodeObjectForKey:@"user_id"];
        self.name  = [aDecoder decodeObjectForKey:@"name"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.isAdmin = [aDecoder decodeBoolForKey:@"isAdmin"];
    }
  
    return self;
    
}


@end
