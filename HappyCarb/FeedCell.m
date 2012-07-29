//
//  FeedCell.m
//  HappyCarb
//
//  Created by Hong Le Viet on 7/26/12.
//
//

#import "FeedCell.h"

#import "ThingView.h"
#import "Thing.h"
#import "AppDelegate.h"


@implementation FeedCell


@synthesize actionDelegate = _actionDelegate;
@synthesize thingView = _thingView;
@synthesize actionCell = _actionCell;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier thing:(Thing*)thing
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"creating cell");
        
       // [self.contentView addSubview:self.optionView];
        
        self.thingView = [[ThingView alloc] initWithFrame:CGRectMake(0, 0, 320, 368)];
        self.thingView.thing = thing;
        [self.contentView addSubview:self.thingView];
        
        self.actionCell = NO;
    }
    return self;

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
