//
//  SettingsView.h
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol SettingsViewDelegate <UIScrollViewDelegate, UIAlertViewDelegate>

-(IBAction)onPreferencesButtonTap:(id)sender;
-(IBAction)onBasicInfoButtonTap:(id)sender;
-(IBAction)onFitnessInfoButtonTap:(id)sender;
-(IBAction)onNotificationButtonTap:(id)sender;
-(IBAction)onSecurityButtonTap:(id)sender;
-(IBAction)onRadiusButtontap:(id)sender;
-(IBAction)onBlockUsersButtonTap:(id)sender;
-(IBAction)onDeleteProfileButtonTap:(id)sender;
-(IBAction)onBlockedUsersButtonTap:(id)sender;

@end

@interface SettingsView : BaseView {
    UIImageView *imageSwitch;
    UIScrollView *scrollView;
    BOOL isOn;
}

@property (nonatomic, weak) id <SettingsViewDelegate> settingsDelegate;

@end
