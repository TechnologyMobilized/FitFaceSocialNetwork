//
//  RequestView.m
//  fitface
//
//  Created by LLDM 0037 on 4/20/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "RequestView.h"

@implementation RequestView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self addSubview:mainView];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:mainView.frame];
    [background setImage:[UIImage imageNamed:@"bg_photos"]];
    [mainView addSubview:background];
    
    popupContainer = [[UIView alloc]initWithFrame:CGRectMake(18, 84, mainView.frame.size.width - 32, 368)];
    [popupContainer setBackgroundColor:[UIColor whiteColor]];
    [popupContainer.layer setCornerRadius:1];
    [mainView addSubview:popupContainer];
    
    UILabel *meetNowLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, popupContainer.frame.size.width, 52)];
    [meetNowLabel setBackgroundColor:[BaseView colorWithHexString:@"F4F2F0"]];
    [meetNowLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"Meet Now"]];
    [meetNowLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:15]];
    [meetNowLabel setTextColor:[BaseView colorWithHexString:@"083E94"]];
    [meetNowLabel setTextAlignment:NSTextAlignmentCenter];
    [popupContainer addSubview:meetNowLabel];
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, meetNowLabel.frame.size.height, popupContainer.frame.size.width, popupContainer.frame.size.height - (meetNowLabel.frame.size.height + 46))];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [popupContainer addSubview:scrollView];
    
    UILabel *whereLabel = [[UILabel alloc]initWithFrame:CGRectMake(21, 20, popupContainer.frame.size.width - 30, 12)];
    [whereLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"WHERE?"]];
    [whereLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:7]];
    [whereLabel setTextColor:[BaseView colorWithHexString:@"345EA2"]];
    [scrollView addSubview:whereLabel];
    
    yOrigin = whereLabel.frame.size.height + whereLabel.frame.origin.y + 16;
    
    UIButton *sendButton = [[UIButton alloc]initWithFrame:CGRectMake(0, popupContainer.frame.size.height - 46, popupContainer.frame.size.width, 46)];
    [sendButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [sendButton setTitle:@"SEND REQUEST" forState:UIControlStateNormal];
    [sendButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [sendButton addTarget:self.requestDelegate action:@selector(onSendButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [popupContainer addSubview:sendButton];
    
}

-(void)addWhereChoices:(NSArray *)whereChoicesArray {
    for(int i = 0; i < [whereChoicesArray count]; i++) {
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, yOrigin, popupContainer.frame.size.width, 22)];
        [scrollView addSubview:container];
        
        UITapGestureRecognizer *choicetap = [[UITapGestureRecognizer alloc]initWithTarget:self.requestDelegate action:@selector(onWhereChoiceTap:)];
        
        UIView *choiceButton = [[UIView alloc]initWithFrame:CGRectMake(22, 1, 20, 20)];
        [choiceButton.layer setBorderColor:[BaseView colorWithHexString:THEME_COLOR].CGColor];
        [choiceButton.layer setCornerRadius:2.0];
        [choiceButton.layer setBorderWidth:1];
        [choiceButton addGestureRecognizer:choicetap];
        [container addSubview:choiceButton];
        
        UIView *selection = [[UIView alloc]initWithFrame:CGRectMake(3, 3, choiceButton.frame.size.width - 6, choiceButton.frame.size.height - 6)];
        [selection setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [selection.layer setCornerRadius:2.0];
        [selection setHidden:YES];
        [choiceButton addSubview:selection];
        
        UILabel *choiceLabel = [[UILabel alloc]initWithFrame:CGRectMake(choiceButton.frame.size.width + choiceButton.frame.origin.x + 12, 0, container.frame.size.width - 60, container.frame.size.height)];
        [choiceLabel setText:[NSString stringWithFormat:@"%@", [whereChoicesArray objectAtIndex:i]]];
        [choiceLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
        [choiceLabel setTextColor:[BaseView colorWithHexString:@"737373"]];
        [container addSubview:choiceLabel];
        
        yOrigin += container.frame.size.height + 12;
    }
}

-(void)addWhatChoices:(NSArray *)whatChoicesArray {
    UILabel *whatLabel = [[UILabel alloc]initWithFrame:CGRectMake(21, yOrigin + 7, popupContainer.frame.size.width - 30, 12)];
    [whatLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"FOR WHAT?"]];
    [whatLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:7]];
    [whatLabel setTextColor:[BaseView colorWithHexString:@"345EA2"]];
    [scrollView addSubview:whatLabel];
    
    yOrigin += whatLabel.frame.size.height + 23;
    
    for(int i = 0; i < [whatChoicesArray count]; i++) {
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, yOrigin, popupContainer.frame.size.width, 22)];
        [scrollView addSubview:container];
        
        UITapGestureRecognizer *choicetap = [[UITapGestureRecognizer alloc]initWithTarget:self.requestDelegate action:@selector(onWhatChoiceTap:)];
        
        UIView *choiceButton = [[UIView alloc]initWithFrame:CGRectMake(22, 1, 20, 20)];
        [choiceButton.layer setBorderColor:[BaseView colorWithHexString:THEME_COLOR].CGColor];
        [choiceButton.layer setCornerRadius:2.0];
        [choiceButton.layer setBorderWidth:1];
        [choiceButton addGestureRecognizer:choicetap];
        [container addSubview:choiceButton];
        
        UIView *selection = [[UIView alloc]initWithFrame:CGRectMake(3, 3, choiceButton.frame.size.width - 6, choiceButton.frame.size.height - 6)];
        [selection setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [selection.layer setCornerRadius:2.0];
        [selection setHidden:YES];
        [choiceButton addSubview:selection];
        
        UILabel *choiceLabel = [[UILabel alloc]initWithFrame:CGRectMake(choiceButton.frame.size.width + choiceButton.frame.origin.x + 12, 0, container.frame.size.width - 60, container.frame.size.height)];
        [choiceLabel setText:[NSString stringWithFormat:@"%@", [whatChoicesArray objectAtIndex:i]]];
        [choiceLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
        [choiceLabel setTextColor:[BaseView colorWithHexString:@"737373"]];
        [container addSubview:choiceLabel];
        
        yOrigin += container.frame.size.height + 12;
    }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin)];
}

@end
