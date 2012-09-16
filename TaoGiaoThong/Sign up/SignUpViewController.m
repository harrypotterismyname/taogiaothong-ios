//
//  SignUpViewController.m
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SignUpViewController.h"
#import "User.h"
#import "ASIConnection.h"
#import "Constants.h"
#import "SBJson.h"
#import "GoalSettingViewController.h"
#import "Utilities.h"
#import "AppDelegate.h"

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
    self.navigationController.navigationBarHidden = YES;
//    indicatorMB = [[MBProgressHUD alloc] initWithView:self.view];
  //  [self.view addSubview:indicatorMB];
    
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
//    [self gotoSettingGoalWithKey:nil];
//    return;
//    [indicatorMB setLabelText:@"Sign up..."];
 //   [indicatorMB show:YES];
    if ([self isUserInforCorrect]) {

        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:txtUseName.text forKey:@"user[username]"];
        [dict setObject:txtEmail.text forKey:@"user[email]"];
        [dict setObject:txtPass.text forKey:@"user[password]"];
        [dict setObject:txtPhone.text forKey:@"user[country]"];
        [dict setObject:UIImageJPEGRepresentation(avatarSelected, 0.5) forKey:@"user[avatar]"];
        [ASIConnection startConnectionWithDict:dict andURL:@"http://TaoGiaoThong.com/users.json" andNoti:SIGN_UP_NOTIFICATION AndImageKey:@"user[avatar]"];
    }
}
-(IBAction)avatarClicked:(id)sender
{
	UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	[self presentModalViewController:picker animated:YES];
}
-(IBAction)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - HANLE SIGN_UP_NOTIFICATION
-(void)handleSignup:(NSNotification *)notification
{
    NSString *strResult = [notification object];
    NSDictionary *dict = [strResult JSONValue];
  //  [indicatorMB show:NO];
    
    if ([dict objectForKey:@"email"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning !"
                                                        message:@"Username or Email has been taken" delegate:self 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    [self gotoSettingGoalWithKey:[dict objectForKey:@"api_key"]];
    
}
#pragma mark -
-(void)gotoSettingGoalWithKey:(NSString *)key
{
    GoalSettingViewController *goalView = [self.storyboard instantiateViewControllerWithIdentifier:@"GoalSetting"];
    goalView.strKey = key;
    [self.navigationController pushViewController:goalView animated:YES];
}
-(BOOL)isUserInforCorrect
{
    NSString *message = nil;
    if(txtEmail.text == nil || [txtEmail.text isEqualToString:@""] || [txtEmail.text length] == 0){
        message = @"Please input email address";
    }
    else if(txtUseName.text == nil || [txtUseName.text isEqualToString:@""] || [txtUseName.text length] == 0){
        message = @"Please input usename";
    }
    else if(txtPass.text == nil || [txtPass.text isEqualToString:@""] || [txtPass.text length] == 0){
        message = @"Please input password";
    }
    else if(![Utilities isValidEmail:txtEmail.text])
    {
        message = @"Email should look like an email address";
    }
    else if ([txtPass.text length] < 4) {
        message = @"Password is too short (minimum is 4 characters)";
    }

    if (message) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning !"
                                                            message:message
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
        
    return YES;

}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
#pragma mark - UIImagePickerController Delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissModalViewControllerAnimated:YES];
    avatarSelected = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [btnAvatar setImage:avatarSelected forState:UIControlStateNormal];
    
}
#pragma mark - 
@end
