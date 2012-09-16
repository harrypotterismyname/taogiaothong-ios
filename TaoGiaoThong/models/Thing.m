//
//  Thing.m
//  TaoGiaoThong
//
//  Created by Hong on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Thing.h"
#import "SBJson.h"
#import "User.h"
#import "ASIConnection.h"
#import "Constants.h"
#import "HappyConstant.h"
#import "ImageUtil.h"



#define URL_POST_IMAGE @"http://taogiaothong.net/things.json?api_key="

@implementation Thing

@synthesize tags;
@synthesize upvote,downvote,photo,note,created_at, user_id, photo_url, user,thing_id,isShareFb,isPrivate;



//http://stackoverflow.com/questions/7140473/json-parsing-returns-null-to-ios-json-string-looks-correct
- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        NSString *strThingID = [dictionary valueForKey:@"id"];        
        self.thing_id = [strThingID == nil ? @"1" : strThingID intValue];
            
        NSString *strVote = [dictionary valueForKey:@"upvote"];        
        self.upvote = [strVote == nil ? @"1" : strVote intValue];

        NSString *strDownVote = [dictionary valueForKey:@"dowvote"];        
        self.downvote = [strDownVote == nil ? @"1" : strDownVote intValue];
        
        NSString *strUserID = [dictionary valueForKey:@"user_id"]; 
        NSLog(@"%@",strUserID);
        if (strUserID != (id)[NSNull null]) {
            self.user_id = [strUserID intValue];
        }else {
            self.user_id = 1;
        }
        
        self.note         = [dictionary valueForKey:@"note"];
        self.photo_url         = [dictionary valueForKey:@"photo_url"];

        self.created_at = [dictionary valueForKey:@"created_at"];
        
        
        if ([dictionary valueForKey:@"user"] != NULL)
        {
            self.user = [[User alloc] initWithDictionary: [dictionary valueForKey:@"user"]];
        }
        
        //self.updatedAt = [dictionary valueForKey:@"updated_at"];
    }
    return self;
}


//http://stackoverflow.com/questions/7140473/json-parsing-returns-null-to-ios-json-string-looks-correct




+ (NSArray *)findAllRemote: (NSInteger) page {
    
    NSString *api_key =  [[NSUserDefaults standardUserDefaults] valueForKey:API_KEY ];
    
    
    NSString *things_url = [NSString stringWithFormat:@"http://TaoGiaoThong.com/things.json?api_key=%@&page=%i", api_key, page ];
    
    NSLog (things_url);
    
    NSURL *url = [NSURL URLWithString: things_url];
    NSError *error = nil;
    NSString *jsonString =
    [NSString stringWithContentsOfURL:url
                             encoding:NSUTF8StringEncoding
                                error:&error];
    
    NSLog(@"my string = %@",  jsonString);
    
  //  if ([jsonString isEqualToString: @"-1"])
    //{
    //    [self  logout];
    //}
        
    
    NSMutableArray *things = [NSMutableArray array];
    if (jsonString) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        NSArray *results = [json objectWithString:jsonString error:&error];
        
        for (NSDictionary *dictionary in results) {
            Thing *thing = [[Thing alloc] initWithDictionary:dictionary];
            [things addObject:thing];
            
        }
    }
    return things;
}
-(NSString *)jSonString
{
    NSArray *keys = [NSArray arrayWithObjects:@"thing[note]", @"thing[photo]", @"thing[user_id]", @"thing[is_private]", @"thing[share_to_facebook]",nil];
    NSArray *values = [NSArray arrayWithObjects:
                       self.note,
                       self.photo,
                       [NSNumber numberWithInt:self.user_id],
                       [NSNumber numberWithBool:self.isPrivate],
                       [NSNumber numberWithBool:self.isShareFb],
                       nil];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjects:values forKeys:keys];
    return [dict JSONRepresentation];
}
-(NSMutableDictionary *)getDict
{
    
  //  NSData *dataForJPEGFile = UIImageJPEGRepresentation( self.photo, 0.6);
    //quick hack
//    self.photo =

    
    NSArray *keys = [NSArray arrayWithObjects:@"thing[note]",@"thing[photo]", @"thing[is_private]", @"thing[share_to_facebook]",@"tags",nil];
    NSArray *values = [NSArray arrayWithObjects:
                       self.note,
                       self.photo,
                       [NSNumber numberWithBool:self.isPrivate],
                       [NSNumber numberWithBool:self.isShareFb],
                       self.tags,
                       nil];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjects:values forKeys:keys];
    return dict;
}
-(void)postPhoto
{
    
    NSString *api_key = self.user.api_key;
    if (api_key == (id)[NSNull null] || api_key.length == 0 )
    {
        api_key = @"something";
    }
    
    
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",URL_POST_IMAGE,api_key];
    [ASIConnection startConnectionWithDict:[self getDict] andURL:strUrl andNoti:NOTIFICATION_POST_PHOTO AndImageKey:@"thing[photo]"];
}

@end
