//
//  SecurityViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/16/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "SecurityViewController.h"

@interface SecurityViewController ()

@end

@implementation SecurityViewController

-(void)loadView {
    securityView = [[SecurityView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [securityView setupLayout];
    [self setView:securityView];
    
    [securityView setBaseViewDelegate:self];
    [securityView setSecurityDelegate:self];
    
    [self.navigationItem setTitle:@"Security"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [BaseView colorWithHexString:THEME_COLOR];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)animateSwitch:(UIButton *)switchButton withIcon:(UIImageView *)icon {
    if([switchButton isSelected]) {
        [UIView animateWithDuration:0.25
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [icon setFrame:CGRectMake(6, 5, 40, 22)];
                             
                         }
                         completion:^(BOOL finished){
                             [icon setImage:[UIImage imageNamed:@"switch_off"]];
                         }];
        
        [switchButton setSelected:NO];
        
    } else {
        [UIView animateWithDuration:0.25
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [icon setFrame:CGRectMake(switchButton.frame.size.width - 46, 5, 40, 22)];
                             
                         }
                         completion:^(BOOL finished){
                             [icon setImage:[UIImage imageNamed:@"switch_on"]];
                         }];
        
        [switchButton setSelected:YES];
        
    }
    
    [securityView.updateButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [securityView.updateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [securityView.updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
}

#pragma  mark SecurityViewDelegate methods

-(IBAction)onSMSButtonTap:(id)sender {
    NSLog(@"SMS BUTTON TAPPED");
    UIButton *smsButton = (UIButton *)sender;
    
    [self animateSwitch:smsButton withIcon:securityView.smsSwitchIcon];
    
//    if([smsButton isSelected]) {
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setObject:@"1" forKey:@"smsSwitch"];
//        [defaults synchronize];
//        
//    } else {
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setObject:@"0" forKey:@"smsSwitch"];
//        [defaults synchronize];
//        
//    }
    
}

-(IBAction)onEmailButtonTap:(id)sender {
    NSLog(@"EMAIL BUTTON TAPPED");
    UIButton *emailButton = (UIButton *)sender;
    
    [self animateSwitch:emailButton withIcon:securityView.emailSwitchIcon];
    
//    if([emailButton isSelected]) {
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setObject:@"1" forKey:@"emailSwitch"];
//        [defaults synchronize];
//        
//    } else {
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setObject:@"0" forKey:@"emailSwitch"];
//        [defaults synchronize];
//        
//    }
    
}

-(IBAction)onResetButtonTap:(id)sender {
    NSLog(@"RESET BUTTON TAPPDED");
//    UIButton *resetButton = (UIButton *)sender;
//    [resetButton setUserInteractionEnabled:NO];
    [securityView.resetIcon setImage:[UIImage imageNamed:@"check"]];
    
    [securityView.updateButton setBackgroundColor:[BaseView colorWithHexString:@"A9D9AA"]];
    [securityView.updateButton setTitleColor:[BaseView colorWithHexString:@"1E241E"] forState:UIControlStateNormal];
    [securityView.updateButton setTitle:@"NEW PASSWORD SENT TO EMAIL" forState:UIControlStateNormal];
    [securityView.updateButton setSelected:YES];
}

-(IBAction)onUpdateButtonTap:(id)sender {
    UIButton *updateButton = (UIButton *)sender;
    
    if([updateButton isSelected]) {
        [updateButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [updateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [updateButton setSelected:NO];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"New password sent to email"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [securityView.resetIcon setImage:[UIImage imageNamed:@"arrow-right"]];
        [securityView.updateButton setSelected:NO];
        
    } else {
        
        [securityView.updateButton setBackgroundColor:[BaseView colorWithHexString:@"A9D9AA"]];
        [securityView.updateButton setTitleColor:[BaseView colorWithHexString:@"1E241E"] forState:UIControlStateNormal];
        [securityView.updateButton setTitle:@"UPDATE SUCCESSFUL" forState:UIControlStateNormal];
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
//                                                        message:@"Update button clicked"
//                                                       delegate:self
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];
//        NSLog(@"UPDATE");
    }
}

@end
