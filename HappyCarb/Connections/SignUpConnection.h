//
//  SignUpConnection.h
//  HappyCarb
//
//  Created by Paul (Chi Kien) on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseConnection.h"
@class User;

@interface SignUpConnection : BaseConnection
{
    id	delegate;
	SEL completedCallbackSelector;
	SEL failedCalbackSelector;
}
- (id)initWithDelegate:(id)aDelegateInput completedCallbackSelector:(SEL)aCompletedCallbackSelector failedCalbackSelector:(SEL)aFailedCalbackSelector;
-(void)signUpWithUser:(User *)user;
@end
