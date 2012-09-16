//
//  ASIConnection.h
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASIConnection : NSObject

+(void)startConnectionWithDict:(NSMutableDictionary *)dict andURL:(NSString *)str andNoti:(NSString *)currNoti AndImageKey:(NSString *)imageKey;

@end
