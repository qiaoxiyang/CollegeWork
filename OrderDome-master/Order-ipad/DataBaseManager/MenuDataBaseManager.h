//
//  DataBaseManager.h
//  Demo
//
//  Created by 李瑞星 on 2020/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class MenuModel; //告诉编译器有这个类，提高编译效率，在.m中才真正导入该类
@interface MenuDataBaseManager : NSObject

/// 获取菜单的管理类，为当前类创建一个单例对象
+(instancetype)sharedDataBaseManager;

/// 新增一个菜单
/// @param model 菜单model
-(BOOL)addNewMenu:(MenuModel *)model;

/// 根据ID删除一个菜单
/// @param ID 菜单ID
-(BOOL)deleteMenuWithID:(NSInteger)ID;

-(NSArray *)queryAllUser;
@end

NS_ASSUME_NONNULL_END
