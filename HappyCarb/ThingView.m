//
//  Thing.m
//  HappyCarb
//
//  Created by Hong on 7/28/12.
//
//

#import "ThingView.h"

@interface ThingView()
@property (strong) UIImage* ribbon;

@end

@implementation ThingView
@synthesize ribbon = _ribbon;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1.000];
        // Initialization code
        
         self.ribbon = [UIImage imageNamed:@"ribbon.png"];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
 - (void)drawRect:(CGRect)rect
{
    // Drawing code
     [self.ribbon drawAtPoint:CGPointMake(256, 13)];
}


@end
