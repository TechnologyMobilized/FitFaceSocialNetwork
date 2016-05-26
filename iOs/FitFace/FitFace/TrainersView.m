//
//  TrainersView.m
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "TrainersView.h"

@implementation TrainersView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, 102)];
    [background setImage:[UIImage imageNamed:@"header"]];
    [background setClipsToBounds:YES];
    [mainView addSubview:background];
    
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(mainView.frame.size.width - 32, 22, 20, 16)];
    [menuButton addTarget:self.trainersDelegate action:@selector(onMenuButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    [mainView addSubview:menuButton];
    
    UILabel *screenLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 46, mainView.frame.size.width, 54)];
    [screenLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"Trainer App"]];
    [screenLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:18]];
    [screenLabel setTextAlignment:NSTextAlignmentCenter];
    [screenLabel setTextColor:[UIColor whiteColor]];
    [mainView addSubview:screenLabel];
    
    UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(12, background.frame.size.height + 12, mainView.frame.size.width - 24, 290)];
    [content setFont:[UIFont fontWithName:AVENIR_BOOK size:13]];
    [content setNumberOfLines:0];
    [content setText:@"Reserved for future plans concerning the user’s ability to train with personal trainers at any time of the day, any day of the week. \n\nDesigned to be a personal log for trainers’ clients and organize sessions, this will streamline the fitness industry even more, in a way that hasn’t been done before. The time for excuses is over. \n\nComing soon, so stay tuned!"];
    [content sizeToFit];
    [mainView addSubview:content];
    
    UIButton *applyTrainerButton = [[UIButton alloc]initWithFrame:CGRectMake(16, mainView.frame.size.height - 70, mainView.frame.size.width - 32, 48)];
    [applyTrainerButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [applyTrainerButton setTitle:@"CONTINUE" forState:UIControlStateNormal];
    [applyTrainerButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
//    [applyTrainerButton setTitleColor:[BaseView colorWithHexString:@"A6C7FB"] forState:UIControlStateNormal];
    [applyTrainerButton addTarget:self.trainersDelegate action:@selector(onContinueButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:applyTrainerButton];
}

@end
