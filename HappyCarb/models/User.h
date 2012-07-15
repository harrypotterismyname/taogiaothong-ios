//
//  User.h
//  HappyCarb
//
//  Created by Hong on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
{
    NSString *username;
    NSString *password;
    NSString *api_key;
    
    
}

@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *api_key;


- (id)initWithDictionary:(NSDictionary *)dictionary;



- (NSString *)findApi_key;



@end
