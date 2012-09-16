//
//  ResultGetPictureViewController.h
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface ResultGetPictureViewController : UIViewController
{
    UIImage *imageReceived;
    IBOutlet UIImageView *imvReceived;
}
@property (nonatomic, retain) UIImage *imageReceived;
@end
