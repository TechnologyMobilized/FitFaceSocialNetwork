//
//  CheckinView.m
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "CheckinView.h"

@implementation CheckinView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setDelegate: self.checkinDelegate];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:scrollView];
    
    yOrigin = 12;
    tag = 0;
}

-(void)checkinList:(NSArray *)array {
    
    for(int i = 0; i < 10; i++) {
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(13, yOrigin, scrollView.frame.size.width - 26, 60)];
        [container setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
        
        [scrollView addSubview:container];
        yOrigin = container.frame.size.height + container.frame.origin.y + 2;
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, container.frame.size.height)];
        [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [container addSubview:border];
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(border.frame.size.width + 10, 8, 44, 44)];
        [image.layer setCornerRadius:image.frame.size.width/2];
        [image setContentMode:UIViewContentModeScaleAspectFill];
        [image setClipsToBounds:YES];
        [container addSubview:image];
        
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(image.frame.size.width + image.frame.origin.x + 8, 9, container.frame.size.width - 106, 16)];
        [name setText:[NSString stringWithFormat:@"Lionel Messi"]];
        [name setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
        [container addSubview:name];
        
        //icon
        UIImageView *locationIcon = [[UIImageView alloc]initWithFrame:CGRectMake(name.frame.origin.x, name.frame.size.height + name.frame.origin.y + 4, 8, 11)];
        [locationIcon setContentMode:UIViewContentModeScaleAspectFit];
        [locationIcon setImage:[UIImage imageNamed:@"pin"]];
        [container addSubview:locationIcon];

        // location
        UILabel *viewLocation = [[UILabel alloc]initWithFrame:CGRectMake(locationIcon.frame.size.width + locationIcon.frame.origin.x + 7, locationIcon.frame.origin.y, name.frame.size.width, 11)];
        [viewLocation setText:[NSString stringWithFormat:@"Barker St., London"]];
        [viewLocation setTextColor:[BaseView colorWithHexString:@"7F8081"]];
        [viewLocation setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
        [container addSubview:viewLocation];
        
        //time icon
        UIImageView *timeIcon = [[UIImageView alloc]initWithFrame:CGRectMake(locationIcon.frame.origin.x, locationIcon.frame.size.height + locationIcon.frame.origin.y + 4, 9, 10)];
        [timeIcon setContentMode:UIViewContentModeScaleAspectFit];
        [timeIcon setImage:[UIImage imageNamed:@"clock"]];
        [container addSubview:timeIcon];
        
        //date
        UILabel *date = [[UILabel alloc]initWithFrame:CGRectMake(timeIcon.frame.size.width + timeIcon.frame.origin.x + 7, timeIcon.frame.origin.y, name.frame.size.width, 11)];
        [date setText:[NSString stringWithFormat:@"12 mins ago"]];
        [date setTextColor:[BaseView colorWithHexString:@"7F8081"]];
        [date setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
        [container addSubview:date];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(container.frame.size.width - 40, 15, 31, 31)];
        [button setBackgroundImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
        [button addTarget:self.checkinDelegate action:@selector(onButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:tag];
        [container addSubview:button];
        
        UIButton *profileButton = [[UIButton alloc]initWithFrame:CGRectMake(image.frame.origin.x, 0, name.frame.size.width + name.frame.origin.x - 30, container.frame.size.height)];
        [profileButton addTarget:self.checkinDelegate action:@selector(onProfileButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [container addSubview:profileButton];
        
        tag += 1;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://e1.365dm.com/15/01/768x432/lionel-messi-barcelona-la-liga_3248555.jpg?20150115082643"]];
//            UIImage *img = [UIImage imageWithData:imageData];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [image setImage:[UIImage imageWithData:imageData]];
//                [image setContentMode:UIViewContentModeScaleAspectFit];
                
            });
            
        });
        
    }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin + 60)];
}

@end
