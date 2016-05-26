//
//  SportsView.m
//  fitface
//
//  Created by LLDM 0037 on 3/2/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "SportsView.h"

@implementation SportsView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setDelegate:self.sportsDelegate];
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
    [button addTarget:self.sportsDelegate action:@selector(onAllButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [buttonsContainer addSubview:button];
    
    UILabel *matchesOnly = [[UILabel alloc]initWithFrame:CGRectMake(21, allLabel.frame.size.height + allLabel.frame.origin.y, buttonsContainer.frame.size.width - 21, 30)];
    [matchesOnly setAttributedText:[BaseView setCharacterSpacingWithString:@"Matches Only"]];
    [matchesOnly setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [matchesOnly setTextColor:[BaseView colorWithHexString:@"2390F8"]];
    [buttonsContainer addSubview:matchesOnly];
    
    button = [[UIButton alloc]initWithFrame:CGRectMake(0, allLabel.frame.size.height + allLabel.frame.origin.y + 10, buttonsContainer.frame.size.width, 30)];
    [button addTarget:self.sportsDelegate action:@selector(onMatchesOnlyTap:) forControlEvents:UIControlEventTouchUpInside];
    [buttonsContainer addSubview:button];
    [mainView addSubview:popupContainer];
    [popupContainer setHidden:YES];
    
    images = [[NSArray alloc]initWithObjects:@"ic_bicycle", @"ic_football", @"ic_basket", @"ic_baseball", @"ic_soccer", @"ic_wrestling", @"ic_volley", nil];
    
    yOrigin = 12;
    tag = 0;
}

-(void)sportsList:(NSArray *)sportsArray {
    for(int i = 0; i < [sportsArray count]; i++) {
        
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(13, yOrigin, scrollView.frame.size.width - 26, 60)];
        [container setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
        [scrollView addSubview:container];
        yOrigin = container.frame.size.height + container.frame.origin.y + 2;
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, container.frame.size.height)];
        [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [container addSubview:border];
        
        UIImageView *sportsImage = [[UIImageView alloc]initWithFrame:CGRectMake(border.frame.size.width + 11, 16, 38, 29)];
        [sportsImage setContentMode:UIViewContentModeScaleAspectFit];
        [sportsImage setImage:[UIImage imageNamed:[images objectAtIndex:i]]];
        [container addSubview:sportsImage];
        
        UILabel *sportsName = [[UILabel alloc]initWithFrame:CGRectMake(sportsImage.frame.origin.y + sportsImage.frame.size.width + 11, 0, container.frame.size.width - (sportsImage.frame.origin.y + sportsImage.frame.size.width + 51), container.frame.size.height)];
        [sportsName setText:[NSString stringWithFormat: @"%@",[sportsArray objectAtIndex:i]]];
        [sportsName setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
        [container addSubview:sportsName];
        
        tag += 1;
        
    }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin + 60)];
    
//    if(yOrigin < [[UIScreen mainScreen]bounds].size.height)
//        [scrollView setFrame:CGRectMake(0, 0, scrollView.frame.size.width, [[UIScreen mainScreen]bounds].size.height - ([[UIScreen mainScreen]bounds].size.height - yOrigin))];
//    else
//        [scrollView setFrame:[UIScreen mainScreen].bounds];
}

//
//-(void)displayPopup {
//    
//    if([popupContainer isHidden]) {
//        [popupContainer setHidden:NO];
//        
//        buttonsContainer.transform = CGAffineTransformMakeScale(0.01, 0.01);
//        [buttonsContainer setHidden:NO];
//        
//        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            buttonsContainer.transform = CGAffineTransformIdentity;
//        } completion:^(BOOL finished){
//            // do something once the animation finishes, put it here
//        }];
//        
//    } else {
//        buttonsContainer.transform = CGAffineTransformIdentity;
//        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            buttonsContainer.transform = CGAffineTransformMakeScale(0.01, 0.01);
//        } completion:^(BOOL finished){
//            [popupContainer setHidden:YES];
//        }];
//    }
//}

@end
