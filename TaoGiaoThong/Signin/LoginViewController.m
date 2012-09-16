//
//  LoginViewController.m
//  TaoGiaoThong
//
//  Created by Hong on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "SBJson.h"
#import "HappyConstant.h"
#import "KeychainWrapper.h"
#import "AppDelegate.h"
#import "PhotoUploadPrepareViewController.h"
#import "Constants.h"
#import "CustomNavigationHeaderView.h"

@interface LoginViewController ()


@end

@implementation LoginViewController

@synthesize delegate;
@synthesize username;
@synthesize password;
@synthesize username_text;
@synthesize password_text;
@synthesize currentUser;

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
//    self.navigationController.navigationBarHidden = YES;
    CustomNavigationHeaderView *headerView = [[CustomNavigationHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320,44)];
    self.navigationItem.titleView = headerView;
    [headerView createComponents];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    username_text.text = @"admin";
    password_text.text = @"123asd";
    [self createNotification];
//    indicatorMB = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:indicatorMB];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)createNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hanldeLogin:)
                                                 name:LOGIN_NOTIFICATION
                                               object:nil];
    

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
    if(![self checkInvalidateInfor])
    {
        return;
    }
    //[indicatorMB setLabelText:@"Login..."];
   // [indicatorMB show:YES];
    
    User *user = [User alloc];
    self.currentUser = user;
    self.currentUser.username = username_text.text; //@"huong_mua_he_trong_toi@yahoo.com";
    self.currentUser.password = password_text.text;//@"123asd";
    [self.currentUser login];
}
-(BOOL)checkInvalidateInfor
{
    NSString *message;
    if ([username_text.text isEqualToString:@""] || [username_text.text length] == 0 || username_text.text == nil) {
        message = @"Please input username";
    }
    if ([password_text.text isEqualToString:@""] || [password_text.text length] == 0 || password_text.text == nil) {
        message = @"Please input password";
    }
    if (message) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning !"
                                                        message:message delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
        return NO;
    }
    return YES;
}
#pragma mark - Handle notification
-(void)hanldeLogin:(NSNotification *)notification
{
    NSString *jsonString = [notification object];
    NSLog(@"login : %@",jsonString);
    NSDictionary *dict = [jsonString JSONValue];
    NSString *pass = [dict objectForKey:@"password"];
    if ([pass isEqualToString:@"['is not valid']"]) {
        
    }
    self.currentUser.api_key = [dict valueForKey:@"api_key"];
    self.currentUser.user_id = [[dict valueForKey:@"id"] integerValue];
    
    
   // api_key = [user findApi_key]; //just testing
    if (self.currentUser.api_key == nil) {
        // Password wrong
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warrning"
                                                        message:@"Password is not valid"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
        return;
    }
    appDelegate.currentUser = self.currentUser;
    
    
    [KeychainWrapper  createKeychainValue:self.currentUser.api_key forIdentifier:API_KEY ];
    [KeychainWrapper  createKeychainValue:self.currentUser.username  forIdentifier:USERNAME ];
    
    [[NSUserDefaults standardUserDefaults] setValue:self.currentUser.api_key forKey:API_KEY];
    [[NSUserDefaults standardUserDefaults] setValue:self.currentUser.username forKey:USERNAME];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:PIN_SAVED];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSString *apiLogin = [[NSUserDefaults standardUserDefaults] valueForKey:API_KEY];
    NSLog(@"API key save : %@",apiLogin);
    
    [self.delegate LoginViewControllerDidSave:self];
    
    [self NavigateToHomeFeed];

}
- (void)NavigateToHomeFeed
{
//    PhotoUploadPrepareViewController *photoUploadView = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoUploadPrepareView"];
//    photoUploadView.photoSelected = [UIImage imageNamed:@"logo.png"];
//    [self.navigationController pushViewController:photoUploadView animated:YES];
    
 //   [indicatorMB show:NO];
    UITabBarController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabBarController"];
    [self.navigationController presentModalViewController:controller animated:FALSE];
}
- (void)LoginViewControllerDidSave:(LoginViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - IBAction
-(IBAction)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)forgetPassBtnclicked:(id)sender
{
    
}
#pragma mark - UITextFieldDelegate method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self setVisibleTextFeildBackground];
    return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self setVisibleTextFeildBackground];
    UIImageView *current = (UIImageView *)[self.view viewWithTag:textField.tag + 10];
    UIImage *imgActive = [UIImage imageNamed:@"bg-textfeildActive.png"];
    current.image = imgActive;
    return YES;
}
-(void)setVisibleTextFeildBackground
{
    for (int i = 10; i < 14; i++) {
        UIImageView *imv = (UIImageView *)[self.view viewWithTag:i];
        UIImage *img = [UIImage imageNamed:@"bg-textfeildNotActive.png"];
        imv.image = img;
    }
}
@end
