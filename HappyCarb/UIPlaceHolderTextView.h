//
//  UIPlaceHolderTextView.h
//  HappyCarb
//
//  Created by Hong on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


//ref: http://stackoverflow.com/questions/1328638/placeholder-in-uitextview
#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView
{
    NSString *placeholder;
    UIColor *placeholderColor;
    
@private
    UILabel *placeHolderLabel;
}

@property (nonatomic, retain) UILabel *placeHolderLabel;
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end
