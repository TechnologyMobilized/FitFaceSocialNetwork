//
//  SettingsView.m
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "SettingsView.h"

@implementation SettingsView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setDelegate:self.settingsDelegate];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:scrollView];
    
    UIView *category = [[UIView alloc]initWithFrame:CGRectMake(0, 12, mainView. frame.size.width, 40)];
    [category setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [scrollView addSubview:category];
    
    UILabel *categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, category.frame.size.width - 118, category.frame.size.height)];
    [categoryLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"ON-THE-GO"]];
    [categoryLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [categoryLabel setTextColor:[UIColor blackColor]];
    [category addSubview:categoryLabel];
    
    UIView *buttonSwitch = [[UIView alloc]initWithFrame:CGRectMake(categoryLabel.frame.size.width + categoryLabel.frame.origin.x, 4, 94, 32)];
    [buttonSwitch.layer setBorderColor:[BaseView colorWithHexString:@"C4DCFC"].CGColor];
    [buttonSwitch.layer setBorderWidth: 1.0];
    [buttonSwitch.layer setCornerRadius: 2.0];
    [category addSubview:buttonSwitch];
    
    isOn = [[[NSUserDefaults standardUserDefaults]objectForKey:@"switch"]integerValue];
    
    if(!isOn) {
        NSLog(@"OFF");
        
        imageSwitch = [[UIImageView alloc]initWithFrame:CGRectMake(6, 5, 40, 22)];
        [imageSwitch setImage:[UIImage imageNamed:@"switch_off"]];
        [buttonSwitch addSubview:imageSwitch];
        
    } else {
        
        imageSwitch = [[UIImageView alloc]initWithFrame:CGRectMake(buttonSwitch.frame.size.width - 46, 5, 40, 22)];
        [imageSwitch setImage:[UIImage imageNamed:@"switch_on"]];
        [buttonSwitch addSubview:imageSwitch];
    }
    
    UIButton *button = [[UIButton alloc]initWithFrame:buttonSwitch.frame];
    [button addTarget:self action:@selector(didTapSwitchButton:) forControlEvents:UIControlEventTouchUpInside];
//    [button setBackgroundColor:[UIColor redColor]];
    [category addSubview:button];
    
    UIView *preferences = [[UIView alloc]initWithFrame:CGRectMake(12, category.frame.size.height + category.frame.origin.y + 12, mainView.frame.size.width - 24, 43)];
    [preferences setBackgroundColor:[BaseView colorWithHexString:@"F6F5F7"]];
    [scrollView addSubview:preferences];

    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, preferences.frame.size.height)];
    [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [preferences addSubview:border];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 8, 0, preferences.frame.size.width - 42, preferences.frame.size.height)];
    [label setText:@"On-The-Go Preferences"];
    [label setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [label setTextColor:[BaseView colorWithHexString:@"797979"]];
    [preferences addSubview: label];

    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(label.frame.size.width + label.frame.origin.x, 12, 21, 21)];
    [image setImage:[UIImage imageNamed:@"arrow-right"]];
    [preferences addSubview:image];
    
    UIButton *nextButton = [[UIButton alloc]initWithFrame:preferences.frame];
    [nextButton addTarget:self.settingsDelegate action:@selector(onPreferencesButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:nextButton];
    
    category = [[UIView alloc]initWithFrame:CGRectMake(0, preferences.frame.size.height + preferences.frame.origin.y + 21, mainView.frame.size.width, 40)];
    [category setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [scrollView addSubview:category];
    
    categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, categoryLabel.frame.size.width - 24, category.frame.size.height)];
    [categoryLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"YOUR DETAILS"]];
    [categoryLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [categoryLabel setTextColor:[UIColor blackColor]];
    [category addSubview:categoryLabel];
    
    //----- BASIC INFO
    
    UIView *basicInfo = [[UIView alloc]initWithFrame:CGRectMake(12, category.frame.size.height + category.frame.origin.y + 12, mainView.frame.size.width - 24, 43)];
    [basicInfo setBackgroundColor:[BaseView colorWithHexString:@"F6F5F7"]];
    [scrollView addSubview:basicInfo];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, basicInfo.frame.size.height)];
    [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [basicInfo addSubview:border];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 8, 0, basicInfo.frame.size.width - 42, basicInfo.frame.size.height)];
    [label setText:@"Basic Information"];
    [label setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [label setTextColor:[BaseView colorWithHexString:@"797979"]];
    [basicInfo addSubview: label];
    
    image = [[UIImageView alloc]initWithFrame:CGRectMake(label.frame.size.width + label.frame.origin.x, 12, 21, 21)];
    [image setImage:[UIImage imageNamed:@"arrow-right"]];
    [basicInfo addSubview:image];
    
    nextButton = [[UIButton alloc]initWithFrame:basicInfo.frame];
    [nextButton addTarget:self.settingsDelegate action:@selector(onBasicInfoButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:nextButton];
    
    //----- FITNESS INFO
    
    UIView *fitnessInfo = [[UIView alloc]initWithFrame:CGRectMake(12, basicInfo.frame.size.height + basicInfo.frame.origin.y + 1, mainView.frame.size.width - 24, 43)];
    [fitnessInfo setBackgroundColor:[BaseView colorWithHexString:@"F6F5F7"]];
    
    [scrollView addSubview:fitnessInfo];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, fitnessInfo.frame.size.height)];
    [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [fitnessInfo addSubview:border];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 8, 0, fitnessInfo.frame.size.width - 42, fitnessInfo.frame.size.height)];
    [label setText:@"Fitness Information"];
    [label setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [label setTextColor:[BaseView colorWithHexString:@"797979"]];
    [fitnessInfo addSubview: label];
    
    image = [[UIImageView alloc]initWithFrame:CGRectMake(label.frame.size.width + label.frame.origin.x, 12, 21, 21)];
    [image setImage:[UIImage imageNamed:@"arrow-right"]];
    [fitnessInfo addSubview:image];
    
    nextButton = [[UIButton alloc]initWithFrame:fitnessInfo.frame];
    [nextButton addTarget:self.settingsDelegate action:@selector(onFitnessInfoButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:nextButton];
    
    // APP PREFERENCES
    
    category = [[UIView alloc]initWithFrame:CGRectMake(0, fitnessInfo.frame.size.height + fitnessInfo.frame.origin.y + 21, mainView.frame.size.width, 40)];
    [category setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [scrollView addSubview:category];
    
    categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, categoryLabel.frame.size.width - 24, category.frame.size.height)];
    [categoryLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"APP PREFERENCES"]];
    [categoryLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [categoryLabel setTextColor:[UIColor blackColor]];
    [category addSubview:categoryLabel];
    
    //----- NOTIFICATIONS INFO
    
    UIView *notification = [[UIView alloc]initWithFrame:CGRectMake(12, category.frame.size.height + category.frame.origin.y + 12, mainView.frame.size.width - 24, 43)];
    [notification setBackgroundColor:[BaseView colorWithHexString:@"F6F5F7"]];
    [scrollView addSubview:notification];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, notification.frame.size.height)];
    [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [notification addSubview:border];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 8, 0, notification.frame.size.width - 42, notification.frame.size.height)];
    [label setText:@"Notifications"];
    [label setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [label setTextColor:[BaseView colorWithHexString:@"797979"]];
    [notification addSubview: label];
    
    image = [[UIImageView alloc]initWithFrame:CGRectMake(label.frame.size.width + label.frame.origin.x, 12, 21, 21)];
    [image setImage:[UIImage imageNamed:@"arrow-right"]];
    [notification addSubview:image];
    
    nextButton = [[UIButton alloc]initWithFrame:notification.frame];
    [nextButton addTarget:self.settingsDelegate action:@selector(onNotificationButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:nextButton];
    
    //----- SECURITY
    
    UIView *security = [[UIView alloc]initWithFrame:CGRectMake(12, notification.frame.size.height + notification.frame.origin.y + 1, mainView.frame.size.width - 24, 43)];
    [security setBackgroundColor:[BaseView colorWithHexString:@"F6F5F7"]];
    
    [scrollView addSubview:security];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, security.frame.size.height)];
    [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [security addSubview:border];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 8, 0, security.frame.size.width - 42, security.frame.size.height)];
    [label setText:@"Security"];
    [label setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [label setTextColor:[BaseView colorWithHexString:@"797979"]];
    [security addSubview: label];
    
    image = [[UIImageView alloc]initWithFrame:CGRectMake(label.frame.size.width + label.frame.origin.x, 12, 21, 21)];
    [image setImage:[UIImage imageNamed:@"arrow-right"]];
    [security addSubview:image];
    
    nextButton = [[UIButton alloc]initWithFrame:security.frame];
    [nextButton addTarget:self.settingsDelegate action:@selector(onSecurityButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:nextButton];
    
    //RADIUS
    
    category = [[UIView alloc]initWithFrame:CGRectMake(0, security.frame.size.height + security.frame.origin.y + 21, mainView.frame.size.width, 40)];
    [category setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [scrollView addSubview:category];
    
    categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, categoryLabel.frame.size.width - 24, category.frame.size.height)];
    [categoryLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"RADIUS"]];
    [categoryLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [categoryLabel setTextColor:[UIColor blackColor]];
    [category addSubview:categoryLabel];
    
    UIView *radius = [[UIView alloc]initWithFrame:CGRectMake(12, category.frame.size.height + category.frame.origin.y + 12, mainView.frame.size.width - 24, 43)];
    [radius setBackgroundColor:[BaseView colorWithHexString:@"F6F5F7"]];
    [scrollView addSubview:radius];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, radius.frame.size.height)];
    [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [radius addSubview:border];
    
    NSMutableDictionary *selectionInfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"selectionInfo"];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 8, 0, radius.frame.size.width - 42, radius.frame.size.height)];
    [label setText:@"Notifications"];
    [label setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [label setTextColor:[BaseView colorWithHexString:@"797979"]];
    [label setTag:200];
    [radius addSubview: label];

    if(selectionInfo == nil) {
        [label setText:@"None"];
        
    } else {
        [label setText:[selectionInfo objectForKey:@"selectedLabel"]];
    }
    
    image = [[UIImageView alloc]initWithFrame:CGRectMake(label.frame.size.width + label.frame.origin.x, 12, 21, 21)];
    [image setImage:[UIImage imageNamed:@"arrow-right"]];
    [radius addSubview:image];
    
    nextButton = [[UIButton alloc]initWithFrame:radius.frame];
    [nextButton addTarget:self.settingsDelegate action:@selector(onRadiusButtontap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:nextButton];
    
    UILabel *infoText = [[UILabel alloc]initWithFrame:CGRectMake(12, radius.frame.size.height + radius.frame.origin.y, mainView.frame.size.width - 24, 38)];
    [infoText setText:@"If not selected, your matches will only be according to the city you live in."];
    [infoText setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [infoText setTextColor:[BaseView colorWithHexString:@"B2B2B2"]];
    [infoText setNumberOfLines:0];
    [scrollView addSubview:infoText];
    
    // BLOCKED USERS
    
    category = [[UIView alloc]initWithFrame:CGRectMake(0, infoText.frame.size.height + infoText.frame.origin.y + 3, mainView.frame.size.width, 40)];
    [category setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [scrollView addSubview:category];
    
    categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, categoryLabel.frame.size.width - 24, category.frame.size.height)];
    [categoryLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"BLOCKED USERS"]];
    [categoryLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [categoryLabel setTextColor:[UIColor blackColor]];
    [category addSubview:categoryLabel];
    
    UIButton *blockedUsersButton = [[UIButton alloc]initWithFrame:category.frame];
    [blockedUsersButton addTarget:self.settingsDelegate action:@selector(onBlockedUsersButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:blockedUsersButton];
    
    // DELETE PROFILE
    
    category = [[UIView alloc]initWithFrame:CGRectMake(0, category.frame.size.height + category.frame.origin.y + 12, mainView.frame.size.width, 40)];
    [category setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [scrollView addSubview:category];
    
    categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, category.frame.size.width - 24, category.frame.size.height)];
    [categoryLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"DELETE MY PROFILE"]];
    [categoryLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [categoryLabel setTextColor:[UIColor blackColor]];
    [category addSubview:categoryLabel];
    
    UIButton *deleteProfileButton = [[UIButton alloc]initWithFrame:category.frame];
    [deleteProfileButton addTarget:self.settingsDelegate action:@selector(onDeleteProfileButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:deleteProfileButton];
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, category.frame.size.height + category.frame.origin.y + 60)];
}

-(IBAction)didTapSwitchButton:(id)sender {
    NSLog(@"CLICKED");
    
    UIButton *btn = (UIButton *)sender;
    
    if(isOn) {
        [UIView animateWithDuration:0.25
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [imageSwitch setFrame:CGRectMake(6, 5, 40, 22)];
                             
                         }
                         completion:^(BOOL finished){
                             [imageSwitch setImage:[UIImage imageNamed:@"switch_off"]];
                         }];
        
        isOn = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"0" forKey:@"switch"];
        
        [defaults synchronize];
        
    } else {
        
        [UIView animateWithDuration:0.25
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [imageSwitch setFrame:CGRectMake(btn.frame.size.width - 46, 5, 40, 22)];
                             
                         }
                         completion:^(BOOL finished){
                             [imageSwitch setImage:[UIImage imageNamed:@"switch_on"]];
                         }];
        
        isOn = YES;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"1" forKey:@"switch"];
        
        [defaults synchronize];
    }
}

@end
