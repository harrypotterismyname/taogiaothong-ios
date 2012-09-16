//
//  LoginViewController.h
//  TaoGiaoThong
//
//  Created by Hong on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
//#import "MBProgressHUD.h"

@class LoginViewController;

@protocol LoginViewControllerDelegate <NSObject>
- (void)LoginViewControllerDidSave:(LoginViewController *)controller;
@end

@class AppDelegate;
@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    AppDelegate *appDelegate;
//    MBProgressHUD *indicatorMB;
    User *currentUser;
}
@property (nonatomic, retain) User *currentUser;
@property (nonatomic, weak) NSString *username;
@property (nonatomic, weak) NSString *password;

@property (nonatomic, retain) IBOutlet UITextField *username_text;
@property (nonatomic, retain) IBOutlet UITextField *password_text;

@property (nonatomic, weak) id <LoginViewControllerDelegate> delegate;


- (IBAction)done:(id)sender;


@end
