//
//  ForgetPassViewController.m
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ForgetPassViewController.h"
#import "Constants.h"
#import "ASIConnection.h"
#import "SBJson.h"

@interface ForgetPassViewController ()

@end

@implementation ForgetPassViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hanldeForgetPass:)
                                                 name:FORGET_PASS_NOTIFICATION
                                               object:nil];
    [super viewDidLoad];
   // indicator = [[MBProgressHUD alloc] initWithView:self.view];
   // [self.view addSubview:indicator];
    [txtEmail becomeFirstResponder];
	// Do any additional setup after loading the view.
}
-(IBAction)doneBtnClicked:(id)sender
{//
  //  [indicator setLabelText:@"Sending pass to email .."];
//[indicator show:YES];
    [txtEmail resignFirstResponder];
    
    if ([txtEmail.text isEqualToString:@""] || [txtEmail.text length] == 0 || txtEmail.text == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning !"
                                                        message:@"Please input your email"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil,
                              nil];
        [alert show];
        return;
    }
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:txtEmail.text forKey:@"email"];
    [ASIConnection startConnectionWithDict:dict 
                                    andURL:@"http://TaoGiaoThong.com/password_resets" 
                                   andNoti:FORGET_PASS_NOTIFICATION 
                               AndImageKey:nil];
}
-(IBAction)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)hanldeForgetPass:(NSNotification *)notification
{
 //   [indicator hide:YES];
    NSString *result = [notification object];
    if ([result isEqualToString:@" "]) {
//        NSDictionary *dict = [result JSONValue];
//        if ([dict objectForKey:@"email"] == txtEmail.text) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                            message:@"Please check your email to get new password"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil,
                                  nil];
        alert.tag = 0;
        [alert show];
//        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email address wrong!"
                                                        message:@"Please recheck your email address"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil,
                              nil];
        alert.tag = 1;
        [alert show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [txtEmail becomeFirstResponder];
    }
    
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

@end
