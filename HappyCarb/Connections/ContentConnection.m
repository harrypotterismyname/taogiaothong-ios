//
//  ContentConnection.m
//  xMen
//
//  Created by Paul (Chi Kien) on 6/26/12.
//  Copyright (c) 2012 AMAS HUB. All rights reserved.
//

#import "ContentConnection.h"
#import "Constants.h"


@implementation ContentConnection
@synthesize connectionKey;
@synthesize contentTabKey;

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
//-(void)getContentWithType:(NSString *)type AndLastUpdate:(double )lastUp
//{
//    NSString *url;
//    if (lastUp == 0) {
//        url = [[NSString alloc] initWithFormat:@"%@%@",CONTENT_URL,type];
//    }
//    else {
//        url = [[NSString alloc] initWithFormat:@"%@%@/%.0f",CONTENT_URL,type,lastUp];
//    }
//    
//    NSLog(@"URL to get content with type :%@ ",url);
//    [super startRequestWithURL:url
//                    httpMethod:@"GET"
//                      httpBody:nil
//                   contentType:@"application/json; charset=utf-8"
//                     actionURI:nil
//                       timeOut:CONNECTION_TIMEOUT
//                      delegate:delegate
//             completedCallback:completedCallbackSelector
//        authenticationCallback:nil
//                failedCallback:failedCalbackSelector
//                      username:nil
//                      password:nil];
////    [url release];
//}
//-(void)getImageWithURL:(NSString *)url
//{
//
//    url = [url stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    NSLog(@"url get image : %@",url);
//    [super startRequestWithURL:url
//                    httpMethod:@"GET"
//                      httpBody:nil
//                   contentType:@"application/json; charset=utf-8"
//                     actionURI:nil
//                       timeOut:CONNECTION_TIMEOUT * 1.5
//                      delegate:delegate
//             completedCallback:completedCallbackSelector
//        authenticationCallback:nil
//                failedCallback:failedCalbackSelector
//                      username:nil
//                      password:nil];
//}
//-(void)getContentDetailWithCateID:(int )cateID
//{
//    NSString *url = [[NSString alloc] initWithFormat:@"%@%d/280",CONTENT_DETAIL_URL,cateID];
//    NSLog(@"url get cate dail : %@",url);
//    [super startRequestWithURL:url
//                    httpMethod:@"GET"
//                      httpBody:nil
//                   contentType:@"application/json; charset=utf-8"
//                     actionURI:nil
//                       timeOut:CONNECTION_TIMEOUT
//                      delegate:delegate
//             completedCallback:completedCallbackSelector
//        authenticationCallback:nil
//                failedCallback:failedCalbackSelector
//                      username:nil
//                      password:nil];
////    [url release];
//}
//-(void)likeContentDetailWithCateID:(int )cateID
//{
//    NSString *url = [[NSString alloc] initWithFormat:@"%@%d",LIKE_CONTENT_URL,cateID];
//    NSLog(@"url get cate dail : %@",url);
//    [super startRequestWithURL:url
//                    httpMethod:@"GET"
//                      httpBody:nil
//                   contentType:@"application/json; charset=utf-8"
//                     actionURI:nil
//                       timeOut:CONNECTION_TIMEOUT
//                      delegate:delegate
//             completedCallback:completedCallbackSelector
//        authenticationCallback:nil
//                failedCallback:failedCalbackSelector
//                      username:nil
//                      password:nil];
////    [url release];
//}
//-(void)sendEmail:(NSString *)emailAdd
//{
//    NSString *url = [[NSString alloc] initWithFormat:@"%@%@",SEND_EMAIL_URL,emailAdd];
//    NSLog(@"url send email : %@",url);
//    [super startRequestWithURL:url
//                    httpMethod:@"GET"
//                      httpBody:nil
//                   contentType:@"application/json; charset=utf-8"
//                     actionURI:nil
//                       timeOut:CONNECTION_TIMEOUT
//                      delegate:delegate
//             completedCallback:completedCallbackSelector
//        authenticationCallback:nil
//                failedCallback:failedCalbackSelector
//                      username:nil
//                      password:nil];
////    [url release];
//}
@end
