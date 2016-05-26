//
//  NotificationsView.m
//  fitface
//
//  Created by LLDM 0037 on 3/17/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "NotificationsView.h"

@implementation NotificationsView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    UIView *notifyAbout = [[UIView alloc]initWithFrame:CGRectMake(0, 12, mainView.frame.size.width, 40)];
    [notifyAbout setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [mainView addSubview:notifyAbout];
    
    UILabel *aboutLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, notifyAbout.frame.size.width - 24, notifyAbout.frame.size.height)];
    [aboutLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"NOTIFY ME ABOUT"]];
    [aboutLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [notifyAbout addSubview:aboutLabel];
    
    //New Messages
    UIView *newMessagesView = [[UIView alloc] initWithFrame:CGRectMake(13, notifyAbout.frame.size.height + notifyAbout.frame.origin.y +  12, mainView.frame.size.width - 26, 44)];
    [newMessagesView setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [mainView addSubview:newMessagesView];
    
    UIView *viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, newMessagesView.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [newMessagesView addSubview:viewBorder];
    
    UILabel *messagesLabel = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 10, 0, newMessagesView.frame.size.width - 114, newMessagesView.frame.size.height)];
    [messagesLabel setText:@"New Messages"];
    [messagesLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [newMessagesView addSubview:messagesLabel];
    
    UIView *messagesSwitch = [[UIView alloc]initWithFrame:CGRectMake(messagesLabel.frame.size.width + messagesLabel.frame.origin.x, 6, 94, 32)];
    [messagesSwitch.layer setBorderColor:[BaseView colorWithHexString:@"C4DCFC"].CGColor];
    [messagesSwitch.layer setBorderWidth: 1.0];
    [messagesSwitch.layer setCornerRadius: 2.0];
    [newMessagesView addSubview:messagesSwitch];
    
    UIButton *messagesButton = [[UIButton alloc]initWithFrame:messagesSwitch.frame];
    [messagesButton addTarget:self.notificationsDelegate action:@selector(onNewMessagesButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [newMessagesView addSubview:messagesButton];
    
    messagesActive = [[[NSUserDefaults standardUserDefaults]objectForKey:@"messagesSwitch"]integerValue];

    if(!messagesActive) {
        self.messagesIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 22)];
        [self.messagesIcon setImage:[UIImage imageNamed:@"switch_off"]];
        [messagesButton setSelected:NO];
    
    } else {
        self.messagesIcon = [[UIImageView alloc]initWithFrame:CGRectMake(messagesSwitch.frame.size.width - 46, 5, 40, 22)];
        [self.messagesIcon setImage:[UIImage imageNamed:@"switch_on"]];
        [messagesButton setSelected:YES];

    }
    
    [messagesSwitch addSubview:self.messagesIcon];
    
    //Meet Now Requests
    UIView *requestsView = [[UIView alloc] initWithFrame:CGRectMake(13, newMessagesView.frame.size.height + newMessagesView.frame.origin.y + 1, mainView.frame.size.width - 26, 44)];
    [requestsView setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [mainView addSubview:requestsView];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, requestsView.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [requestsView addSubview:viewBorder];
    
    UILabel *requestsLabel = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 10, 0, requestsView.frame.size.width - 114, requestsView.frame.size.height)];
    [requestsLabel setText:@"Meet Now Requests"];
    [requestsLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [requestsView addSubview:requestsLabel];
    
    UIView *requestSwitch = [[UIView alloc]initWithFrame:CGRectMake(requestsLabel.frame.size.width + requestsLabel.frame.origin.x, 6, 94, 32)];
    [requestSwitch.layer setBorderColor:[BaseView colorWithHexString:@"C4DCFC"].CGColor];
    [requestSwitch.layer setBorderWidth: 1.0];
    [requestSwitch.layer setCornerRadius: 2.0];
    [requestsView addSubview:requestSwitch];
    
    UIButton *requestButton = [[UIButton alloc]initWithFrame:requestSwitch.frame];
    [requestButton addTarget:self.notificationsDelegate action:@selector(onRequestButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [requestsView addSubview:requestButton];
    
    requestActive = [[[NSUserDefaults standardUserDefaults]objectForKey:@"requestSwitch"]integerValue];
    
    if(!requestActive) {
        self.requestIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 22)];
        [self.requestIcon setImage:[UIImage imageNamed:@"switch_off"]];
        [requestButton setSelected:NO];
        
    } else {
        self.requestIcon = [[UIImageView alloc]initWithFrame:CGRectMake(requestSwitch.frame.size.width - 46, 5, 40, 22)];
        [self.requestIcon setImage:[UIImage imageNamed:@"switch_on"]];
        [requestButton setSelected:YES];
        
    }
    
    [requestSwitch addSubview:self.requestIcon];
    
    //No login
    UIView *noLoginView = [[UIView alloc] initWithFrame:CGRectMake(13, requestsView.frame.size.height + requestsView.frame.origin.y + 1, mainView.frame.size.width - 26, 44)];
    [noLoginView setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [mainView addSubview:noLoginView];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, noLoginView.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [noLoginView addSubview:viewBorder];
    
    UILabel *noLoginLabel = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 10, 0, 70, noLoginView.frame.size.height)];
    [noLoginLabel setText:@"No login for"];
    [noLoginLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [noLoginView addSubview:noLoginLabel];
    
    UIView *noLoginSwitch = [[UIView alloc]initWithFrame:CGRectMake(requestSwitch.frame.origin.x, 6, 94, 32)];
    [noLoginSwitch.layer setBorderColor:[BaseView colorWithHexString:@"C4DCFC"].CGColor];
    [noLoginSwitch.layer setBorderWidth: 1.0];
    [noLoginSwitch.layer setCornerRadius: 2.0];
    [noLoginView addSubview:noLoginSwitch];
    
    UIView *picker = [[UIView alloc]initWithFrame:CGRectMake(noLoginLabel.frame.size.width + noLoginLabel.frame.origin.x, -10, 26, noLoginView.frame.size.height + 10)];
//    [picker setBackgroundColor:[UIColor redColor]];
    [noLoginView addSubview:picker];
    
    self.daysPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 6, 26, picker.frame.size.height)];
    [self.daysPicker setDelegate:self.notificationsDelegate];
    [self.daysPicker setDataSource:self.notificationsDelegate];
    [self.daysPicker reloadAllComponents];
    [picker addSubview:self.daysPicker];
    
    UILabel *daysLabel = [[UILabel alloc]initWithFrame:CGRectMake(picker.frame.size.width + picker.frame.origin.x + 5, 0, 32, noLoginView.frame.size.height)];
    [daysLabel setText:@"days"];
    [daysLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [noLoginView addSubview:daysLabel];
    
    UIButton *nologinButton = [[UIButton alloc]initWithFrame:noLoginSwitch.frame];
    [nologinButton addTarget:self.notificationsDelegate action:@selector(onNoLoginButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [noLoginView addSubview:nologinButton];
    
    noLoginActive = [[[NSUserDefaults standardUserDefaults]objectForKey:@"noLoginSwitch"]integerValue];
    
    if(!noLoginActive) {
        self.noLoginIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 22)];
        [self.noLoginIcon setImage:[UIImage imageNamed:@"switch_off"]];
        [nologinButton setSelected:NO];
        
    } else {
        self.noLoginIcon = [[UIImageView alloc]initWithFrame:CGRectMake(noLoginSwitch.frame.size.width - 46, 5, 40, 22)];
        [self.noLoginIcon setImage:[UIImage imageNamed:@"switch_on"]];
        [nologinButton setSelected:YES];
    }
    
    [noLoginSwitch addSubview:self.noLoginIcon];
    
    //send notification
    UIView *sendNotification = [[UIView alloc]initWithFrame:CGRectMake(0, noLoginView.frame.size.height + noLoginView.frame.origin.y + 13, mainView.frame.size.width, 40)];
    [sendNotification setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [mainView addSubview:sendNotification];
    
    UILabel *notificationLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, sendNotification.frame.size.width - 24, sendNotification.frame.size.height)];
    [notificationLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"SEND NOTIFICATION"]];
    [notificationLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [sendNotification addSubview:notificationLabel];
    
    //app notification
    UIView *appNotifView = [[UIView alloc] initWithFrame:CGRectMake(13, sendNotification.frame.size.height + sendNotification.frame.origin.y +  12, mainView.frame.size.width - 26, 44)];
    [appNotifView setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [mainView addSubview:appNotifView];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, newMessagesView.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [appNotifView addSubview:viewBorder];
    
    UILabel *appNotifLabel = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 10, 0, appNotifView.frame.size.width - 48, appNotifView.frame.size.height)];
    [appNotifLabel setText:@"App Notification"];
    [appNotifLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [appNotifView addSubview:appNotifLabel];
    
    UIView *empty = [[UIView alloc]initWithFrame:CGRectMake(appNotifLabel.frame.size.width + appNotifLabel.frame.origin.x, 12, 22, 22)];
    [empty setBackgroundColor:[BaseView colorWithHexString:@"FFFEFF"]];
    [empty.layer setCornerRadius:empty.frame.size.width/2];
    [appNotifView addSubview: empty];
    
    self.notificationIcon = [[UIImageView alloc]initWithFrame:CGRectMake(.5, 1, 21, 21)];
    [self.notificationIcon setImage:[UIImage imageNamed:@"check"]];
    [empty addSubview:self.notificationIcon];
    [self.notificationIcon setHidden:YES];
    
    UIButton *notificationButton = [[UIButton alloc]initWithFrame:appNotifView.frame];
    [notificationButton addTarget:self.notificationsDelegate action:@selector(onNotificationButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:notificationButton];
    
    //via email
    UIView *viaEmailView = [[UIView alloc] initWithFrame:CGRectMake(13, appNotifView.frame.size.height + appNotifView.frame.origin.y + 1, mainView.frame.size.width - 26, 44)];
    [viaEmailView setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [mainView addSubview:viaEmailView];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, newMessagesView.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [viaEmailView addSubview:viewBorder];
    
    UILabel *viaEmailLabel = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 10, 0, viaEmailView.frame.size.width - 48, viaEmailView.frame.size.height)];
    [viaEmailLabel setText:@"Via Email"];
    [viaEmailLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [viaEmailView addSubview:viaEmailLabel];
    
    empty = [[UIView alloc]initWithFrame:CGRectMake(viaEmailLabel.frame.size.width + viaEmailLabel.frame.origin.x, 12, 22, 22)];
    [empty setBackgroundColor:[BaseView colorWithHexString:@"FFFEFF"]];
    [empty.layer setCornerRadius:empty.frame.size.width/2];
    [viaEmailView addSubview: empty];
    
    self.emailIcon = [[UIImageView alloc]initWithFrame:CGRectMake(.5, 1, 21, 21)];
    [self.emailIcon setImage:[UIImage imageNamed:@"check"]];
    [empty addSubview:self.emailIcon];
    [self.emailIcon setHidden:YES];
    
    UIButton *emailButton = [[UIButton alloc]initWithFrame:viaEmailView.frame];
    [emailButton addTarget:self.notificationsDelegate action:@selector(onEmailButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:emailButton];
    
    //via SMS
    UIView *viaSMSView = [[UIView alloc] initWithFrame:CGRectMake(13, viaEmailView.frame.size.height + viaEmailView.frame.origin.y +  1, mainView.frame.size.width - 26, 44)];
    [viaSMSView setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [mainView addSubview:viaSMSView];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, newMessagesView.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [viaSMSView addSubview:viewBorder];
    
    UILabel *viaSMSLabel = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 10, 0, viaSMSView.frame.size.width - 48, viaSMSView.frame.size.height)];
    [viaSMSLabel setText:@"Via SMS"];
    [viaSMSLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [viaSMSView addSubview:viaSMSLabel];
    
    empty = [[UIView alloc]initWithFrame:CGRectMake(viaSMSLabel.frame.size.width + viaSMSLabel.frame.origin.x, 12, 22, 22)];
    [empty setBackgroundColor:[BaseView colorWithHexString:@"FFFEFF"]];
    [empty.layer setCornerRadius:empty.frame.size.width/2];
    [viaSMSView addSubview: empty];
    
    self.smsIcon = [[UIImageView alloc]initWithFrame:CGRectMake(.5, 1, 21, 21)];
    [self.smsIcon setImage:[UIImage imageNamed:@"check"]];
    [empty addSubview:self.smsIcon];
    [self.smsIcon setHidden:YES];
    
    UIButton *smsButton = [[UIButton alloc]initWithFrame:viaSMSView.frame];
    [smsButton addTarget:self.notificationsDelegate action:@selector(onSMSButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:smsButton];
    
    //update button
    UIButton *updateButton = [[UIButton alloc]initWithFrame:CGRectMake(16, mainView.frame.size.height - 108, mainView.frame.size.width - 32, 45)];
    [updateButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
    [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
    [updateButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [updateButton addTarget:self.notificationsDelegate action:@selector(onUpdateButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [mainView addSubview:updateButton];
}

@end
