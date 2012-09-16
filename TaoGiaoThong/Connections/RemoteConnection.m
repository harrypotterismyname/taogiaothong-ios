//
//  RemoteConnection.m
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 9/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RemoteConnection.h"
#import "GetDataConnection.h"
#import "Constants.h"

static RemoteConnection *remoteConnection;
@implementation RemoteConnection
+(id)shareManager
{
    @synchronized(self){
        if (remoteConnection == nil) {
            remoteConnection = [[RemoteConnection alloc] init];
        }
    }
    return remoteConnection;
}
-(void)startLoginWithURL:(NSString *)strURL
{
    GetDataConnection *getDataConn = [[GetDataConnection alloc] initWithDelegate:self completeCallBackSelecter:@selector(loginSuccess:) FailCallBackSelecter:@selector(loginFail:)];
    [getDataConn startLoginWithURL:strURL];
}
-(void)loginSuccess:(id)sender
{
    GetDataConnection *conn = (GetDataConnection *)sender;
    NSString *result = [[NSString alloc] initWithData:conn.downloadedData encoding:NSUTF8StringEncoding];
    [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_NOTIFICATION object:result];
    conn = nil;
    
}
-(void)loginFail:(id)sender
{
    GetDataConnection *conn = (GetDataConnection *)sender;
    conn = nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_NOTIFICATION object:nil];
}
@end
