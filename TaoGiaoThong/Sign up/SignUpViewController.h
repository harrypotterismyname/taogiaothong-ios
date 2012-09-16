//
//  SignUpViewController.h
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MBProgressHUD.h"

@interface SignUpViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtUseName;
    IBOutlet UITextField *txtPass;
    IBOutlet UITextField *txtPhone;
    IBOutlet UIButton *btnAvatar;
    UIImage *avatarSelected;
//    MBProgressHUD *indicatorMB;
}
@end
