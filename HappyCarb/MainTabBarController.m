//
//  MainTabBarController.m
//  HappyCarb
//
//  Created by Hong on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

//@synthesize viewControllers = _viewControllers;
//@synthesize selectedIndex = _selectedIndex;
//@synthesize bar = _bar;

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
    //JBTestContainerViewController *vc = [[JBTestContainerViewController alloc] init];
   
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
-(CGRect) subviewFrame {
    CGRect f = self.view.frame;
    return CGRectMake(0, 30, f.size.width, f.size.height - 30);
}

-(void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
   int idx = [ self.tabBar.items indexOfObject:item];
 //   UIViewController *newVC = [_viewControllers objectAtIndex:idx];
  //  UIViewController *curVC = [_viewControllers objectAtIndex:_selectedIndex];
  //  if(newVC == curVC) {
   //     return; // Don't switch - same one selected!
    //}
    
    
    if (idx ==2 ) //2 is the ID of VC camera
    {
        
        //re-load ViewControl Camera to trigger Camera View
        
        UIViewController *cameraVC =    [self.viewControllers objectAtIndex:idx];
        [cameraVC viewDidLoad ];
    
    }
    
  
    
    //[curVC.view removeFromSuperview];
    //newVC.view.frame = [self subviewFrame];
    //newVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //[self.view addSubview:newVC.view];
    //[self transitionFromViewController:curVC toViewController:newVC duration:0 options:0 animations:nil completion:nil];
//    self.selectedIndex = idx;
}


@end
