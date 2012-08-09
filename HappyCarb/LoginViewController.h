//
//  LoginViewController.h
//  HappyCarb
//
//  Created by Hong on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@class LoginViewController;

@protocol LoginViewControllerDelegate <NSObject>

    - (void)LoginViewControllerDidSave: 
    (LoginViewController *)controller;
@end


@interface LoginViewController : UIViewController


@property (nonatomic, weak) NSString *username;
@property (nonatomic, weak) NSString *password;
@property (nonatomic, weak) NSString *api_key;

@property (nonatomic, retain) IBOutlet UITextField *username_text;
@property (nonatomic, retain) IBOutlet UITextField *password_text;

@property (nonatomic, weak) id <LoginViewControllerDelegate> delegate;


- (IBAction)done:(id)sender;


@end
