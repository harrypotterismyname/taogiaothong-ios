//
//  CaptureViewController.h
//  TaoGiaoThong
//
//  Created by Hong on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverlayCaptureViewController.h"


@interface CaptureViewController : UIViewController {
    IBOutlet UIButton *button;
    IBOutlet UIImageView *image;
//	UIImagePickerController *imgPicker;
    UIImagePickerController *picker;
    OverlayCaptureViewController *overlay;

}

@property (nonatomic, retain) OverlayCaptureViewController *overlay;
@property (nonatomic, retain) UIImagePickerController *picker;

@property (nonatomic,weak) IBOutlet UIImageView *imageView; 

//@property (nonatomic, retain) UIImagePickerController *imgPicker;


@property(nonatomic,retain)IBOutlet UIBarButtonItem *saveImageBotton;
- (IBAction)grabImage;
- (IBAction)exit;


@end
