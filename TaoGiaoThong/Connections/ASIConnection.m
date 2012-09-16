//
//  ASIConnection.m
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ASIConnection.h"
#import "SBJSON.h"
#import "ASIFormDataRequest.h"

@implementation ASIConnection


+(void)startConnectionWithDict:(NSMutableDictionary *)dict andURL:(NSString *)str andNoti:(NSString *)currNoti AndImageKey:(NSString *)imageKey
{
    
    NSURL *url = [NSURL URLWithString:str];
    NSLog(@"--- URL --- %@",url);
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.currentNotifition = currNoti;
    NSArray *listKey = [dict allKeys];
    
    NSLog(@"json : %@",[dict JSONRepresentation]);

    BOOL isSendData = NO;
    for (NSString *key in listKey) {
        if (imageKey && !isSendData) {
            // Post image
            [request setData:[dict objectForKey:key] forKey:key];
            isSendData = YES;
        }
        else {
            // post text
            [request setPostValue:[dict objectForKey:key] forKey:key];       
        }
        
    }
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request setDidFinishSelector:@selector(requestFinished:)];
    [request setDidFailSelector:@selector(requestFailed)];
    [request setDelegate:self];
    [request startAsynchronous];
}
+(void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    ASIFormDataRequest *rqForm = (ASIFormDataRequest *)request;
    NSString *responseString = [rqForm responseString];
    NSLog(@"respose : %@",responseString);
    
    NSLog(@"current notifi : %@",rqForm.currentNotifition);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:rqForm.currentNotifition object:responseString];
}
+(void)requestFailed:(ASIHTTPRequest *)request
{
    ASIFormDataRequest *rqForm = (ASIFormDataRequest *)request;
    [[NSNotificationCenter defaultCenter] postNotificationName:rqForm.currentNotifition object:nil];
    
//    NSError *error = [request error];
}
#pragma mark - GET Method

#pragma mark -
@end
