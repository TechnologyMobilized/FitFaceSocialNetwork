//
//  GymsView.m
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "GymsView.h"

@implementation GymsView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setDelegate:self.gymsDelegate];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:scrollView];
    
    yOrigin = 12;
}

-(void)gymsList:(NSArray *)gymsArray {
    for(int i = 0; i < 10; i++) {
        
        UIView *gymContainer = [[UIView alloc]initWithFrame:CGRectMake(13, yOrigin, scrollView.frame.size.width - 26, 60)];
        [gymContainer setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
        [scrollView addSubview:gymContainer];
        yOrigin = gymContainer.frame.size.height + gymContainer.frame.origin.y + 2;
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, gymContainer.frame.size.height)];
        [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [gymContainer addSubview:border];
        
        UILabel *gymName = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 10, 10, gymContainer.frame.size.width - 111, 14)];
        [gymName setText:[NSString stringWithFormat:@"ABC Gym"]];
        [gymName setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
        [gymContainer addSubview:gymName];
        
        //icon
        UIImageView *locationIcon = [[UIImageView alloc]initWithFrame:CGRectMake(border.frame.size.width + 10, gymName.frame.size.height + gymName.frame.origin.y + 2, 10, 12)];
        [locationIcon setContentMode:UIViewContentModeScaleAspectFit];
        [locationIcon setImage:[UIImage imageNamed:@"pin"]];
        [gymContainer addSubview:locationIcon];
        
        // location
        UILabel *viewLocation = [[UILabel alloc]initWithFrame:CGRectMake(locationIcon.frame.size.width + 19, gymName.frame.size.height + gymName.frame.origin.y + 4, gymName.frame.size.width, 10)];
        [viewLocation setText:[NSString stringWithFormat:@"Barker St., London"]];
        [viewLocation setTextColor:[BaseView colorWithHexString:@"7F8081"]];
        [viewLocation setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
        [gymContainer addSubview:viewLocation];
        
        //number icon
        UIImageView *numberIcon = [[UIImageView alloc]initWithFrame:CGRectMake(border.frame.size.width + 10, locationIcon.frame.size.height + locationIcon.frame.origin.y + 4, 10, 12)];
        [numberIcon setContentMode:UIViewContentModeScaleAspectFit];
        [numberIcon setImage:[UIImage imageNamed:@"mobile"]];
        [gymContainer addSubview:numberIcon];
        
        //number text
        UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(numberIcon.frame.size.width + 19, locationIcon.frame.size.height + locationIcon.frame.origin.y + 6, gymName.frame.size.width, 10)];
        [numberLabel setText:[NSString stringWithFormat:@"+1 234 5678"]];
        [numberLabel setTextColor:[BaseView colorWithHexString:@"7F8081"]];
        [numberLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
        [gymContainer addSubview:numberLabel];
        
    }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin + 60)];
}

@end
