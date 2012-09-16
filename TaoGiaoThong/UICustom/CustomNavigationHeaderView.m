//
//  CustomNavigationHeaderView.m
//  TaoGiaoThong
//
//  Created by Paul (Chi Kien) on 9/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomNavigationHeaderView.h"

@implementation CustomNavigationHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
-(void)createComponents
{
    self.image = [UIImage imageNamed:@"bg-title.png"];
//    UIImage *imgRefresh = [UIImage imageNamed:@"btn-reload.png"];
//    UIButton *btnRefresh = [[UIButton alloc] initWithFrame:CGRectMake(260, 7, imgRefresh.size.width, imgRefresh.size.height)];
//    [btnRefresh setUserInteractionEnabled:YES];
//    [btnRefresh setImage:imgRefresh forState:UIControlStateNormal];
//    [btnRefresh addTarget:self action:@selector(btnRefreshClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:btnRefresh];

}
-(void)btnRefreshClicked:(id)sender
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
