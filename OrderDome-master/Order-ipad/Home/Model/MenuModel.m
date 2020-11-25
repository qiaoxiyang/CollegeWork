//
//  MenuModel.m
//  Demo
//
//  Created by 李瑞星 on 2020/11/23.
//

#import "MenuModel.h"

@implementation MenuModel
-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.ID = [dict[@"id"] integerValue];
        self.name = dict[@"name"];
        self.descrip = dict[@"descrip"];
        self.price = dict[@"price"];
        self.discount_price = dict[@"discount_price"];
        self.tags = dict[@"tags"];
        self.type = dict[@"type"];
    }
    return self;
}
@end
