//
//  User.m
//  HappyCarb
//
//  Created by Hong on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "User.h"
#import "SBJson.h"

@implementation User

@synthesize username;
@synthesize password;
@synthesize api_key;


- (id) initWithDictionary:(NSDictionary *)dictionary    
{
    if (self = [super init]) {
        self.username      = [dictionary valueForKey:@"username"];
        self.password    = [dictionary valueForKey:@"password"];
        self.api_key    = [dictionary valueForKey:@"api_key"];
    }
    return self;
}

- (NSString *)findApi_key
{
    NSString *login_url = [NSString stringWithFormat:@"http://happycarb.com/login.json?user_session[username]=%@&user_session[password]=%@", self.username, self.password];
    NSURL *url = [NSURL URLWithString: login_url];
    
    NSError *error = nil;
    
    NSString *jsonString =
    [NSString stringWithContentsOfURL:url
                             encoding:NSUTF8StringEncoding
                                error:&error];
    

    
    
    if (jsonString) {
        SBJsonParser *json = [[SBJsonParser alloc] init];   
        NSArray *results = [json objectWithString:jsonString error:&error];
      
        
        for (NSDictionary *dictionary in results) {

            
            self.api_key = [dictionary valueForKey:@"api_key"];
          
      
        }
    }
    return self.api_key;  
}

@end
