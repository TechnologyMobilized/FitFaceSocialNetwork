//
//  EventsView.m
//  fitface
//
//  Created by LLDM 0037 on 3/2/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "EventsView.h"

@implementation EventsView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setDelegate:self.eventsDelegate];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:scrollView];
    
    yOrigin = 12;
    tag = 0;
}

-(void)eventsList:(NSArray *)eventsArray {
    for(int i = 0; i < 10; i++) {
        
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(13, yOrigin, scrollView.frame.size.width - 26, 60)];
        [container setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
        [scrollView addSubview:container];
        yOrigin = container.frame.size.height + container.frame.origin.y + 2;
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, container.frame.size.height)];
        [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [container addSubview:border];
        
        UILabel *eventName = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 12, 8, container.frame.size.width - 111, 14)];
        [eventName setText:[NSString stringWithFormat:@"Event %d", tag + 1]];
        [eventName setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
        [container addSubview:eventName];
        
        //icon
        UIImageView *locationIcon = [[UIImageView alloc]initWithFrame:CGRectMake(border.frame.size.width + 12, eventName.frame.size.height + eventName.frame.origin.y + 6, 10, 11)];
        [locationIcon setContentMode:UIViewContentModeScaleAspectFit];
        [locationIcon setImage:[UIImage imageNamed:@"pin"]];
        [container addSubview:locationIcon];
        
        // location
        UILabel *viewLocation = [[UILabel alloc]initWithFrame:CGRectMake(locationIcon.frame.size.width + locationIcon.frame.origin.x + 7, eventName.frame.size.height + eventName.frame.origin.y + 6, eventName.frame.size.width, 10)];
        [viewLocation setText:[NSString stringWithFormat:@"Barker St., London"]];
        [viewLocation setTextColor:[BaseView colorWithHexString:@"7F8081"]];
        [viewLocation setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
        [container addSubview:viewLocation];
        
        //date icon
        UIImageView *dateIcon = [[UIImageView alloc]initWithFrame:CGRectMake(border.frame.size.width + 12, locationIcon.frame.size.height + locationIcon.frame.origin.y + 4, 10, 10)];
        [dateIcon setContentMode:UIViewContentModeScaleAspectFit];
        [dateIcon setImage:[UIImage imageNamed:@"clock"]];
        [container addSubview:dateIcon];
        
        //date
        UILabel *date = [[UILabel alloc]initWithFrame:CGRectMake(dateIcon.frame.size.width + dateIcon.frame.origin.x + 7, locationIcon.frame.size.height + locationIcon.frame.origin.y + 4, eventName.frame.size.width, 10)];
        [date setText:[NSString stringWithFormat:@"February 4, 2016 Thu 8:00PM - 9:00PM"]];
        [date setTextColor:[BaseView colorWithHexString:@"7F8081"]];
        [date setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
        [container addSubview:date];
        
        UILabel *attendingLabel = [[UILabel alloc]initWithFrame:CGRectMake(date.frame.size.width +date.frame.origin.x + 5, 0, container.frame.size.width - 70, container.frame.size.height)];
        [attendingLabel setText:@"ATTENDING"];
        [attendingLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:8]];
        [attendingLabel setTextColor:[BaseView colorWithHexString:THEME_COLOR]];
        [container addSubview:attendingLabel];
        
        UIButton *viewButton = [[UIButton alloc]initWithFrame:container.frame];
        [viewButton addTarget:self.eventsDelegate action:@selector(onEventViewTap:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:viewButton];
        
        tag += 1;
        
    }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin + 60)];
}

@end
