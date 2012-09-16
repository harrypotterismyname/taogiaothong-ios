//
//  GoalSettingViewController.h
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UICustomSwitch;

@interface GoalSettingViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIButton *btnLose3;
    IBOutlet UIButton *btnLose2;
    IBOutlet UIButton *btnLose1;
    IBOutlet UIButton *btnCurrentWeight;
    IBOutlet UIButton *btnGain05;
    IBOutlet UIButton *btnGain1;
    IBOutlet UITextField *txtCurrentWeight;
    IBOutlet UITextField *txtGoalWeight;
    int newIndex;
    int oldIndex;
    NSString *strKey;
    UICustomSwitch *customSwitch;
}
@property(nonatomic, retain) NSString *strKey;
@end
