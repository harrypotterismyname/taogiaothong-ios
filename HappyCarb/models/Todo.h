//
//  Todo.h
//  HappyCarb
//
//  Created by Hong on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject


{
    NSInteger todo_id;

    NSString *name;
    NSString *type;


    NSInteger user_id;
    
    
}
@property (nonatomic) NSInteger todo_id;


@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *type;
@property (nonatomic) NSInteger user_id;
- (id)initWithDictionary:(NSDictionary *)dictionary ;
+ (NSArray *)findAllRemote ;


@end
