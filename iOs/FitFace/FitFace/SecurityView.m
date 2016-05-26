//
//  SecurityView.m
//  fitface
//
//  Created by LLDM 0037 on 3/16/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "SecurityView.h"

@implementation SecurityView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    UIView *attempts = [[UIView alloc]initWithFrame:CGRectMake(0, 12, mainView.frame.size.width, 38)];
    [attempts setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [mainView addSubview:attempts];
    
    UILabel *attemptsLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, attempts.frame.size.width - 24, attempts.frame.size.height)];
    [attemptsLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"LOGIN ATTEMPTS FROM ANOTHER DEVICE"]];
    [attemptsLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [attempts addSubview:attemptsLabel];
    
    //Notify via SMS
    UIView *smsView = [[UIView alloc] initWithFrame:CGRectMake(13, attempts.frame.size.height + attempts.frame.origin.y +  12, mainView.frame.size.width - 26, 44)];
    [smsView setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [mainView addSubview:smsView];
    
    UIView *viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, smsView.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [smsView addSubview:viewBorder];
    
    UILabel *smsLabel = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 10, 0, smsView.frame.size.width - 114, smsView.frame.size.height)];
    [smsLabel setText:@"Notify via SMS"];
    [smsLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [smsView addSubview:smsLabel];
    
    UIView *smsSwitch = [[UIView alloc]initWithFrame:CGRectMake(smsLabel.frame.size.width + smsLabel.frame.origin.x, 6, 94, 32)];
    [smsSwitch.layer setBorderColor:[BaseView colorWithHexString:@"C4DCFC"].CGColor];
    [smsSwitch.layer setBorderWidth: 1.0];
    [smsSwitch.layer setCornerRadius: 2.0];
    [smsView addSubview:smsSwitch];
    
    UIButton *smsButton = [[UIButton alloc]initWithFrame:smsSwitch.frame];
    [smsButton addTarget:self.securityDelegate action:@selector(onSMSButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [smsView addSubview:smsButton];
    
//    smsActive = [[[NSUserDefaults standardUserDefaults]objectForKey:@"smsSwitch"]integerValue];
//    
//    if(!smsActive) {
    
    self.smsSwitchIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 22)];
    [self.smsSwitchIcon setImage:[UIImage imageNamed:@"switch_off"]];
    [smsButton setSelected:NO];
        
//    } else {
//        self.smsSwitchIcon = [[UIImageView alloc]initWithFrame:CGRectMake(smsSwitch.frame.size.width - 46, 5, 40, 22)];
//        [self.smsSwitchIcon setImage:[UIImage imageNamed:@"switch_on"]];
//        [smsButton setSelected:YES];
//        
//    }
    [smsSwitch addSubview:self.smsSwitchIcon];
    
    //Notify via email
    UIView *emailView = [[UIView alloc] initWithFrame:CGRectMake(13, smsView.frame.size.height + smsView.frame.origin.y +  1, mainView.frame.size.width - 26, 44)];
    [emailView setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [mainView addSubview:emailView];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, emailView.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [emailView addSubview:viewBorder];
    
    UILabel *emailLabel = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 10, 0, emailView.frame.size.width - 114, emailView.frame.size.height)];
    [emailLabel setText:@"Notify via Email"];
    [emailLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [emailView addSubview:emailLabel];
    
    UIView *emailSwitch = [[UIView alloc]initWithFrame:CGRectMake(emailLabel.frame.size.width + emailLabel.frame.origin.x, 6, 94, 32)];
    [emailSwitch.layer setBorderColor:[BaseView colorWithHexString:@"C4DCFC"].CGColor];
    [emailSwitch.layer setBorderWidth: 1.0];
    [emailSwitch.layer setCornerRadius: 2.0];
    [emailView addSubview:emailSwitch];
    
    UIButton *emailButton = [[UIButton alloc]initWithFrame:emailSwitch.frame];
    [emailButton addTarget:self.securityDelegate action:@selector(onEmailButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [emailView addSubview:emailButton];
    
//    emailActive = [[[NSUserDefaults standardUserDefaults]objectForKey:@"emailSwitch"]integerValue];
//    
//    if(!emailActive) {
    
    self.emailSwitchIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 22)];
    [self.emailSwitchIcon setImage:[UIImage imageNamed:@"switch_off"]];
    [emailButton setSelected:NO];
        
//    } else {
//        self.emailSwitchIcon = [[UIImageView alloc]initWithFrame:CGRectMake(emailSwitch.frame.size.width - 46, 5, 40, 22)];
//        [self.emailSwitchIcon setImage:[UIImage imageNamed:@"switch_on"]];
//        [emailButton setSelected:YES];
//        
//    }
    [emailSwitch addSubview:self.emailSwitchIcon];
    
    
    //password reset
    UIView *passwordReset = [[UIView alloc]initWithFrame:CGRectMake(0, emailView.frame.size.height + emailView.frame.origin.y + 58, mainView.frame.size.width, 38)];
    [passwordReset setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [mainView addSubview:passwordReset];
    
    UILabel *passwordResetLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, attempts.frame.size.width - 46, attempts.frame.size.height)];
    [passwordResetLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"PASSWORD RESET"]];
    [passwordResetLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [passwordReset addSubview:passwordResetLabel];
    
    self.resetIcon = [[UIImageView alloc]initWithFrame:CGRectMake(passwordResetLabel.frame.size.width + passwordResetLabel.frame.origin.x, 9, 21, 21)];
    [self.resetIcon setImage:[UIImage imageNamed:@"arrow-right"]];
    [passwordReset addSubview:self.resetIcon];
    
    UIButton *resetButton = [[UIButton alloc]initWithFrame:passwordReset.frame];
    [resetButton addTarget:self.securityDelegate action:@selector(onResetButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:resetButton];
    
    //update button
    self.updateButton = [[UIButton alloc]initWithFrame:CGRectMake(16, mainView.frame.size.height - 108, mainView.frame.size.width - 32, 45)];
    [self.updateButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
    [self.updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
    [self.updateButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [self.updateButton addTarget:self.securityDelegate action:@selector(onUpdateButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [mainView addSubview:self.updateButton];
}

@end
