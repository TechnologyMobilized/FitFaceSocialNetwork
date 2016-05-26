//
//  MenuViewController.m
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController{
    int meetnowCount;
}

- (void)loadView{
    menuView = [[MenuView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [menuView setupLayout];
    [self setView:menuView];
    meetnowCount = 0;
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

#pragma Menu Delegate
- (void)closeMenuDidClicked{
    [self.sidePanelController showCenterPanelAnimated:YES];
}
- (void)profileDidClicked{
    [self selectMenu:nil];
    
    ProfileViewController *profileController = [[ProfileViewController alloc] init];
    [profileController setIsMyProfile:YES];
    
    [self openMenuPage:profileController];
}
- (void) openMenuPage: (UIViewController *)controller{
    
    [self closeMenuDidClicked];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController: controller ];
    [self.sidePanelController setCenterPanel:nil];
    [self.sidePanelController setCenterPanel:navController];
}

#pragma Menu Items
//- (void)menuHomeClicked:(UIButton*)btnMenuItem{
//    [self selectMenu:btnMenuItem];
//   [self openMenuPage:[[HomeViewController alloc] init]];
//}
//- (void)menuMeetClicked:(UIButton*)btnMenuItem{
//    NSLog(@"hahahahahaha23e123e1");
//    [self selectMenu:btnMenuItem];
//    
//}
//- (void)menuMsgsClicked:(UIButton*)btnMenuItem{
//    [self selectMenu:btnMenuItem];
//    
//}
//- (void)menuAboutClicked:(UIButton*)btnMenuItem{
//    [self selectMenu:btnMenuItem];
////    [btnMenuItem setSelected:YES];
//    
//}

- (IBAction)menuHomeClicked:(id)sender{
    [self selectMenu:sender];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController: [[HomeViewController alloc] init] ];
    [self.sidePanelController setCenterPanel:nil];
    [self.sidePanelController setCenterPanel:navController];
}
- (IBAction)menuMeetClicked:(id)sender{
    [self selectMenu:sender];
    MeetNowNotifViewController *meetNowViewController = [[MeetNowNotifViewController alloc] init];
    [self openMenuPage:meetNowViewController];
}
- (IBAction)menuMsgsClicked:(id)sender{
    [self selectMenu:sender];
    MessagesViewController *messagesController = [[MessagesViewController alloc] init];
    [self openMenuPage:messagesController];
    
}
- (IBAction)menuAboutClicked:(id)sender{
    [self selectMenu:sender];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController: [[AboutViewController alloc] init] ];
    [self.sidePanelController setCenterPanel:nil];
    [self.sidePanelController setCenterPanel:navController];
}


//- (IBAction)menuHomeClicked1:(id)sender{
//    [menuView setSelectedMenu:sender];
//}
- (void)selectMenu: (UIButton *)btnMenuItem{
    [menuView setSelectedMenu:btnMenuItem];
}

#pragma menu buttons
- (void)logoutDidClicked{
    [self.sidePanelController.view removeFromSuperview];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"user_data"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
- (void)settingsDidClicked{
    NSLog(@"Settings");
    
    [menuView setMeetNowCount:meetnowCount++];
    SettingsViewController *settingsController = [[SettingsViewController alloc] init];
    
    [self.navigationController pushViewController:settingsController animated:YES];
}
@end
