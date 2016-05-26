//
//  MeetNowNotifView.m
//  fitface
//
//  Created by LLDM 0037 on 4/8/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "MeetNowNotifView.h"

@implementation MeetNowNotifView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self addSubview:mainView];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:mainView.frame];
    [background setImage:[UIImage imageNamed:@"bg_photos"]];
    [mainView addSubview:background];
    
    self.carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 44, mainView.frame.size.width, 430)];
    self.carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.carousel.type = iCarouselTypeCoverFlow;
    self.carousel.delegate = self.meetNowNotifDelegate;
    self.carousel.dataSource = self.meetNowNotifDelegate;
    [self.carousel setPagingEnabled:YES];
    //    [self.carousel setDecelerationRate:0.7];
    [mainView addSubview:self.carousel];
    
    UIButton *messageButton = [[UIButton alloc]initWithFrame:CGRectMake(85, mainView.frame.size.height - 75, 60, 60)];
    [messageButton setImage:[UIImage imageNamed:@"bubble"] forState:UIControlStateNormal];
    [messageButton addTarget:self.meetNowNotifDelegate action:@selector(onMessageButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:messageButton];
    
    UIButton *closeButton = [[UIButton alloc]initWithFrame:CGRectMake(messageButton.frame.size.width + messageButton.frame.origin.x + 30, messageButton.frame.origin.y, 60, 60)];
    [closeButton setImage:[UIImage imageNamed:@"block"] forState:UIControlStateNormal];
    [closeButton addTarget:self.meetNowNotifDelegate action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:closeButton];
}



@end
