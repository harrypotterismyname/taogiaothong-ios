//
//  Thing.m
//  HappyCarb
//
//  Created by Hong on 7/28/12.
//
//

#import "ThingView.h"
#import "AsyncImageView.h"

@interface ThingView()
@property (strong) AsyncImageView* photo;
@property (strong) AsyncImageView* avatar;

@end

@implementation ThingView
@synthesize photo = _photo;
@synthesize avatar = _avatar;
@synthesize thing;
@synthesize show_avatar;

- (id)initWithFrame:(CGRect)frame with_thing:  (Thing *) thing show_avatar: (Boolean) avatar
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.thing = thing;
        self.backgroundColor = [UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1.000];
        // Initialization code
        
         // UIImage* image = [UIImage imageNamed:@"ribbon.png"];
       
        
        self.show_avatar  = avatar;
        
        int top_margin = 8;
        int lef_margin = 8;
        
        if (self.show_avatar != false)
        {
            top_margin = 38;
        
        
        self.avatar = [[AsyncImageView alloc] init];
        self.avatar.imageURL = [NSURL URLWithString: self.thing.user.avatar_url];
        
        self.avatar.frame = CGRectMake(lef_margin,6,28, 28);
                [self addSubview:self.avatar];
        }
        
        
        //self.photo = [[AsyncImageView alloc ] initWithImage:image];
        self.photo = [[AsyncImageView alloc ] init];
        self.photo.imageURL = [NSURL URLWithString: self.thing.photo_url];
        
        NSLog(@"thing photo url" );
        //               NSLog(self.thing.photo_url);
        self.photo.frame = CGRectMake(lef_margin,top_margin,300, 300);
        
        
        
        [self addSubview:self.photo];
        
        
        

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

 - (void)drawRect:(CGRect)rect
{
    // Drawing code
    // [self.ribbon drawAtPoint:CGPointMake(256, 13)];
}
*/





@end
