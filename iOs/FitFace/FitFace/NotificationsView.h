//
//  NotificationsView.h
//  fitface
//
//  Created by LLDM 0037 on 3/17/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol NotificationsViewDelegate <UIPickerViewDataSource, UIPickerViewDelegate>

-(IBAction)onNewMessagesButtonTap:(id)sender;
-(IBAction)onRequestButtonTap:(id)sender;
-(IBAction)onNoLoginButtonTap:(id)sender;
-(IBAction)onNotificationButtonTap:(id)sender;
-(IBAction)onEmailButtonTap:(id)sender;
-(IBAction)onSMSButtonTap:(id)sender;
-(IBAction)onUpdateButtonTap:(id)sender;

@end

@interface NotificationsView : BaseView {
    BOOL messagesActive;
    BOOL requestActive;
    BOOL noLoginActive;
}

@property (nonatomic, weak) id <NotificationsViewDelegate> notificationsDelegate;
@property (nonatomic, strong) UIImageView *messagesIcon;
@property (nonatomic, strong) UIImageView *requestIcon;
@property (nonatomic, strong) UIImageView *noLoginIcon;
@property (nonatomic, strong) UIImageView *notificationIcon;
@property (nonatomic, strong) UIImageView *emailIcon;
@property (nonatomic, strong) UIImageView *smsIcon;
@property (nonatomic, strong) UIPickerView *daysPicker;

@end
