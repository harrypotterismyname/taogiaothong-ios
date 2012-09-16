//
//  TakePictureViewController.m
//  testCustomCamera
//
//  Created by Paul (Chi Kien) on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TakePictureViewController.h"
#import "ResultGetPictureViewController.h"
#import "Utilities.h"

#define CAMERA_TRANSFORM_X 1.0
#define CAMERA_TRANSFORM_Y 0.8

@interface TakePictureViewController ()

@end

@implementation TakePictureViewController
@synthesize overlayView;
@synthesize picker;

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
    isCameraFront = NO;
    
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated
{
    [Utilities showTabBar:self.tabBarController AnimationTime:0.1];
    [self openCamera];
    [super viewWillAppear:animated];
}
#pragma mark - OpenCamera/ PhotoLib
-(void)openCamera
{
    self.overlayView = [self.storyboard instantiateViewControllerWithIdentifier:@"OverLayView"];
    self.overlayView.delegate = self;
    if (self.picker) {
        [self.picker dismissModalViewControllerAnimated:NO];
        self.picker = nil;
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.picker = [[UIImagePickerController alloc] init];
        self.picker.delegate = self;
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        // Hide the controls:
        self.picker.showsCameraControls = NO;
        self.picker.navigationBarHidden = YES;
        // Make camera view full screen:
        self.picker.wantsFullScreenLayout = NO;
        
        self.picker.cameraViewTransform = CGAffineTransformScale(self.picker.cameraViewTransform, CAMERA_TRANSFORM_X, CAMERA_TRANSFORM_Y);
        
        [self.picker.view addSubview:self.overlayView.view];
        //        self.picker.cameraOverlayView = self.overlayView.view;
        
        [self presentModalViewController:self.picker animated:YES];	
    } 
}
-(void)openPhotoFromLib
{
    if (self.picker) {
        [self.picker dismissModalViewControllerAnimated:NO];
        self.picker = nil;
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        self.picker = [[UIImagePickerController alloc] init];
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //self.picker.allowsEditing = YES;
        self.picker.delegate = self;        
        [self presentModalViewController:self.picker animated:YES];	
    } 
}
#pragma mark -
#pragma mark - OverlayCaptureViewController
-(void)overlayCaptureViewDelegateDidTappedTakeCameraBtn
{
    [self.picker takePicture];
}
-(void)overlayCaptureViewDelegateDidTappedChoosePhotoLibBtn
{
    [self openPhotoFromLib];
}
-(void)overlayCaptureViewDelegateDidTappedChangeCameraBtn
{
    isCameraFront = !isCameraFront;
    if (isCameraFront) {
        self.picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    else {
        self.picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }
}
-(void)overlayCaptureViewDelegateDidTappedCloseBtn
{
    [self.picker dismissModalViewControllerAnimated:YES];
}
#pragma mark -
#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.picker dismissModalViewControllerAnimated:YES];
    ResultGetPictureViewController *resultGetPictureView = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultGetPictureView"];
    resultGetPictureView.imageReceived =[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self.navigationController pushViewController:resultGetPictureView animated:YES];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self openCamera];
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
