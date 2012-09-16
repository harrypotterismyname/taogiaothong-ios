//
//  User.h
//  TaoGiaoThong
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
    NSUInteger user_id;
    NSString *email;
    NSString *country;
        NSString *avatar_url;
}
@property (nonatomic, retain) NSString *username;
@property (nonatomic) NSUInteger user_id;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *api_key;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *country;
@property (nonatomic, retain) NSString *avatar_url;

- (id)initWithDictionary:(NSDictionary *)dictionary;
-(void)login;
- (NSString *)findApi_key;
@end
