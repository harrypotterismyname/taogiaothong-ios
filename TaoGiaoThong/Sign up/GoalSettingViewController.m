//
//  GoalSettingViewController.m
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoalSettingViewController.h"
#import "ASIConnection.h"
#import "Constants.h"
#import "UICustomSwitch.h"
#define DEFAUL_INDEX 100
#define TITLE_LOSE3 @"Lose 3 lbs (1.36kg)"
#define TITLE_LOSE2 @"Lose 2 lbs (0.9kg)"
#define TITLE_LOSE1 @"Lose 1 lbs (0.45kg)"
#define TITLE_CURRENT_WEIGHT @"Maintain current weight"
#define TITLE_GAIN05 @"Gain 0.5 lbs (0.23kg)"
#define TITLE_GAIN1 @"Gain 1 lbs (0.45kg)"

@interface GoalSettingViewController ()

@end

@implementation GoalSettingViewController
@synthesize strKey;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden = YES;

    [self setDataDefault];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)setDataDefault
{
    newIndex = DEFAUL_INDEX;
    txtGoalWeight.text = @"64";
    txtCurrentWeight.text = @"68";
    customSwitch = [[UICustomSwitch alloc] initWithFrame:CGRectMake(220, 67, 100, 100) andLeftText:@"kg" AndRightText:@"lbs"];
    [self.view addSubview:customSwitch];
}

-(void)createNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePostGoalSetting:) name:GOAL_SETTING_NOTIFICATION object:nil];
}
-(void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:GOAL_SETTING_NOTIFICATION object:nil];
}

-(BOOL)isCorrectInfor
{
    NSString *message = nil;
    if(txtCurrentWeight.text == nil || [txtCurrentWeight.text isEqualToString:@""] || [txtCurrentWeight.text length] == 0){
        message = @"Please input current weight";
    }
    else if(txtGoalWeight.text == nil || [txtGoalWeight.text isEqualToString:@""] || [txtGoalWeight.text length] == 0){
        message = @"Please input goal weight";
    }
    else if (newIndex == DEFAUL_INDEX) {
        message = @"Please select weekly goal!";
    }

    if (message) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning !"
                                                        message:message
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }

    return YES;
}

-(void)resetTitleOfWeeklyGoalButtons:(int )index
{
    // tag of component from 4 to 9
    for (int i = 4; i < 10; i++) {
        UILabel *lblSelected = (UILabel *)[self.view viewWithTag:i + 10];
        CGRect frame = lblSelected.frame;
        frame.origin.x = 150;
        lblSelected.frame = frame;
        
        UIImageView *imvChecked = (UIImageView *)[self.view viewWithTag:i + 20];
        [imvChecked setHidden:YES];
    }
}
#pragma mark - HANDLE POST GOALSETTING NOTIFICATION 
-(void)handlePostGoalSetting:(NSNotification *)notification
{
    [self removeNotification];
    NSString *result = [notification object];
    NSLog(@"result post goal setting; %@",result);
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - IBAction
-(IBAction)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)doneBtnClicked:(id)sender
{

    if ([self isCorrectInfor]) {
        [self createNotification];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        NSString *url = [NSString stringWithFormat:@"http://TaoGiaoThong.com/goalsettingsave.json?api_key=%@",self.strKey];
        [dict setObject:@"kg" forKey:@"user[measurement_unit]"];
        [dict setObject:[NSNumber numberWithInt:[txtGoalWeight.text intValue]] forKey:@"user[goal]"];
        [dict setObject:[NSNumber numberWithInt:[txtCurrentWeight.text intValue]] forKey:@"user[current_weight]"];
        [dict setObject:[NSNumber numberWithInt:newIndex - 6] forKey:@"user[weeklygoal]"];
        if (customSwitch.isOn) {
            [dict setObject:@"kg" forKey:@"user[measurement_unit]"];
        }
        else {
            [dict setObject:@"lbs" forKey:@"user[measurement_unit]"];
        }
        [ASIConnection startConnectionWithDict:dict andURL:url andNoti:GOAL_SETTING_NOTIFICATION AndImageKey:nil];
    }
}
-(IBAction)weeklyGoalBtnClicked:(id)sender
{
    UIButton *btnSelected = (UIButton *)sender;
    newIndex = btnSelected.tag;
    NSLog(@"button tag selected : %d",newIndex);
    if (newIndex == oldIndex) {
        newIndex = DEFAUL_INDEX;
        oldIndex = 0;
        [self resetTitleOfWeeklyGoalButtons:newIndex];
        return;
    }
    [self resetTitleOfWeeklyGoalButtons:newIndex];
    UILabel *lblSelected = (UILabel *)[self.view viewWithTag:newIndex + 10];
    CGRect frame = lblSelected.frame;
    frame.origin.x = 150 + 12;
    lblSelected.frame = frame;
    
    UIImageView *imvChecked = (UIImageView *)[self.view viewWithTag:newIndex + 20];
    [imvChecked setHidden:NO];

    oldIndex = newIndex;
}
#pragma mark - uitextfeild delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
//    [self setVisibleTextFeildBackground];
    return YES;
}
#pragma mark - end
@end
