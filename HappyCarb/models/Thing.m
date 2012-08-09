//
//  Thing.m
//  HappyCarb
//
//  Created by Hong on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Thing.h"
#import "SBJson.h"
#import "User.h"

@implementation Thing

@synthesize upvote,downvote,photo,note,created_at, user_id, photo_url, user;



//http://stackoverflow.com/questions/7140473/json-parsing-returns-null-to-ios-json-string-looks-correct
- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        self.thing_id      = [[dictionary valueForKey:@"id"] intValue];
        self.upvote    = [[dictionary valueForKey:@"upvote"] intValue];
        self.downvote    = [[dictionary valueForKey:@"dowvote"] intValue];
        self.user_id    = [[dictionary valueForKey:@"user_id"] intValue];
        self.note         = [dictionary valueForKey:@"note"];
        self.photo_url         = [dictionary valueForKey:@"photo_url"];

        self.created_at = [dictionary valueForKey:@"created_at"];
        
        
        if ([dictionary valueForKey:@"user"] != nil)
        {
            self.user = [[User alloc] initWithDictionary: [dictionary valueForKey:@"user"]];
        }
        
        //self.updatedAt = [dictionary valueForKey:@"updated_at"];
    }
    return self;
}



- (Thing *) save
{
    if (self.thing_id == nil)
    {
        //create
    }
    else
    {
        //save
    }
    
}




//http://stackoverflow.com/questions/7140473/json-parsing-returns-null-to-ios-json-string-looks-correct

+ (NSArray *)findAllRemote: (NSInteger) page {
    
    NSString *api_key =  [[NSUserDefaults standardUserDefaults] valueForKey:@"api_key" ];
    NSString *things_url = [NSString stringWithFormat:@"http://happycarb.com/things.json?api_key=%@&page=%i", api_key, page ];
    
    
    
    NSURL *url = [NSURL URLWithString: things_url];
    
    
    

    
    
    NSError *error = nil;
    NSString *jsonString =
    [NSString stringWithContentsOfURL:url
                             encoding:NSUTF8StringEncoding
                                error:&error];
    
    NSLog(@"my string = %@",  jsonString);
    
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

@end
