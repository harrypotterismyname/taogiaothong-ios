//
//  SplashscreenController.m
//  HappyCarb
//
//  Created by Hong on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SplashscreenController.h"
#import "KeychainWrapper.h"


@interface SplashscreenController ()


@end


@implementation SplashscreenController
@synthesize pinValidated;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
      self.pinValidated = NO;
    
    [self checkLogin];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)NavigateToHomeFeed
{
    
    UITabBarController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabBarController"];
    
    [self.navigationController presentModalViewController:controller animated:FALSE];

}

- (void)checkLogin
{
    
    
    
    
    // 1
    BOOL hasPin = [[NSUserDefaults standardUserDefaults] boolForKey:PIN_SAVED];
    
    
    
    // 2
    if (hasPin) {
        
        // 3
        //NSString *user = [[NSUserDefaults standardUserDefaults] stringForKey:USERNAME];
        
        //NSString *api_key = [[NSUserDefaults standardUserDefaults] stringForKey:API_KEY];
        
        
        [self NavigateToHomeFeed];
      
       
    
    } else {
        
        
         NSString *api_key = [KeychainWrapper keychainStringFromMatchingIdentifier:API_KEY];
        
        if (api_key!=nil)
        {
            
            bool is_api_key_correct = true;
            
            if (is_api_key_correct)
            {
            //if api_key is correct, then set NSUserDefaults for PIN_SAVED, USERNAME, API_KEY
                
                NSString *username = [KeychainWrapper keychainStringFromMatchingIdentifier:USERNAME];
                
                [[NSUserDefaults standardUserDefaults] setValue:api_key forKey:API_KEY];
                
                [[NSUserDefaults standardUserDefaults] setValue:username forKey:USERNAME];
                
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:PIN_SAVED];
                
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [self checkLogin];
            }
            else {
                //TODO: check api_key is correct or not, if not then return and ask users to login again
            }
            
            NSLog(@"apikey:");
       
        }
        else {
            //api_key is nil => users have not login => display splashscreen
        }

       
    }
    
  
    
    
    
}


- (void)viewDidAppear:(BOOL)animated 
{
    [super viewDidAppear:animated];

    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
