//
//  UserDataBaseManager.m
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 qxy. All rights reserved.
//

#import "UserDataBaseManager.h"
#import "FMDB.h"
#import "UserModel.h"
@interface UserDataBaseManager ()
@property(nonatomic,strong) FMDatabase *database;
@end

@implementation UserDataBaseManager

+(instancetype)sharedManager{
    
    static UserDataBaseManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[UserDataBaseManager alloc] init];
        [manager configureDataBase];
    });
    return manager;
    
}

//配置数据库，存储在沙盒中
-(void)configureDataBase{
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentPath stringByAppendingPathComponent:@"user.db"];
    self.database = [FMDatabase databaseWithPath:path];
    NSLog(@"数据库路径%@",path);
    if (![self.database open]) {
        NSLog(@"数据库打开失败！");
    }
    
    NSString *sql = @"create table if not exists user(id integer primary key,name varchar(40),password varchar(12),isAdmin integer);";
    [self.database executeUpdate:sql];
    
}

-(BOOL)addNewUser:(UserModel *)model{
    [self.database open];
    NSString *sqlStr = @"insert into user (id,name,password,isAdmin) values(?,?,?,?);";
    BOOL result = [self.database executeUpdate:sqlStr withArgumentsInArray:@[model.user_id,model.name,model.password,@(model.isAdmin)]];
    [self.database close];
    return result;
}

-(NSArray *)queryAllUser{
    [self.database open];
    NSString *sqlStr = @"select * from user";
    FMResultSet *set = [self.database executeQuery:sqlStr];
    NSMutableArray *results = [@[] mutableCopy];
    while ([set next]) {
        NSString *name = [set stringForColumn:@"name"];
        NSString *password = [set stringForColumn:@"password"];
        UserModel *model = [[UserModel alloc] init];
        model.name = name;
        model.password = password;
        model.user_id = [NSString stringWithFormat:@"%i",[set intForColumn:@"id"]];
        model.isAdmin = [set intForColumn:@"isAdmin"];
        [results addObject:model];
    }
    [self.database close];
    return  results;
}


@end
