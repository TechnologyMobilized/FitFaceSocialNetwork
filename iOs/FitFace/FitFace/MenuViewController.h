//
//  MenuViewController.h
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "BaseViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "ProfileViewController.h"
#import "HomeViewController.h"
#import "MenuView.h"
#import "SettingsViewController.h"
#import "AboutViewController.h"
#import "MessagesViewController.h"
#import "MeetNowNotifViewController.h"

@interface MenuViewController : BaseViewController<MenuViewDelegate>{
    MenuView *menuView;
}

@end
