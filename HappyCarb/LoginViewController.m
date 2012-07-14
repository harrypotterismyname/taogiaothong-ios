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
    
      
    
    User *user = [User alloc];
    user.username = username_text.text; //@"huong_mua_he_trong_toi@yahoo.com";
    user.password = password_text.text;//@"123asd";
    
    api_key = user.findApi_key; //just testing
   
    username_text.text  = api_key;
    
   

    
    [self.delegate LoginViewControllerDidSave:self];
}

- (void)LoginViewControllerDidSave:
(LoginViewController *)controller

{
 
	[self dismissViewControllerAnimated:YES completion:nil];
}
@end
