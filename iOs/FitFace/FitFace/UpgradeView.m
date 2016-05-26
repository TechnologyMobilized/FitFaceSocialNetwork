//
//  UpgradeView.m
//  fitface
//
//  Created by LLDM 0037 on 4/27/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "UpgradeView.h"

@implementation UpgradeView

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
    [screenLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"Upgrade"]];
    [screenLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:20]];
    [screenLabel setTextAlignment:NSTextAlignmentCenter];
    [screenLabel setTextColor:[UIColor whiteColor]];
    [mainView addSubview:screenLabel];
    
    UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(12, background.frame.size.height + 12, mainView.frame.size.width - 24, 290)];
    [content setFont:[UIFont fontWithName:AVENIR_BOOK size:13]];
    [content setNumberOfLines:0];
    [content setText:@"Bushwick YOLO photo booth venmo keytar. Banjo butcher sartorial austin raw denim thundercasts. Blog echo park fashion axe, kogi taxidermy pour over cray humblebrag sustainable mumblecore authentic master cleanse. \n\nCronut knausgaard bushwick, tumblr vice narwhal green juice fap gluten-free venmo kitsch yr pour over microdosing. \n\nMigas 3 wolf moon XOXO tofu. Man braid stumptown marfa 3 wolf moon, authentic 8-bit YOLO ramps austin bitters gochujang. Poutine mix tape forage farm-to-table hella wayfarers butcher, bicycle rights chicharrones crucifix dreamcatcher skateboard portland."];
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
