//
//  CaptureViewController.m
//  HappyCarb
//
//  Created by Hong on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CaptureViewController.h"

@interface CaptureViewController ()

@end

@implementation CaptureViewController

@synthesize imageView, imgPicker; 

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.imgPicker = [[UIImagePickerController alloc] init];
	self.imgPicker.allowsImageEditing = YES;
	self.imgPicker.delegate = self;	
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



    - (IBAction)grabImage {
        [self presentModalViewController:self.imgPicker animated:YES];
    }


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
	image.image = img;	
	[[picker parentViewController] dismissModalViewControllerAnimated:YES];
}




@end
