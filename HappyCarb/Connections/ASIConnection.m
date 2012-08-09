//
//  ASIConnection.m
//  HappyCarb
//
//  Created by Paul (Chi Kien) on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ASIConnection.h"
#import "SBJSON.h"
#import "ASIFormDataRequest.h"

@implementation ASIConnection


+(void)startConnectionWithDict:(NSMutableDictionary *)dict andURL:(NSString *)str andNoti:(NSString *)currNoti
{
    
    NSURL *url = [NSURL URLWithString:str];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.key = currNoti;
    
    NSArray *listKey = [dict allKeys];
    
    for (NSString *key in listKey) {
        [request setPostValue:[dict objectForKey:key] forKey:key];       
    }
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    
    [request setDelegate:self];
    [request startAsynchronous];
}
+(void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    ASIFormDataRequest *rqForm = (ASIFormDataRequest *)request;
    NSString *responseString = [rqForm responseString];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:rqForm.key object:responseString];

    NSLog(@"response: %@",responseString);
}

+(void)requestFailed:(ASIHTTPRequest *)request
{
    ASIFormDataRequest *rqForm = (ASIFormDataRequest *)request;
    [[NSNotificationCenter defaultCenter] postNotificationName:rqForm.key object:nil];
    
//    NSError *error = [request error];
}

@end
