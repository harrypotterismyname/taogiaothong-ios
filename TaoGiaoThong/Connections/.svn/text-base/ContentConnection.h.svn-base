//
//  ContentConnection.h
//  xMen
//
//  Created by Paul (Chi Kien) on 6/26/12.
//  Copyright (c) 2012 AMAS HUB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseConnection.h"

@interface ContentConnection : BaseConnection
{
    id	delegate;
	SEL completedCallbackSelector;
	SEL failedCalbackSelector;
    int connectionKey;
    NSString *contentTabKey;
}
@property int connectionKey;
@property(nonatomic, retain) NSString *contentTabKey;

- (id)initWithDelegate:(id)aDelegateInput completedCallbackSelector:(SEL)aCompletedCallbackSelector failedCalbackSelector:(SEL)aFailedCalbackSelector;
-(void)getContentWithType:(NSString *)type AndLastUpdate:(double )lastUp;
-(void)getImageWithURL:(NSString *)url;
-(void)getContentDetailWithCateID:(int )cateID;
-(void)likeContentDetailWithCateID:(int )cateID;
-(void)sendEmail:(NSString *)emailAdd;
@end
