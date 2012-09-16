//
//  TakePictureViewController.h
//  testCustomCamera
//
//  Created by Paul (Chi Kien) on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OverlayCaptureViewController.h"

@interface TakePictureViewController : UIViewController<OverlayCaptureViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    OverlayCaptureViewController *overlayView;
    UIImagePickerController *picker;
    BOOL isCameraFront;
}
@property (nonatomic, retain) UIImagePickerController *picker;
@property (nonatomic, retain) OverlayCaptureViewController *overlayView;
@end