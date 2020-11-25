//
//  RegistViewController.h
//  Order-ipad
//
//  Created by qiaoxy on 2020/11/25.
//  Copyright © 2020 杭州有云科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegistViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
- (IBAction)doneButtonClick;

@end

NS_ASSUME_NONNULL_END
