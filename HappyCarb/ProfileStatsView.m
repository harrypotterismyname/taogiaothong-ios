//
//  ProfileStatsView.m
//  HappyCarb
//
//  Created by Hong on 7/29/12.
//
//

#import "ProfileStatsView.h"
#import "ImageUtil.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Border.h"

@interface ProfileStatsView ()

@property (strong) UIImage   *avatar;


@end

@implementation ProfileStatsView
@synthesize user;
@synthesize avatar;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       // self.backgroundColor = [UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1.000];
        // Initialization code
        
        self.backgroundColor = [UIColor darkGrayColor];
        
        CGSize sz = CGSizeMake(68, 68);
        
        
        
         UIImage *avatarimg   = [ImageUtil imageWithImage:[UIImage imageNamed:@"avatar.jpg"] scaledToSize:sz ];
        
      //  BOOL shadown = YES;
     //   NSUInteger border = 3;
        
        self.avatar = [avatarimg imageWithColoredBorder:3 borderColor:[UIColor blackColor ] withShadow:NO];
        
        
       // [self.avatar.size
    }

    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
     [self.avatar drawAtPoint:CGPointMake(8, 6)];
}


@end
