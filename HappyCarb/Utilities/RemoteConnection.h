//
//  RemoteConnection.h
//  xMen
//
//  Created by Paul (Chi Kien) on 6/25/12.
//  Copyright (c) 2012 AMAS HUB. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@interface RemoteConnection : NSObject
{
    NSMutableDictionary *connDict;
}
@property (nonatomic, retain) NSMutableDictionary *connDict;
+(id)sharedManager;
-(void)signUpWithUser:(User *)user;
@end
