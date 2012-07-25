//
//  ConfigViewController.m
//  HappyCarb
//
//  Created by Hong on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConfigViewController.h"
#import "KeychainWrapper.h"
#import "HappyConstant.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

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


- (void)NavigateToSplashScreen
{
    
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"SplashscreenController"];
    
    [self.navigationController presentModalViewController:controller animated:FALSE];
    
}
#pragma mark - When Tap Save Button
-(IBAction)logoutAction:(id)sender
{

    [KeychainWrapper deleteItemFromKeychainWithIdentifier:API_KEY];

    //http://stackoverflow.com/questions/545091/clearing-nsuserdefaults
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];

    
    
    [self NavigateToSplashScreen];  
    
}

@end
