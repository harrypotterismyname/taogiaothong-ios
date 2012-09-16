//
//  GetDataConnection.m
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 9/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GetDataConnection.h"
#import "Constants.h"

@implementation GetDataConnection
-(id)initWithDelegate:(id)aDelegate completeCallBackSelecter:(SEL )completeCallBack FailCallBackSelecter:(SEL)failCallBack
{
    if (self = [super init]) {
        delegate = aDelegate;
        completeCallBackSelecter = completeCallBack;
        failCallBackSelecter = failCallBack;
    }
    return self;
}
-(void)startLoginWithURL:(NSString *)strUrl
{
    [super startRequestWithURL:strUrl
                    httpMethod:@"GET" 
                      httpBody:nil 
                   contentType:@"application/json; charset=utf-8"
                     actionURI:nil 
                       timeOut:CONNECTION_TIMEOUT 
                      delegate:delegate 
             completedCallback:completeCallBackSelecter 
        authenticationCallback:nil
                failedCallback:failCallBackSelecter 
                      username:nil 
                      password:nil];
}
@end
