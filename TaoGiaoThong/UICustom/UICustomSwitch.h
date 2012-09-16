//
//  UICustomSwitch.h
//
//  Created by Hardy Macia on 10/28/09.
//  Copyright 2009 Catamount Software. All rights reserved.
//
//  Code can be freely redistruted and modified as long as the above copyright remains.
//

#import <Foundation/Foundation.h>


@interface UICustomSwitch : UISlider {
	BOOL on;
	UIColor *tintColor;
	UIView *clippingView;
	UILabel *rightLabel;
	UILabel *leftLabel;
	
	// private member
	BOOL m_touchedSelf;
    NSString *leftText;
    NSString *rightText;
}
@property (nonatomic, retain) NSString *leftText;
@property (nonatomic, retain) NSString *rightText;
@property(nonatomic,getter=isOn) BOOL on;
@property (nonatomic,retain) UIColor *tintColor;
@property (nonatomic,retain) UIView *clippingView;
@property (nonatomic,retain) UILabel *rightLabel;
@property (nonatomic,retain) UILabel *leftLabel;

+ (UICustomSwitch *) switchWithLeftText: (NSString *) tag1 andRight: (NSString *) tag2;
-(id)initWithFrame:(CGRect)rect andLeftText:(NSString *)lText AndRightText:(NSString *)rText;

- (void)setOn:(BOOL)on animated:(BOOL)animated;
- (void)scaleSwitch:(CGSize)newSize;

@end
