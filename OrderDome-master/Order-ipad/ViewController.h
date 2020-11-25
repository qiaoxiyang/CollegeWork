//
//  ViewController.h
//  Order-ipad
//
//  Created by wdjze on 15/5/22.
//  Copyright (c) 2015年 qxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MBProgressHUD.h"

@interface ViewController : BaseViewController<UINavigationBarDelegate,UITextFieldDelegate,UIAlertViewDelegate,MBProgressHUDDelegate,UIAlertViewDelegate>
{
    MBProgressHUD *HUD;
}

@property (weak, nonatomic) IBOutlet UITextField *UserNameText;
@property (weak, nonatomic) IBOutlet UITextField *PassWordText;

@property (weak, nonatomic) IBOutlet UINavigationBar *NavigationBar;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
- (IBAction)Login:(id)sender;
- (IBAction)Up:(id)sender;
- (IBAction)Down:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *TopImage;

@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(nonatomic)BOOL elementFound;
@property(strong,nonatomic)NSString *matchiingElemenr;
@property(strong,nonatomic)NSURLConnection *conn;

@end

