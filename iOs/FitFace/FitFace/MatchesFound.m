//
//  MatchesFound.m
//  fitface
//
//  Created by LLDM 0037 on 4/7/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "MatchesFound.h"

@implementation MatchesFound

-(void)setupLayout {
    UIView *mainView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self addSubview:mainView];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:mainView.frame];
    [background setImage:[UIImage imageNamed:@"bg_photos"]];
    [mainView addSubview:background];
    
    self.carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 44, mainView.frame.size.width, 414)];
    self.carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.carousel.type = iCarouselTypeCoverFlow;
    self.carousel.delegate = self.matchesDelegate;
    self.carousel.dataSource = self.matchesDelegate;
    [self.carousel setPagingEnabled:YES];
    [self.carousel setClipsToBounds:YES];
    [mainView addSubview:self.carousel];
    
    UIButton *messageButton = [[UIButton alloc]initWithFrame:CGRectMake(40, mainView.frame.size.height - 98, 60, 60)];
    [messageButton setImage:[UIImage imageNamed:@"bubble"] forState:UIControlStateNormal];
    [messageButton addTarget:self.matchesDelegate action:@selector(onMessageButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:messageButton];
    
    UIButton *meetNowButton = [[UIButton alloc]initWithFrame:CGRectMake(messageButton.frame.size.width + messageButton.frame.origin.x + 22, mainView.frame.size.height - 105, 72, 72)];
    [meetNowButton setImage:[UIImage imageNamed:@"meet"] forState:UIControlStateNormal];
    [meetNowButton addTarget:self.matchesDelegate action:@selector(onMeetNowButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:meetNowButton];
    
    UILabel *meetNowLabel = [[UILabel alloc]initWithFrame:CGRectMake(meetNowButton.frame.origin.x, meetNowButton.frame.size.height + meetNowButton.frame.origin.y, 72, 32)];
    [meetNowLabel setText:@"MEET NOW"];
    [meetNowLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
    [meetNowLabel setTextColor:[BaseView colorWithHexString:@"F7F9F9"]];
    [meetNowLabel setTextAlignment:NSTextAlignmentCenter];
    [mainView addSubview:meetNowLabel];
    
    UIButton *blockButton = [[UIButton alloc]initWithFrame:CGRectMake(meetNowButton.frame.size.width + meetNowButton.frame.origin.x + 24, messageButton.frame.origin.y, 60, 60)];
    [blockButton setImage:[UIImage imageNamed:@"block"] forState:UIControlStateNormal];
    [blockButton addTarget:self.matchesDelegate action:@selector(onNotMatchButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:blockButton];
    
    UILabel *matchLabel = [[UILabel alloc]initWithFrame:CGRectMake(meetNowLabel.frame.size.width + meetNowLabel.frame.origin.x + 16, meetNowLabel.frame.origin.y, 77, 32)];
    [matchLabel setText:@"DO NOT MATCH"];
    [matchLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
    [matchLabel setTextColor:[BaseView colorWithHexString:@"F7F9F9"]];
    [matchLabel setTextAlignment:NSTextAlignmentCenter];
    [mainView addSubview:matchLabel];
    
    UIImageView *loadingBackground = [[UIImageView alloc]initWithFrame:mainView.frame];
    [loadingBackground setImage:[UIImage imageNamed:@"bg_photos"]];
    
    [mainView addSubview:loadingBackground];
    
    self.animatedView = [[UIImageView alloc]initWithFrame:CGRectMake(98, 238, mainView.frame.size.width - 196, 62)];
    self.animatedView.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"loading_1"],
                                    [UIImage imageNamed:@"loading_2"],
                                    [UIImage imageNamed:@"loading_3"],
                                    [UIImage imageNamed:@"loading_4"],
                                    [UIImage imageNamed:@"loading_5"],
                                    [UIImage imageNamed:@"loading_6"],
                                    [UIImage imageNamed:@"loading_7"],
                                    [UIImage imageNamed:@"loading_8"],
                                    [UIImage imageNamed:@"loading_9"],
                                    [UIImage imageNamed:@"loading_10"],
                                    [UIImage imageNamed:@"loading_11"],nil];
    
    self.animatedView.animationDuration = 2.0f;
    self.animatedView.animationRepeatCount = 0;
    [self.animatedView startAnimating];
    [loadingBackground addSubview: self.animatedView];
    
    UILabel *loadingText = [[UILabel alloc]initWithFrame:CGRectMake(0, self.animatedView.frame.size.height + self.animatedView.frame.origin.y + 15, mainView.frame.size.width, 22)];
    [loadingText setText:@"Loading your matches"];
    [loadingText setFont:[UIFont fontWithName:AVENIR_BOOK size:16]];
    [loadingText setTextAlignment:NSTextAlignmentCenter];
    [loadingText setTextColor:[BaseView colorWithHexString:@"F7F9F9"]];
    [loadingBackground addSubview:loadingText];
}

@end
