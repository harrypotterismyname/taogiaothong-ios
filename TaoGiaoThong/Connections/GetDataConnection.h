//
//  GetDataConnection.h
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 9/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseConnection.h"

@interface GetDataConnection : BaseConnection
{
    id delegate;
    SEL completeCallBackSelecter;
    SEL failCallBackSelecter;
}
-(id)initWithDelegate:(id)aDelegate completeCallBackSelecter:(SEL )completeCallBack FailCallBackSelecter:(SEL)failCallBack;
-(void)startLoginWithURL:(NSString *)strUrl;
@end
