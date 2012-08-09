//
//  ProfileViewController.h
//  HappyCarb
//
//  Created by Hong on 7/29/12.
//
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UITableViewController


@property (nonatomic, strong) NSArray *Feeds;
@property(nonatomic,retain)IBOutlet UIButton *refreshButton;
@property  (nonatomic) NSInteger page;
-(IBAction)refreshAction:(id)sender;



@end
