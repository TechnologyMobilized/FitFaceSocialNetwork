//
//  SettingsViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SettingsView.h"
#import "PreferencesViewController.h"
#import "BasicInfoViewController.h"
#import "UIViewController+JASidePanel.h"
#import "JASidePanelController.h"
#import "MenuViewController.h"
#import "SecurityViewController.h"
#import "NotificationsViewController.h"
#import "BlockedUsersViewController.h"
#import "FitnessInformationViewController.h"
#import "RadiusViewController.h"

@interface SettingsViewController : BaseViewController <SettingsViewDelegate> {
    SettingsView *settingsView;
    JASidePanelController *jaSidePanelController;
}

@end
