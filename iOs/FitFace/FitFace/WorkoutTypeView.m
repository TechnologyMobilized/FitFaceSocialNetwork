//
//  WorkoutTypeView.m
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "WorkoutTypeView.h"

@implementation WorkoutTypeView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setDelegate:self.workoutTypeDelegate];
    [scrollView setShowsVerticalScrollIndicator:NO];
    
    [mainView addSubview:scrollView];
    
    popupContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [popupContainer setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.32]];
    
    buttonsContainer = [[UIView alloc]initWithFrame:CGRectMake(mainView.frame.size.width - 150, 12, 138, 124)];
    [buttonsContainer setBackgroundColor:[UIColor whiteColor]];
    [buttonsContainer setAlpha:0.95];
    [popupContainer addSubview:buttonsContainer];
    
    UILabel *viewLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, buttonsContainer.frame.size.width, 33)];
    [viewLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"VIEW"]];
    [viewLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [viewLabel setTextAlignment:NSTextAlignmentCenter];
    [buttonsContainer addSubview: viewLabel];
    
    UIView *margin = [[UIView alloc]initWithFrame:CGRectMake(0, viewLabel.frame.size.height, buttonsContainer.frame.size.width, 2)];
    [margin setBackgroundColor:[BaseView colorWithHexString:@"E3E2E3"]];
    [buttonsContainer addSubview:margin];
    
    UILabel *allLabel = [[UILabel alloc]initWithFrame:CGRectMake(21, margin.frame.size.height + margin.frame.origin.y + 10, buttonsContainer.frame.size.width - 21, 30)];
    [allLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"All"]];
    [allLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [allLabel setTextColor:[BaseView colorWithHexString:@"2390F8"]];
    [buttonsContainer addSubview:allLabel];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, margin.frame.size.height + margin.frame.origin.y + 10, buttonsContainer.frame.size.width, 30)];
    [button addTarget:self.workoutTypeDelegate action:@selector(onAllButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [buttonsContainer addSubview:button];
    
    UILabel *matchesOnly = [[UILabel alloc]initWithFrame:CGRectMake(21, allLabel.frame.size.height + allLabel.frame.origin.y, buttonsContainer.frame.size.width - 21, 30)];
    [matchesOnly setAttributedText:[BaseView setCharacterSpacingWithString:@"Matches Only"]];
    [matchesOnly setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [matchesOnly setTextColor:[BaseView colorWithHexString:@"2390F8"]];
    [buttonsContainer addSubview:matchesOnly];
    
    button = [[UIButton alloc]initWithFrame:CGRectMake(0, allLabel.frame.size.height + allLabel.frame.origin.y + 10, buttonsContainer.frame.size.width, 30)];
    [button addTarget:self.workoutTypeDelegate action:@selector(onMatchesOnlyTap:) forControlEvents:UIControlEventTouchUpInside];
    [buttonsContainer addSubview:button];
    
    [mainView addSubview:popupContainer];
    [popupContainer setHidden:YES];
    
    yOrigin = 12;
    tag = 0;
}

-(void)workoutTypesList:(NSArray *)workoutTypesArray {
    for(int i = 0; i < [workoutTypesArray count]; i++) {
        
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(13, yOrigin, scrollView.frame.size.width - 26, 60)];
        [container setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
        [scrollView addSubview:container];
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, container.frame.size.height)];
        [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [container addSubview:border];
        
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 10, 0, container.frame.size.width - 111, container.frame.size.height)];
        [name setText:[NSString stringWithFormat:@"%@", [workoutTypesArray objectAtIndex:i]]];
        [name setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
        [container addSubview:name];
        
        yOrigin += container.frame.size.height + 2;
        tag += 1;
        
    }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin + 60)];
    
}

-(void)displayPopup {
    
    if([popupContainer isHidden]) {
        [popupContainer setHidden:NO];
        
        buttonsContainer.transform = CGAffineTransformMakeScale(0.01, 0.01);
        [buttonsContainer setHidden:NO];
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            buttonsContainer.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished){
            // do something once the animation finishes, put it here
        }];
        
    } else {
        buttonsContainer.transform = CGAffineTransformIdentity;
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            buttonsContainer.transform = CGAffineTransformMakeScale(0.01, 0.01);
        } completion:^(BOOL finished){
            [popupContainer setHidden:YES];
        }];
    }
}

@end
