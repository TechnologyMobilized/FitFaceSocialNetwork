//
//  LocationView.m
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "LocationView.h"

@implementation LocationView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(13, 13, mainView.frame.size.width - 13, 8)];
    [label setAttributedText:[BaseView setCharacterSpacingWithString:@"WHERE"]];
    [label setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [label setTextColor:[BaseView colorWithHexString:@"24539C"]];
    
    [mainView addSubview:label];
    
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(13, label.frame.size.height + label.frame.origin.y + 20, mainView.frame.size.width - 26, 20)];
    [field setBackgroundColor:[UIColor whiteColor]];
    [field setPlaceholder:@"Location"];
    [field setDelegate:self.locationDelegate];
    [field setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [field setAutocorrectionType:UITextAutocorrectionTypeNo];
    [field addTarget:self.locationDelegate action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [mainView addSubview:field];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(13, field.frame.size.height + field.frame.origin.y + 8, field.frame.size.width, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"EDEDEE"]];
    [mainView addSubview:border];
    
    UIButton *addLocation = [[UIButton alloc]initWithFrame:CGRectMake(13, mainView.frame.size.height - 109, mainView.frame.size.width - 26, 46)];
    [addLocation setTitle:@"ADD YOUR LOCATION" forState:UIControlStateNormal];
    [addLocation setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
    [addLocation.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    
    [mainView addSubview:addLocation];
    
    scrollHeight = mainView.frame.size.height - (mainView.frame.size.height - addLocation.frame.origin.y + 18 + border.frame.origin.y + 4);
    
//    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(2, border.frame.origin.y + 4, mainView.frame.size.width - 4, scrollHeight)];
//    [self.scrollView setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
//    
//    [self.scrollView setDelegate: self.locationDelegate];
//    [self.scrollView setShowsVerticalScrollIndicator:NO];
//    [mainView addSubview:self.scrollView];
    
    [self.scrollView setHidden:YES];
    
}

-(void)searchList:(NSArray *)list {
    NSLog(@"list");
    
    yOrigin = 14;
    tag = 0;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(2, border.frame.size.height + border.frame.origin.y + 3, self.frame.size.width - 4, scrollHeight)];
    [self.scrollView setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [self.scrollView setDelegate: self.locationDelegate];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    
    [self addSubview:self.scrollView];
    
//    if(![self.scrollView isHidden]) {
//        [self.scrollView.subviews performSelector:@selector(removeFromSuperview)];
//        NSLog(@"sdsdks -- -%@", self.scrollView.subviews);
//    }
    
    [self.scrollView setHidden:NO];
    
    for(int i = 0; i < [list count]; i++) {
        UIView *location = [[UIView alloc]initWithFrame:CGRectMake(0, yOrigin, self.scrollView.frame.size.width, 20)];
        yOrigin = location.frame.size.height + location.frame.origin.y;
        
        UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(12, 4, 8, 10)];
        [logo setImage:[UIImage imageNamed:@"pin"]];
        
        [location addSubview:logo];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(logo.frame.size.width + logo.frame.origin.x + 7, 0, location.frame.size.width - (logo.frame.size.width + 7), 20)];
        [label setText:[NSString stringWithFormat:@"%@", [list objectAtIndex:i]]];
        [label setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
        [label setTextColor:[BaseView colorWithHexString:@"171716"]];
        
        [location addSubview:label];
        
        [self.scrollView addSubview:location];
    }
    
    yOrigin += 12;
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, yOrigin)];
    
    if(yOrigin < scrollHeight)
        [self.scrollView setFrame:CGRectMake(self.scrollView.frame.origin.x, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, scrollHeight - (scrollHeight - yOrigin))];
    else
        [self.scrollView setFrame:CGRectMake(self.scrollView.frame.origin.x, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, scrollHeight)];
}

@end
