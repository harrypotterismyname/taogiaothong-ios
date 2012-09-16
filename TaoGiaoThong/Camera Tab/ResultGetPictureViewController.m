//
//  ResultGetPictureViewController.m
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ResultGetPictureViewController.h"
#import "PhotoUploadPrepareViewController.h"
#import "Utilities.h"

@interface ResultGetPictureViewController ()

@end

@implementation ResultGetPictureViewController
@synthesize imageReceived;

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
    imvReceived.image = self.imageReceived;
    [Utilities hideTabBar:self.tabBarController AnimationTime:0.1];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
#pragma mark - IBAction
-(IBAction)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)nextBntClicked:(id)sender
{
    PhotoUploadPrepareViewController *photoUploadView = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoUploadPrepareView"];
    photoUploadView.photoSelected = self.imageReceived;
    [self.navigationController pushViewController:photoUploadView animated:YES];
}
-(IBAction)btnCloseClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
