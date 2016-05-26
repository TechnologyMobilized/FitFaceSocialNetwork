//
//  AddAchievementView.m
//  fitface
//
//  Created by LLDM 0037 on 4/21/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "AddAchievementView.h"

@implementation AddAchievementView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    UILabel *achievementLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 14, mainView.frame.size.width - 32, 9)];
    [achievementLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"WHAT DID YOU ACHIEVE?"]];
    [achievementLabel setTextColor:[BaseView colorWithHexString:@"094599"]];
    [achievementLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
    [mainView addSubview:achievementLabel];
    
    self.achievementField = [[UITextField alloc]initWithFrame:CGRectMake(16,achievementLabel.frame.size.height + achievementLabel.frame.origin.y + 14, mainView.frame.size.width - 32, 30)];
    [self.achievementField setPlaceholder:@"e.g. Goal Finisher, Most Valuable Player..."];
    [self.achievementField setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [self.achievementField setDelegate:self.addAchievementDelegate];
    [self.achievementField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [mainView addSubview:self.achievementField];
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, self.achievementField.frame.size.height + self.achievementField.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"E8E9E8"]];
    [mainView addSubview:border];
    
    UILabel *eventLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, border.frame.origin.y + 20, mainView.frame.size.width - 32, 9)];
    [eventLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"FROM WHAT COMPETITION OR EVENT?"]];
    [eventLabel setTextColor:[BaseView colorWithHexString:@"094599"]];
    [eventLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
    [mainView addSubview:eventLabel];
    
    self.eventField = [[UITextField alloc]initWithFrame:CGRectMake(16, eventLabel.frame.size.height + eventLabel.frame.origin.y + 14, mainView.frame.size.width - 32, 30)];
    [self.eventField setPlaceholder:@"e.g. Ironman, Collegiate Basketball League..."];
    [self.eventField setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [self.eventField setDelegate:self.addAchievementDelegate];
    [self.eventField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [mainView addSubview:self.eventField];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, self.eventField.frame.size.height + self.eventField.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"E8E9E8"]];
    [mainView addSubview:border];
    
    UIButton *addButton = [[UIButton alloc]initWithFrame:CGRectMake(16, mainView.frame.size.height - 108, mainView.frame.size.width - 32, 48)];
    [addButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [addButton setTitle:@"ADD" forState:UIControlStateNormal];
    [addButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [addButton addTarget:self.addAchievementDelegate action:@selector(onAddButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:addButton];
    
}

@end
