//
//  PhotoUploadPrepareViewController.m
//  TaoGiaoThong
//
//  Created by Hong on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoUploadPrepareViewController.h"
#import "UICustomSwitch.h"
#import "Thing.h"
#import "AppDelegate.h"
#import "Constants.h"
#import "SBJson.h"
#import "ImageUtil.h"


@interface PhotoUploadPrepareViewController ()

@end

@implementation PhotoUploadPrepareViewController
@synthesize photoSelected;

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
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self createSomeComponents];
//    indicator = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:indicator];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)createSomeComponents
{
    /*
     customSwitchPrivate = [[UICustomSwitch alloc] initWithFrame:CGRectMake(200, 237, 0, 0) andLeftText:@"kg" AndRightText:@"lbs"];
    [self.view addSubview:customSwitchPrivate];
    
    customSwitchFb = [[UICustomSwitch alloc] initWithFrame:CGRectMake(200, 275, 0, 0) andLeftText:@"ON" AndRightText:@"OFF"];
    [self.view addSubview:customSwitchFb];
     */
    
}
#pragma mark - IBAction
-(IBAction)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)doneBtnClicked:(id)sender
{
    // Send to server
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePostImage:) name:NOTIFICATION_POST_PHOTO object:nil];

    if ([self isInfoValidate]) {
//        [indicator setLabelText:@"Posting photo..."];
 //       [indicator show:YES];
        [txtTags resignFirstResponder];
        [txtCaptions resignFirstResponder];
        
        Thing *thing = [[Thing alloc] init];
        thing.user_id = appDelegate.currentUser.user_id;
        thing.user = appDelegate.currentUser;
        thing.note = txtCaptions.text;
        thing.tags = txtTags.text;
        

        CGSize newSize =CGSizeMake( 276, 368 );
        
        [ImageUtil imageWithImage: self.photoSelected scaledToSize: newSize];
        

        
        //quick hack
        NSData *dataForJPEGFile = UIImageJPEGRepresentation(self.photoSelected, 0.1);
        
        thing.photo = dataForJPEGFile;
        thing.isPrivate = customSwitchPrivate.value;
        thing.isShareFb = customSwitchFb.value;
    
        [thing postPhoto];
    }
}
-(void)handlePostImage:(NSNotification *)notification
{
 //   [indicator hide:YES];

    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_POST_PHOTO object:nil];
    NSString *result = [notification object];
    NSDictionary *dict = [result JSONValue];
    if ([dict objectForKey:@"id"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                        message:@"Post photo successful"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Can not post photo"
                                                        message:@"Please recheck connection"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
        NSLog(@"post image fail");
    }
}
#pragma mark - UITextFeildDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - Other
-(BOOL)isInfoValidate
{
    if (txtTags.text == nil || [txtTags.text length] == 0 || [txtTags.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info is invalid" 
                                                        message:@"Please input tags"
                                                       delegate:self 
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
        return NO;
    }
    return YES;
}
#pragma mark -
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
