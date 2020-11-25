//
//  MenuModel.h
//  Demo
//
//  Created by 李瑞星 on 2020/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuModel : NSObject

/// 菜单名的唯一标示
@property(nonatomic,assign) NSInteger ID;

/// 菜单名
@property(nonatomic,copy) NSString *name;

/// 菜单价钱
@property(nonatomic,strong) NSNumber *price;

/// 菜单打折价钱
@property(nonatomic,strong) NSNumber *discount_price;

/// 菜单图片
@property(nonatomic,copy) NSString *image_pic;
//口味
@property (nonatomic,copy) NSString *tags;

//描述
@property (nonatomic,copy) NSString *descrip;

//类别 煲仔 甜品 冷菜 热菜
@property (nonatomic,copy) NSString *type;


-(instancetype)initWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
