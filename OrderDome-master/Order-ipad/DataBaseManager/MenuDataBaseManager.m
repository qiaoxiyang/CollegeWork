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
    
    NSString *sql = @"create table if not exists hotel_menu(id integer primary key,name varchar(40),price Double,discount_price Double,image_pic varchar(50),tags varchar(40),descrip varchar(100),type varchar(40),);";
    [self.database executeUpdate:sql];
    
}

-(BOOL)addNewMenu:(MenuModel *)model{
    [self.database open];
    NSString *sqlStr = @"insert into hotel_menu (id,name,price,discount_price,image_pic,tags,descrip,type) values(?,?,?,?,?,?,?,?);";
    BOOL result = [self.database executeUpdate:sqlStr withArgumentsInArray:@[@(model.ID),model.name,model.price,model.discount_price,model.image_pic,model.tags,model.descrip,model.type]];
    [self.database close];
    return result;
}

-(BOOL)deleteMenuWithID:(NSInteger)ID{
    [self.database open];
    BOOL result = [self.database executeUpdate:@"delete from 'hotel_menu' where id = ?" withArgumentsInArray:@[@(ID)]];
    [self.database close];
    return result;
}

-(NSArray *)queryAllUser{
    [self.database open];
    NSString *sqlStr = @"select * from user";
    FMResultSet *set = [self.database executeQuery:sqlStr];
    NSMutableArray *results = [@[] mutableCopy];
    while ([set next]) {
        int ID = [set intForColumn:@"id"];
        NSString *name = [set stringForColumn:@"name"];
        double price = [set doubleForColumn:@"price"];
        double discount_price = [set doubleForColumn:@"discount_price"];
        NSString *image_pic = [set stringForColumn:@"image_pic"];
        NSString *tags = [set stringForColumn:@"tags"];
        NSString *descrip = [set stringForColumn:@"descrip"];
        NSString *type = [set stringForColumn:@"type"];
        MenuModel *model = [[MenuModel alloc] init];
        model.name = name;
        model.price = @(price);
        model.ID = ID;
        model.discount_price = @(discount_price);
        model.image_pic = image_pic;
        model.tags = tags;
        model.descrip = descrip;
        model.type = type;
        [results addObject:model];
    }
    [self.database close];
    return  results;
}

@end
