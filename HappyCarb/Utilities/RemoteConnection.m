//
//  RemoteConnection.m
//  xMen
//
//  Created by Paul (Chi Kien) on 6/25/12.
//  Copyright (c) 2012 AMAS HUB. All rights reserved.
//

#import "RemoteConnection.h"
#import "SignUpConnection.h"
#import "Constants.h"
#import "Utilities.h"
#import "DataParser.h"
#import "User.h"

#define SIGNUP_CONN @"EVENT_CONN"

static RemoteConnection *sharedRemoteManager;

@implementation RemoteConnection
@synthesize connDict;

+(id)sharedManager{
    
	@synchronized(self){
		if(sharedRemoteManager == nil)
		{
			sharedRemoteManager = [[self alloc] init];
		}
	}
    
	return sharedRemoteManager;
}
-(id)init
{
    self = [super init];
    if(self)
    {
//    	appDelegate = (iCatalogAppDelegate*)[[UIApplication sharedApplication] delegate];
        
        NSMutableDictionary *dict   = [[NSMutableDictionary alloc] init];
        self.connDict               = dict;
        
    }
    return self;
}
#pragma mark - Get Order Date _ Requestship Date by chanel ID
-(void)signUpWithUser:(User *)user
{
    SignUpConnection *conn = [[SignUpConnection alloc] 
                              initWithDelegate:self completedCallbackSelector:@selector(signupSuccessFull:)
                                                  failedCalbackSelector:@selector(signupFail:)];
    
    [conn signUpWithUser:user];
    [self.connDict setObject:conn forKey:SIGNUP_CONN];

}
-(void)signupSuccessFull:(id )sender
{
    SignUpConnection *conn = (SignUpConnection*)sender;
    NSString *result = [[NSString alloc] initWithData:conn.downloadedData encoding:NSUTF8StringEncoding];
    NSLog(@"result sign up : %@",result);
    
//    NSMutableArray *listContents = [Utilities parseListContentWith:result];
//    [DataParser allocStoreListCategory:listContents AndCateType:conn.contentTabKey];
//    [[NSNotificationCenter defaultCenter] postNotificationName:GET_CONTENT_DATA_NOTIFICATION object:listContents];

    [self.connDict removeObjectForKey:SIGNUP_CONN];
    
}
-(void)getContentFail:(id )sender
{
//    [[NSNotificationCenter defaultCenter] postNotificationName:GET_CONTENT_DATA_NOTIFICATION object:nil];
    [self.connDict removeObjectForKey:SIGNUP_CONN];
    
}




@end