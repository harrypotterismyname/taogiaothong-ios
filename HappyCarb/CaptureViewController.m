//
//  CaptureViewController.m
//  HappyCarb
//
//  Created by Hong on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//ref: http://stackoverflow.com/questions/7813379/what-does-receiver-type-calayer-for-instance-message-is-a-forward-declaration
#import <QuartzCore/QuartzCore.h>
#import "CaptureViewController.h"
#import "PhotoUploadPrepareViewController.h"

@interface CaptureViewController ()

@end

@implementation CaptureViewController

@synthesize imageView, imgPicker, saveImageBotton; 

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
    
      [self hideTabBar:self.tabBarController]; 
    

    
    
	// Do any additional setup after loading the view.
    
    self.imgPicker = [[UIImagePickerController alloc] init];
	self.imgPicker.allowsEditing = YES;
	self.imgPicker.delegate = self;	
    
    
    if (FALSE) {
        	self.imgPicker.showsCameraControls=YES;
    }
    
    //re-initilize image, to avoid show the last photo
    imageView.image = nil;
    
    //ref: http://stackoverflow.com/questions/205431/rounded-corners-on-uiimage
    CALayer * layr = [imageView layer];
    [layr setMasksToBounds:YES];
    [layr setCornerRadius:6.0];
    
    // You can even add a border
    [layr setBorderWidth:1.0];
    [layr setBorderColor:[[UIColor grayColor] CGColor]];
    
     [self presentModalViewController:self.imgPicker animated:YES];

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

- (IBAction)exit{
    
    
    self.tabBarController.selectedIndex = 0;
    
    
    //[self dismissModalViewControllerAnimated:FALSE];
    
    [self showTabBar:self.tabBarController ];
    //[self viewDidUnload     ];
    //[self viewWillDisappear:TRUE];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
	image.image = img;	
    
    
	[[picker parentViewController] dismissModalViewControllerAnimated:YES];
}


#pragma mark - When Tap Save Button
-(IBAction)saveImageAction:(id)sender
{
    UIImage *image=imageView.image;
    //save photo to photoAlbum
    UIImageWriteToSavedPhotosAlbum(image,self, @selector(CheckedImage:didFinishSavingWithError:contextInfo:), nil);
    saveImageBotton.enabled=NO;
}

#pragma mark - Check Save Image Error
- (void)CheckedImage:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    UIAlertView *alert;
    
    if (error) {
        alert = [[UIAlertView alloc] initWithTitle:@"ERROR"
                                           message:[error description]
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                           message:@"The image has been stored in an album"
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
    }
    
    [alert show];
   // [alert release];
}

#pragma mark - When Finish Shoot

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *originalImage=[info objectForKey:UIImagePickerControllerOriginalImage];
    //Show OriginalImage size
  //  NSLog(@"OriginalImage width:%f height:%f",image.size.width,image.size.height);
    imageView.image=originalImage;
    saveImageBotton.enabled=YES;
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - When Tap Cancel

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker { 
    [picker dismissModalViewControllerAnimated:YES]; 
    
    if (imageView.image== nil)//if does not capture yet => exit
    {
    
        [self exit];
    }
}


//ref: http://stackoverflow.com/questions/5272290/how-to-hide-uitabbarcontroller

- (void) hideTabBar:(UITabBarController *) tabbarcontroller {
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, 480, view.frame.size.width, view.frame.size.height)];
        } 
        else 
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480)];
        }
        
    }
    
    [UIView commitAnimations];
    
    
    
    
    
}
//ref: http://stackoverflow.com/questions/5272290/how-to-hide-uitabbarcontroller
- (void) showTabBar:(UITabBarController *) tabbarcontroller {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        NSLog(@"%@", view);
        
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, 431, view.frame.size.width, view.frame.size.height)];
            
        } 
        else 
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 431)];
        }
        
        
    }
    
    [UIView commitAnimations]; 
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"PhotoUploadPrepareSegue"]){
        //PhotoUploadPrepareViewController *cvc =
        
        (PhotoUploadPrepareViewController *)[segue destinationViewController];
        
        

    }
}

@end
