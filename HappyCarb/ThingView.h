//
//  Thing.h
//  HappyCarb
//
//  Created by Hong on 7/28/12.
//
//

#import <UIKit/UIKit.h>
#import "Thing.h"

@interface ThingView : UIView

{
    Thing *thing;
    
}

@property (nonatomic,strong) Thing *thing;
@property (nonatomic) Boolean show_avatar;

- (id)initWithFrame:(CGRect)frame with_thing:  (Thing *) thing show_avatar:(Boolean) show_avatar;



@end
