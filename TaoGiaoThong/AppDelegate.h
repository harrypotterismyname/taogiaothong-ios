//
//  AppDelegate.h
//  TaoGiaoThong
//
//  Created by Hong on 7/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MBProgressHUD.h"
@class User;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    User *currentUser;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic ,retain) User *currentUser;
@end
