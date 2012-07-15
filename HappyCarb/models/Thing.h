//
//  Thing.h
//  HappyCarb
//
//  Created by Hong on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Thing : NSObject

{
    NSInteger *upvote;
    NSInteger *downvote;
    NSData *photo;
    NSString *note;
    NSString *type;
    NSDate *created_at;
    NSInteger *user_id;
    
    
}
@property (nonatomic) NSInteger *upvote;
@property (nonatomic) NSInteger *downvote;
@property (nonatomic, retain) NSData *photo;
@property (nonatomic, retain) NSString *note;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSDate *created_at;
@property (nonatomic) NSInteger *user_id;

@end
