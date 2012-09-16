//
//  Utilities.m
//  CoNAV
//
//  Created by William (Van Thuong) on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Utilities.h"
//#import "JSON.h"
//#import "Content.h"
//#import "Constants.h"
//#import "Utilities.h"

@implementation Utilities

#pragma mark- Parse data
+(BOOL)parseSignResult:(NSString*)result
{
    NSDictionary *dict = nil;// [result JSONValue];
    return [[dict objectForKey:RESULT_KEY] boolValue];
}
+(BOOL)isValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

#pragma mark- Show Alertview
+(void)showAlertViewWithTitle:(NSString*)title message:(NSString*)message delegate:(id)delegate cancel:(NSString*)cancel others:(NSString*)others,...NS_REQUIRES_NIL_TERMINATION
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:delegate
                                              cancelButtonTitle:cancel
                                              otherButtonTitles:others, nil];
    [alertView show];

}

+ (UIImage*)newImageFromBundleWithName:(NSString*)name
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:filePath];
    if(image)
        return image;
    return nil;
    
}
+ (UIImage*)newImageFromDocument:(NSString*)imageName
{
    
    if([self fileIsExistedInDocumentWithName:imageName]){
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:imageName];
        
        return [[UIImage alloc] initWithContentsOfFile:fullPath];
        
    }
    
    return nil;
	
}
+(BOOL)fileIsExistedInDocumentWithName:(NSString*)fileName
{
    NSArray *paths					= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory	= [paths objectAtIndex:0];	
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	NSString *dataPath	= [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", fileName]];
    
    if([fileManager fileExistsAtPath:dataPath])
    {
        return YES;
    }
    
    return NO;
}
+ (UIColor *)colorWithInt:(int)value {
	
	int r,b,g;
	b = value &	  0x0000FF;
	g = ((value & 0x00FF00) >> 8);
	r = ((value & 0xFF0000) >> 16);
	UIColor *color		= [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f];
	return color;
	
}

+(NSString*)stringDateFromDate:(NSDate*)date withFormat:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    
    return [formatter stringFromDate:date];
}
+(void)saveImage:(UIImage*)image:(NSString*)imageName 
{
    NSData *imageData = UIImagePNGRepresentation(image); //convert image into .png format.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);     
    NSString *documentsDirectory = [paths objectAtIndex:0]; 
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", imageName]]; 
    
    [fileManager createFileAtPath:fullPath contents:imageData attributes:nil]; //finally save the path (image)
    
    NSLog(@"image saved");
    
}

//removing an image

- (void)removeImage:(NSString*)fileName {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", fileName]];
    
    [fileManager removeItemAtPath: fullPath error:NULL];
    
    NSLog(@"image removed");
    
}



+ (CGSize)sizeFromText:(NSString *)text font:(UIFont *)font width:(float)width height:(float)height
{
	
	CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(width ,height) 
					   lineBreakMode:UILineBreakModeCharacterWrap|UILineBreakModeWordWrap|UILineBreakModeClip|UILineBreakModeTailTruncation];
	
	return size;
	
}
#pragma mark - PARSER

+(NSString *)stringFromDateStr:(NSString *)str
{
    NSTimeInterval _interval=[str doubleValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSLog(@"a : %@", date);

    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *st = [dateFormat stringFromDate:date];   
    
    NSLog(@"%@",st);
    //    [dtF release];

    return st;
    
}
+(NSString *)stringFromDateDiff:(NSDate *)origDate {
    
//    Thu, 21 May 09 19:10:09 -0700
    
    NSDate *todayDate = [NSDate date];
    double ti = [origDate timeIntervalSinceDate:todayDate];
    NSLog(@"%f", ti);
    ti = ti * -1;
    if(ti < 1) {
        return @"mới tức thì";
    } else if (ti < 60) {
        int diff = round(ti);
        return [NSString stringWithFormat:@"%d giây trước", diff];
    } else if (ti < 3600) {
        int diff = round(ti / 60);
        return [NSString stringWithFormat:@"%d phút trước", diff];
    } else if (ti < 86400) {
        int diff = round(ti / 60 / 60);
        return[NSString stringWithFormat:@"%d giờ trước", diff];
    } else if (ti < 604800) {
        int diff = round(ti / 60 / 60 / 24);
        return[NSString stringWithFormat:@"%d ngày trước", diff];
    } else if (ti < 2419200) {
        int diff = round(ti / 7 / 60 / 60 / 24);
        return[NSString stringWithFormat:@"%d tuần trước", diff];
    } else {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd-MM-yyyy"];
        return [dateFormat stringFromDate:origDate];
    }   
}
#pragma mark - NSUSERDEFAULT
+(float )getLastUpdateByCateTypeTime:(NSString *)cateTypeTime
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString *oldDate = [defaults objectForKey:cateTypeTime];
    [defaults synchronize]; 
    return [oldDate doubleValue];
}
+(void)saveLastUpdateForCateTypeTime:(NSString *)cateTypeTime
{
    NSDate *currentDate = [NSDate date];
    NSTimeInterval value = [currentDate timeIntervalSince1970];
    NSString *strCurrentDate = [NSString stringWithFormat:@"%.0f",value * 1000];
    
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:strCurrentDate forKey:cateTypeTime];
    
    NSString *dateTime = [defaults objectForKey:cateTypeTime];
    NSLog(@"dateTime new LAST ----- : %@",dateTime);
    
    [defaults synchronize]; 
    
}
#pragma mark - Show/Hidden UITabbarviewcontroller
+ (void)hideTabBar:(UITabBarController *) tabbarcontroller AnimationTime:(float)animationTime
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationTime];
    
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, 480, view.frame.size.width, view.frame.size.height)];
        } 
        else 
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480)];
        }
    }
    
    [UIView commitAnimations];   
}

+ (void)showTabBar:(UITabBarController *) tabbarcontroller AnimationTime:(float)animationTime
{       
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationTime];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        NSLog(@"%@", view);
        
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, 431, view.frame.size.width, view.frame.size.height)];
            
        } 
        else 
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 431)];
        }
    }
    
    [UIView commitAnimations]; 
}
#pragma mark -
@end
