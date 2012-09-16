//
//  PhotoUploadPrepareViewController.h
//  TaoGiaoThong
//
//  Created by Hong on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICustomSwitch.h"
//#import "MBProgressHUD.h"

@class  AppDelegate;

@interface PhotoUploadPrepareViewController : UIViewController<UITextFieldDelegate>
{
    UICustomSwitch *customSwitchPrivate;
    UICustomSwitch *customSwitchFb;
    IBOutlet UITextField *txtCaptions;
    IBOutlet UITextField *txtTags;
    AppDelegate *appDelegate;
    UIImage *photoSelected;
    //MBProgressHUD *indicator;
}
@property (nonatomic, retain) UIImage *photoSelected;
@end
