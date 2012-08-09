//
//  FavoriteViewController.h
//  HappyCarb
//
//  Created by Hong on 8/9/12.
//
//

#import <UIKit/UIKit.h>

@interface FavoriteViewController : UITableViewController

@property (nonatomic, strong) NSArray *Feeds;
@property(nonatomic,retain)IBOutlet UIButton *refreshButton;
@property  (nonatomic) NSInteger page;
-(IBAction)refreshAction:(id)sender;



@end
