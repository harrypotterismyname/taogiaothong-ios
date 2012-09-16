//
//  Thing.h
//  TaoGiaoThong
//
//  Created by Hong on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Thing : NSObject

{
    NSInteger thing_id;
    NSInteger upvote;
    NSInteger downvote;
    NSData *photo;
    NSString *note;
//    NSString *type;
    NSDate *created_at;
    NSInteger user_id;
    NSString *photo_url;
    User *user;
    
    BOOL isPrivate;
    BOOL isShareFb;
    NSString *tags;
    
}
@property BOOL isPrivate;
@property BOOL isShareFb;

@property(nonatomic) NSInteger thing_id;
@property (nonatomic) NSInteger upvote;
@property (nonatomic) NSInteger  downvote;
@property (nonatomic, retain) NSData *photo;
@property (nonatomic, retain) NSString *note;

//@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSDate *created_at;
@property (nonatomic) NSInteger user_id;
@property (nonatomic, retain) NSString *photo_url;
@property   (nonatomic,retain) User *user;
@property (nonatomic ,retain) NSString *tags;

- (id)initWithDictionary:(NSDictionary *)dictionary ;
+ (NSArray *)findAllRemote: (NSInteger) page ;
-(NSString *)jSonString;
-(void)postPhoto;
@end
