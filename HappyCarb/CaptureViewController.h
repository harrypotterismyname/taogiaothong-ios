//
//  CaptureViewController.h
//  HappyCarb
//
//  Created by Hong on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaptureViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    IBOutlet UIButton *button;
    IBOutlet UIImageView *image;
	UIImagePickerController *imgPicker;
}

@property (nonatomic,weak) IBOutlet UIImageView *imageView; 

@property (nonatomic, retain) UIImagePickerController *imgPicker;


- (IBAction)grabImage;


@end
