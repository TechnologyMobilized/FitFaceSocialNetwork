//
//  AboutView.m
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "AboutView.h"

@implementation AboutView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
//    [scrollView setDelegate:achievementDelegate];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:scrollView];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, 178)];
    [background setImage:[UIImage imageNamed:@"banner_about"]];
    [background setClipsToBounds:YES];
    [background setContentMode:UIViewContentModeScaleAspectFill];
    [scrollView addSubview:background];
    
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(mainView.frame.size.width - 32, 22, 18, 14)];
    [menuButton addTarget:self.aboutDelegate action:@selector(onMenuButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    [scrollView addSubview:menuButton];
    
    UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 60, 98, 98)];
    [logo setCenter:CGPointMake(background.frame.size.width/2, logo.center.y)];
    [logo setImage:[UIImage imageNamed:@"home_logo"]];
    [background addSubview:logo];
    
//    UIImageView *fitfaceText = [[UIImageView alloc]initWithFrame:CGRectMake(103, logo.frame.size.height + logo.frame.origin.y + 5, 114, 22)];
//    [fitfaceText setImage:[UIImage imageNamed:@"home_text"]];
//    [background addSubview:fitfaceText];
    
    UILabel *aboutLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, background.frame.size.height + 18, scrollView.frame.size.width - 32, 10)];
    [aboutLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"ABOUT FITFACE"]];
    [aboutLabel setTextColor:[BaseView colorWithHexString:THEME_COLOR]];
    [aboutLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [scrollView addSubview:aboutLabel];
    
    UILabel *aboutInfo = [[UILabel alloc]initWithFrame:CGRectMake(16, aboutLabel.frame.size.height + aboutLabel.frame.origin.y + 16, mainView.frame.size.width - 32, 200)];
    NSString *text = @"Technology Mobilized is a startup tech company with the goal to provide a new on-demand factor to the world. Aiming to streamline fitness into an everyday occurrence with the launch of FitFace, Technology Mobilized will set itself as a leader in the mobile community and present new and innovative apps to make life more manageable.";
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:4];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:text];
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [text length])];
    
    [aboutInfo setAttributedText:attrString];
    [aboutInfo setTextColor:[BaseView colorWithHexString:@"121212"]];
    [aboutInfo setNumberOfLines:0];
    [aboutInfo setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [aboutInfo sizeToFit];
    [scrollView addSubview:aboutInfo];
    
    UILabel *connectLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, aboutInfo.frame.size.height + aboutInfo.frame.origin.y + 22, mainView.frame.size.width - 32, 10)];
    [connectLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"CONNECT WITH US"]];
    [connectLabel setTextColor:[BaseView colorWithHexString:THEME_COLOR]];
    [connectLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [scrollView addSubview:connectLabel];

    UIButton *callButton = [[UIButton alloc]initWithFrame:CGRectMake(52, connectLabel.frame.size.height + connectLabel.frame.origin.y + 20, 39, 39)];
    [callButton addTarget:self.aboutDelegate action:@selector(onCallButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [callButton setBackgroundImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
    [scrollView addSubview:callButton];
    
    UIButton *messageButton = [[UIButton alloc]initWithFrame:CGRectMake(callButton.frame.size.width + callButton.frame.origin.x + 20, callButton.frame.origin.y, 39, 39)];
    [messageButton addTarget:self.aboutDelegate action:@selector(onMailButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [messageButton setBackgroundImage:[UIImage imageNamed:@"mail"] forState:UIControlStateNormal];
    [scrollView addSubview:messageButton];
    
    UIButton *facebookButton = [[UIButton alloc]initWithFrame:CGRectMake(messageButton.frame.size.width + messageButton.frame.origin.x + 20, callButton.frame.origin.y, 39, 39)];
    [facebookButton addTarget:self.aboutDelegate action:@selector(onFacebookButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [facebookButton setBackgroundImage:[UIImage imageNamed:@"fb"] forState:UIControlStateNormal];
    [scrollView addSubview:facebookButton];
    
    UIButton *twitterButton = [[UIButton alloc]initWithFrame:CGRectMake(facebookButton.frame.size.width + facebookButton.frame.origin.x + 20, callButton.frame.origin.y, 39, 39)];
    [twitterButton addTarget:self.aboutDelegate action:@selector(onTwitterButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [twitterButton setBackgroundImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateNormal];
    [scrollView addSubview:twitterButton];
    
}

@end
