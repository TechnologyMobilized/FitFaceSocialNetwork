//
//  MeetNowNotifView.h
//  fitface
//
//  Created by LLDM 0037 on 4/8/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "iCarousel.h"

@protocol MeetNowNotifViewDelegate <iCarouselDataSource, iCarouselDelegate, UIScrollViewDelegate>

-(IBAction)onMessageButtonTap:(id)sender;
-(IBAction)onDeleteButtonTap:(id)sender;

@end

@interface MeetNowNotifView : BaseView

@property (nonatomic, weak)id <MeetNowNotifViewDelegate> meetNowNotifDelegate;
@property (nonatomic, strong) iCarousel *carousel;
@end
