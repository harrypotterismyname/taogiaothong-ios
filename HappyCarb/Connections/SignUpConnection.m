//
//  SignUpConnection.m
//  HappyCarb
//
//  Created by Paul (Chi Kien) on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SignUpConnection.h"
#import "User.h"
#import "Constants.h"
#import "SBJson.h"

#define URL_SIGN_UP @"http://happycarb.com/users.json"

@implementation SignUpConnection

- (id)initWithDelegate:(id)aDelegateInput completedCallbackSelector:(SEL)aCompletedCallbackSelector failedCalbackSelector:(SEL)aFailedCalbackSelector
{
    self=[super init];
    if (self) {
        delegate                   = aDelegateInput;
        completedCallbackSelector  = aCompletedCallbackSelector;
        failedCalbackSelector      = aFailedCalbackSelector;
    }
    return self;
}
-(void)signUpWithUser:(User *)user
{
    NSArray *keys = [NSArray arrayWithObjects:@"user[username]", @"user[email]",@"user[password]",@"user[country]",nil];
    NSArray *objects = [NSArray arrayWithObjects:user.username, user.email,user.password,user.country, nil];
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];   

    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    NSData *jsonData = [writer dataWithObject:jsonDictionary];
    
	NSMutableData *data = [[NSMutableData alloc] init];
	[data appendData:jsonData];		
    
    
    [super startRequestUploadWithURL:URL_SIGN_UP
						  httpMethod:@"POST"
							httpBody:data
						 contentType:@"application/json"
						   actionURI:nil
							 timeOut:CONNECTION_TIMEOUT
							delegate:delegate
				   completedCallback:completedCallbackSelector
			  authenticationCallback:nil
					  failedCallback:failedCalbackSelector
							username:nil
							password:nil];
//	[data release];

}
-(void)signInWithUser:(User *)user
{
//    NSArray *keys = [NSArray arrayWithObjects:@"user[username]", @"user[email]",@"user[password]",@"user[country]",nil];
//    NSArray *objects = [NSArray arrayWithObjects:user.username, user.email,user.password,user.country, nil];
//    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
//    
//    NSString *myJSONString =[jsonDictionary JSONRepresentation];
//    
////    
////    NSString *json = [NSString stringWithFormat:@"{\"user[username]\":\"%@\",\"user[email]\":\"%@\",\"user[password]\":\"%@\",\"user[country]\":\"%@\"}", user.username, user.email,user.password,user.country];
//    
//    NSLog(@"Json sign up :  %@", myJSONString);
//	NSData *jsonData = [myJSONString dataUsingEncoding:NSUTF8StringEncoding];//[json dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
//	NSMutableData *data = [[NSMutableData alloc] init];
//	[data appendData:jsonData];	
//    
//    
//    [super startRequestUploadWithURL:URL_SIGN_UP
//						  httpMethod:@"POST"
//							httpBody:data
//						 contentType:@"application/json; charset=utf-8"
//						   actionURI:nil
//							 timeOut:CONNECTION_TIMEOUT
//							delegate:delegate
//				   completedCallback:completedCallbackSelector
//			  authenticationCallback:nil
//					  failedCallback:failedCalbackSelector
//							username:nil
//							password:nil];
}
@end
