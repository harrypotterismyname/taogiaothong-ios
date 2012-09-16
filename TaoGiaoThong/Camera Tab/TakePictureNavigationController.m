//
//  TakePictureNavigationController.m
//  TaoGiaoThong
//
//  Created by Hong on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TakePictureNavigationController.h"
#import "CaptureViewController.h"
#import "PhotoUploadPrepareViewController.h"

@interface TakePictureNavigationController ()

@end

@implementation TakePictureNavigationController

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
    
        [[self navigationController] setNavigationBarHidden:YES animated:NO];

	// Do any additional setup after loading the view.
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   // if([[segue identifier] isEqualToString:@"ContactsViewControllerSegue"])
    {
  //      CaptureViewController *cvc = (CaptureViewController *)[segue destinationViewController];
        
        
    //    [cvc viewDidLoad];
    }
}

@end
