//
//  OutdoorPlaces.m
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "OutdoorPlaces.h"

@implementation OutdoorPlaces

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setDelegate:self.outdoorPlacesDelegate];
    [scrollView setShowsVerticalScrollIndicator:NO];
    
    [mainView addSubview:scrollView];
    
    yOrigin = 12;
    tag = 0;
}

-(void)outdoorPlacesList:(NSArray *)gymsArray {
    for(int i = 0; i < 10; i++) {
        
        UIView *placesContainer = [[UIView alloc]initWithFrame:CGRectMake(13, yOrigin, scrollView.frame.size.width - 26, 60)];
        [placesContainer setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
        [scrollView addSubview:placesContainer];
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, placesContainer.frame.size.height)];
        [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [placesContainer addSubview:border];
        
        UILabel *placeName = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 10, 18, placesContainer.frame.size.width - 111, 12)];
        [placeName setText:[NSString stringWithFormat:@"Central Park %d", tag + 1]];
        [placeName setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
        [placesContainer addSubview:placeName];
        
        //icon
        UIImageView *locationIcon = [[UIImageView alloc]initWithFrame:CGRectMake(border.frame.size.width + 10, placeName.frame.size.height + placeName.frame.origin.y + 6, 10, 12)];
        [locationIcon setContentMode:UIViewContentModeScaleAspectFit];
        [locationIcon setImage:[UIImage imageNamed:@"pin"]];
        [placesContainer addSubview:locationIcon];
        
        // location
        UILabel *viewLocation = [[UILabel alloc]initWithFrame:CGRectMake(locationIcon.frame.size.width + 19, placeName.frame.size.height + placeName.frame.origin.y + 7, placeName.frame.size.width, 10)];
        [viewLocation setText:[NSString stringWithFormat:@"Barker St., London"]];
        [viewLocation setTextColor:[BaseView colorWithHexString:@"7F8081"]];
        [viewLocation setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
        [placesContainer addSubview:viewLocation];
        
        yOrigin += placesContainer.frame.size.height + 2;
        tag += 1;
        
    }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin + 60)];
}

@end
