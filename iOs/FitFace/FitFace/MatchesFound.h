//
//  MatchesFound.h
//  fitface
//
//  Created by LLDM 0037 on 4/7/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "iCarousel.h"

@protocol MatchesFoundViewDelegate <iCarouselDataSource, iCarouselDelegate, UIScrollViewDelegate>

-(IBAction)onMessageButtonTap:(id)sender;
-(IBAction)onMeetNowButtonTap:(id)sender;
-(IBAction)onNotMatchButtonTap:(id)sender;

@end

@interface MatchesFound : BaseView

@property (nonatomic, weak) id <MatchesFoundViewDelegate> matchesDelegate;
@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, strong) UIImageView *animatedView;

@end
