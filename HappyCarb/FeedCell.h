//
//  FeedCell.h
//  HappyCarb
//
//  Created by Hong Le Viet on 7/26/12.
//
//

#import <UIKit/UIKit.h>



@class ThingView;
@class Thing;
@class FeedCell;

@protocol CellActionDelegate <NSObject>
- (void) becomeCurrentActionCell:(FeedCell*)cell;
- (void) resignActive:(FeedCell*)cell;
@end

@interface FeedCell : UITableViewCell
//@property (strong) UIView* optionView;
@property (strong) ThingView* thingView;
@property (weak) id<CellActionDelegate> actionDelegate;
@property (assign) BOOL actionCell;

//- (void) deactivateCell;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier thing:(Thing*)thing;
//- (void) touchesDone:(NSSet*)touches;
@end