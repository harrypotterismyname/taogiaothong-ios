//
//  HomeFeedViewController.h
//  HappyCarb
//
//  Created by Hong Le Viet on 7/26/12.
//
//

#import <UIKit/UIKit.h>

@interface HomeFeedTableViewController : UITableViewController


@property (nonatomic, strong) NSArray *Feeds;
@property(nonatomic,retain)IBOutlet UIButton *refreshButton;
-(IBAction)refreshAction:(id)sender;


@end
