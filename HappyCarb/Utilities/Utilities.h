//
//  Utilities.h
//  CoNAV
//
//  Created by William (Van Thuong) on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//Define data keys here
#define RESULT_KEY  @"result"
@class Content;

@interface Utilities : NSObject
{
    
}
+(BOOL)parseSignResult:(NSString*)result;
+(void)showAlertViewWithTitle:(NSString*)title message:(NSString*)message delegate:(id)delegate cancel:(NSString*)cancel others:(NSString*)others,...NS_REQUIRES_NIL_TERMINATION;
+ (UIImage*)newImageFromBundleWithName:(NSString*)name;
+ (UIColor *)colorWithInt:(int)value;

+(NSString*)stringDateFromDate:(NSDate*)date withFormat:(NSString*)format;
+(void)saveImage:(UIImage*)image:(NSString*)imageName ;
+ (UIImage*)newImageFromDocument:(NSString*)imageName;

+ (CGSize)sizeFromText:(NSString *)text font:(UIFont *)font width:(float)width height:(float)height;
// Parse
+(NSMutableArray *)parseListContentWith:(NSString *)json;
+(Content *)parseContentWith:(NSString *)json;
+(NSString *)stringFromDateStr:(NSString *)str;
+(NSString *)stringFromDateDiff:(NSString *)origDate;

#pragma mark - NSUSER DEFAULT
+(float )getLastUpdateByCateTypeTime:(NSString *)cateTypeTime;
+(void)saveLastUpdateForCateTypeTime:(NSString *)cateTypeTime;
+(void)saveLastUpdateForAllCateInAppRunFist;
+(NSString *)getLastDateKeyByCateType:(NSString *)cateType;
@end
