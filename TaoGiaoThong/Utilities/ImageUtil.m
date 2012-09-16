//
//  ImageUtil.m
//  TaoGiaoThong
//
//  Created by Hong on 7/29/12.
//
//

#import "ImageUtil.h"

@implementation ImageUtil


//http://stackoverflow.com/questions/603907/uiimage-resize-then-crop

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
