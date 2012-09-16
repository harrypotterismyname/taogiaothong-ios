//
//  OverlayCaptureViewController.h
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OverlayCaptureViewDelegate;
@interface OverlayCaptureViewController : UIViewController
{
    id<OverlayCaptureViewDelegate> delegate;
}
@property(nonatomic, retain) id<OverlayCaptureViewDelegate> delegate;
@end
@protocol OverlayCaptureViewDelegate <NSObject>
-(void)overlayCaptureViewDelegateDidTappedCloseBtn;
-(void)overlayCaptureViewDelegateDidTappedTakeCameraBtn;
-(void)overlayCaptureViewDelegateDidTappedChoosePhotoLibBtn;
-(void)overlayCaptureViewDelegateDidTappedChangeCameraBtn;
@end