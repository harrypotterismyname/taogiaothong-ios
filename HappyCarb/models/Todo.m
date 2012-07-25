//
//  Todo.m
//  HappyCarb
//
//  Created by Hong on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Todo.h"
#import "SBJson.h"

@implementation Todo
@synthesize todo_id,name,type,user_id;


//http://stackoverflow.com/questions/7140473/json-parsing-returns-null-to-ios-json-string-looks-correct
- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        self.name      = [dictionary valueForKey:@"name"];
        self.todo_id    = [[dictionary valueForKey:@"id"] intValue];
        self.user_id    = [[dictionary valueForKey:@"user_id"] intValue];
        self.type          = [dictionary valueForKey:@"todo_type"];
        //self.createdAt = [dictionary valueForKey:@"created_at"];
        //self.updatedAt = [dictionary valueForKey:@"updated_at"];
    }
    return self;
}


//http://stackoverflow.com/questions/7140473/json-parsing-returns-null-to-ios-json-string-looks-correct

+ (NSArray *)findAllRemote {
    
    NSString *api_key =  [[NSUserDefaults standardUserDefaults] valueForKey:@"api_key" ];
    NSString *todo_url = [NSString stringWithFormat:@"http://happycarb.com/todos.json?api_key=%@", api_key];
    
    
    
    NSURL *url = [NSURL URLWithString: todo_url];
    
    
    
    
    
    
   
    NSError *error = nil;
    NSString *jsonString = 
    [NSString stringWithContentsOfURL:url 
                             encoding:NSUTF8StringEncoding 
                                error:&error];
    
    NSLog(@"my string = %@",  jsonString);
    
    NSMutableArray *todos = [NSMutableArray array];
    if (jsonString) {
       SBJsonParser *json = [[SBJsonParser alloc] init];    
        NSArray *results = [json objectWithString:jsonString error:&error];
        
       
        
        
        for (NSDictionary *dictionary in results) {
            Todo *todo = [[Todo alloc] initWithDictionary:dictionary];
            [todos addObject:todo];
         
        }
    }
    return todos;    
}
@end
