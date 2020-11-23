//
//  DataBaseManager.m
//  Demo
//
//  Created by 李瑞星 on 2020/11/23.
//

#import "MenuDataBaseManager.h"
#import "FMDB.h"
#import "MenuModel.h"
@interface MenuDataBaseManager ()
@property(nonatomic,strong) FMDatabase *database;
@end

@implementation MenuDataBaseManager

+(instancetype)sharedDataBaseManager{
    static MenuDataBaseManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MenuDataBaseManager alloc] init];
        [manager configureDataBase];
    });
    return manager;
}

//配置数据库，存储在沙盒中
-(void)configureDataBase{
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentPath stringByAppendingPathComponent:@"hotel_db.db"];
    self.database = [FMDatabase databaseWithPath:path];
    NSLog(@"数据库路径%@",path);
    if (![self.database open]) {
        NSLog(@"数据库打开失败！");
    }
    
    NSString *sql = @"create table if not exists hotel_menu(id integer primary key,name varchar(40),price Double,discount_price Double,image_pic varchar(50));";
    [self.database executeUpdate:sql];
    
}

-(BOOL)addNewMenu:(MenuModel *)model{
    [self.database open];
    NSString *sqlStr = @"insert into hotel_menu (id,name,price,discount_price,image_pic) values(?,?,?,?,?);";
    BOOL result = [self.database executeUpdate:sqlStr withArgumentsInArray:@[@(model.ID),model.name,model.price,model.discount_price,model.image_pic]];
    [self.database close];
    return result;
}

-(BOOL)deleteMenuWithID:(NSInteger)ID{
    [self.database open];
    BOOL result = [self.database executeUpdate:@"delete from 'hotel_menu' where id = ?" withArgumentsInArray:@[@(ID)]];
    [self.database close];
    return result;
}


@end
