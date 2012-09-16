//
//  RemoteConnection.h
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 9/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface RemoteConnection : NSObject

+(id)shareManager;
-(void)startLoginWithURL:(NSString *)strURL;
@end
