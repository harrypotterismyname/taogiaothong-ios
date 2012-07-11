//
//  LoginViewController.m
//  HappyCarb
//
//  Created by Hong on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
#import "SBJson.h"

@interface LoginViewController ()


@end

@implementation LoginViewController

@synthesize delegate;
@synthesize username;
@synthesize password;
@synthesize username_text;
@synthesize password_text;
@synthesize api_key;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)done:(id)sender
{
    
       username_text.text = @"sdfsd";
    
    User *user = [User alloc];
    user.username = @"viethong.le@gmail.com";
    user.password = @"123asd";
    
    username_text.text = user.findApi_key;
   

    
   

    
    [self.delegate LoginViewControllerDidSave:self];
}

- (void)LoginViewControllerDidSave:
(LoginViewController *)controller

{
 
	[self dismissViewControllerAnimated:YES completion:nil];
}
@end
