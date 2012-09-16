//
//  OverlayCaptureViewController.m
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OverlayCaptureViewController.h"

@interface OverlayCaptureViewController ()

@end

@implementation OverlayCaptureViewController
@synthesize delegate;


- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor clearColor];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - IBActions
-(void)takePictureBtnClicked
{
    [self.delegate overlayCaptureViewDelegateDidTappedTakeCameraBtn];
}
-(IBAction)takePictureClicked:(id)sender
{
    [self.delegate overlayCaptureViewDelegateDidTappedTakeCameraBtn];
}
-(IBAction)closeClicked:(id)sender
{
    [self.delegate overlayCaptureViewDelegateDidTappedCloseBtn];
}

-(IBAction)choosePhotoFromLibClicked:(id)sender
{
    [self.delegate overlayCaptureViewDelegateDidTappedChoosePhotoLibBtn];
}

-(IBAction)changeCameraClicked:(id)sender
{
    [self.delegate overlayCaptureViewDelegateDidTappedChangeCameraBtn];
}

#pragma mark - end
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
