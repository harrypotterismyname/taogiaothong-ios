//
//  SqlManager.m
//  ISpied
//
//  Created by Kien NC on 2/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SqlManager.h"

@implementation SqlManager


- (void) copyDatabaseIfNeededWithDBName:(NSString *)dbName{	
	//Using NSFileManager we can perform many file system operations.
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSString *dbPath = [self getDBPathWithDBName:dbName];
	BOOL success = [fileManager fileExistsAtPath:dbPath]; 
	
	if(!success) {		
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:dbName];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];		
		if (!success) 
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
	}	
}



- (NSString *) getDBPathWithDBName:(NSString *)dbName{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
	return [documentsDir stringByAppendingPathComponent:dbName];
}



@end
