//
//  LoginViewController.m
//  HappyCarb
//
//  Created by Hong on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"

#import "SBJson.h"

#import "HappyConstant.h"

#import "KeychainWrapper.h"

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
    
    [KeychainWrapper  createKeychainValue:api_key forIdentifier:API_KEY ];
    
    [KeychainWrapper  createKeychainValue:user.username  forIdentifier:USERNAME ];
    

    
    [[NSUserDefaults standardUserDefaults] setValue:api_key forKey:API_KEY];
    
    [[NSUserDefaults standardUserDefaults] setValue:user.username forKey:USERNAME];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:PIN_SAVED];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"** Key saved successfully to Keychain!!");

    
   // username_text.text = [KeychainWrapper keychainStringFromMatchingIdentifier:@"api_key"];

    [self.delegate LoginViewControllerDidSave:self];
    
    [self NavigateToHomeFeed   ];
    
    
}


- (void)NavigateToHomeFeed
{
    
    UITabBarController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabBarController"];
    
    [self.navigationController presentModalViewController:controller animated:FALSE];
    
}

- (void)LoginViewControllerDidSave:
(LoginViewController *)controller

{
 
	[self dismissViewControllerAnimated:YES completion:nil];
}
@end
