//
//  SignUpViewController.m
//  HappyCarb
//
//  Created by Paul (Chi Kien) on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SignUpViewController.h"
#import "User.h"
#import "RemoteConnection.h"
#import "ASIConnection.h"
#import "Constants.h"
#import "SBJson.h"
#import "GoalSettingViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
    [self createNotification];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self removeNotification];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
-(void)createNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleSignup:) name:SIGN_UP_NOTIFICATION object:nil];
}
-(void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SIGN_UP_NOTIFICATION object:nil];
}
#pragma mark - IBACTION
-(IBAction)doneClicked:(id)sender
{
    if ([self isUserInforCorrect]) {

        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:txtUseName.text forKey:@"user[username]"];
        [dict setObject:txtEmail.text forKey:@"user[email]"];
        [dict setObject:txtPass.text forKey:@"user[password]"];
        [dict setObject:txtPhone.text forKey:@"user[country]"];
        [ASIConnection startConnectionWithDict:dict andURL:@"http://happycarb.com/users.json" andNoti:SIGN_UP_NOTIFICATION];
    }
}
-(IBAction)avatarClicked:(id)sender
{
}
#pragma mark - HANLE SIGN_UP_NOTIFICATION
-(void)handleSignup:(NSNotification *)notification
{
    NSString *strResult = [notification object];
    NSDictionary *dict = [strResult JSONValue];
    if ([dict objectForKey:@"email"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning !"
                                                        message:@"Username or Email has been taken" delegate:self 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    [self gotoSettingGoal];
    
}
#pragma mark -
-(void)gotoSettingGoal
{
    GoalSettingViewController *goalView = [self.storyboard instantiateViewControllerWithIdentifier:@"GoalSetting"];
    [self.navigationController pushViewController:goalView animated:YES];
}
-(BOOL)isUserInforCorrect
{
    return YES;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
