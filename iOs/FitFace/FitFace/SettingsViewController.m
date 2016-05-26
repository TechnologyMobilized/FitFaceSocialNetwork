//
//  SettingsViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

-(void)loadView {
    settingsView = [[SettingsView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [settingsView setupLayout];
    [self setView:settingsView];
    
    [settingsView setBaseViewDelegate:self];

    [self.navigationItem setTitle:@"Settings"];
}

- (void)addHeaderTitle:(NSString*)title{
    [self.navigationController.navigationBar.topItem setTitle:title];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:AVENIR_BOOK size:14] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController.navigationBar setHidden:NO];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    [self addHeaderTitle:@"Settings"];
    
    NSMutableDictionary *selectionInfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"selectionInfo"];
    if(selectionInfo != nil) {
        UILabel *radiusLabel = (UILabel *)[self.view viewWithTag:200];
        [radiusLabel setText:[selectionInfo objectForKey:@"selectedLabel"]];
        
    }
}

-(IBAction)onBackButtonTap:(id)sender {
    NSLog(@"BACK BUTTON TAPPED");
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)alertMessageDisplay {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Functionality coming soon"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

#pragma mark - SettingsViewDelegate methods

-(IBAction)onPreferencesButtonTap:(id)sender {
    PreferencesViewController *preferencesView = [[PreferencesViewController alloc]init];
    [self.navigationController pushViewController:preferencesView animated:YES];
}

-(IBAction)onBasicInfoButtonTap:(id)sender {
    BasicInfoViewController *basicInfoView = [[BasicInfoViewController alloc]init];
    [self.navigationController pushViewController:basicInfoView animated:YES];
}

-(IBAction)onFitnessInfoButtonTap:(id)sender {
    FitnessInformationViewController *fitnessInformation = [[FitnessInformationViewController alloc]init];
    [self.navigationController pushViewController:fitnessInformation animated:YES];
}

-(IBAction)onNotificationButtonTap:(id)sender {
    NotificationsViewController *notificationsView = [[NotificationsViewController alloc]init];
    [self.navigationController pushViewController:notificationsView animated:YES];
}

-(IBAction)onSecurityButtonTap:(id)sender {
    SecurityViewController *securityView = [[SecurityViewController alloc]init];
    [self.navigationController pushViewController:securityView animated:YES];
}

-(IBAction)onRadiusButtontap:(id)sender {
    RadiusViewController *radiusView = [[RadiusViewController alloc]init];
    [self.navigationController pushViewController:radiusView animated:YES];
}

-(IBAction)onBlockUsersButtonTap:(id)sender {
    [self alertMessageDisplay];
}

-(IBAction)onDeleteProfileButtonTap:(id)sender {
//    [self alertMessageDisplay];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete Account"
                                                    message:@"Are you sure you want to delete your account?"
                                                   delegate:self
                                          cancelButtonTitle:@"Yes, Delete"
                                          otherButtonTitles:@"Cancel", nil];
    [alert show];
}

-(IBAction)onBlockedUsersButtonTap:(id)sender {
    BlockedUsersViewController *blockedUsers = [[BlockedUsersViewController alloc]init];
    [self.navigationController pushViewController:blockedUsers animated:YES];
}

#pragma mark - alertView methods
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self.sidePanelController.view removeFromSuperview];
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"user_data"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
