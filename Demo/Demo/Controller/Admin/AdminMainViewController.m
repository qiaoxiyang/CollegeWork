//
//  AdminMainViewController.m
//  Demo
//
//  Created by qiaoxy on 2020/11/23.
//

#import "AdminMainViewController.h"
#import "MenuDataBaseManager.h"
#import "MenuModel.h"
@interface AdminMainViewController ()

@property(nonatomic,strong) NSArray *dataSource;

@end

@implementation AdminMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
}

-(void)initSubViews{
    self.dataSource = @[@"添加",@"删除"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        //添加
        MenuModel *model = [[MenuModel alloc] init];
        model.ID = 1;
        model.name = @"测试";
        model.price = @200;
        model.discount_price = @100;
        model.image_pic = @"atarada";
        [[MenuDataBaseManager sharedDataBaseManager] addNewMenu:model];
    }else{
        [[MenuDataBaseManager sharedDataBaseManager] deleteMenuWithID:1];
    }
    
}


@end
