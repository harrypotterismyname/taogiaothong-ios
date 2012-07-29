//
//  ProfileStatsCell.m
//  HappyCarb
//
//  Created by Hong on 7/29/12.
//
//

#import "ProfileStatsCell.h"

@implementation ProfileStatsCell

@synthesize profileStatsView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"creating profile stats cell");
        
        
        self.profileStatsView   = [[ProfileStatsView alloc] initWithFrame:CGRectMake(0, 0, 320, 88)];
       // self.profileStatsView.user = thing;
        [self.contentView addSubview:self.profileStatsView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
