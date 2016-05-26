//
//  NotificationsViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/17/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController ()

@end

@implementation NotificationsViewController

-(void)loadView {
    notificationsView = [[NotificationsView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [notificationsView setBaseViewDelegate:self];
    [notificationsView setNotificationsDelegate:self];
    
    [notificationsView setupLayout];
    [self setView:notificationsView];
    
    [self.navigationItem setTitle:@"Notifications"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    daysArray = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"14", @"21", @"30", @"60", @"90", nil];
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
}

#pragma mark - NotificationsViewDelegate methods
-(IBAction)onNewMessagesButtonTap:(id)sender {
    UIButton *button = (UIButton *)sender;
    [self animateSwitch:button withIcon:notificationsView.messagesIcon];
}

-(IBAction)onRequestButtonTap:(id)sender {
    UIButton *button = (UIButton *)sender;
    [self animateSwitch:button withIcon:notificationsView.requestIcon];
}

-(IBAction)onNoLoginButtonTap:(id)sender {
    UIButton *button = (UIButton *)sender;
    [self animateSwitch:button withIcon:notificationsView.noLoginIcon];
}

-(IBAction)onNotificationButtonTap:(id)sender {
    UIButton *notifButton = (UIButton *)sender;
    
    if([notifButton isSelected]) {
        [notificationsView.notificationIcon setHidden:YES];
    } else {
        [notificationsView.notificationIcon setHidden:NO];
    }
    
    [notifButton setSelected:!notifButton.selected];
    
}

-(IBAction)onEmailButtonTap:(id)sender {
    UIButton *emailButton = (UIButton *)sender;
    
    if([emailButton isSelected]) {
        [notificationsView.emailIcon setHidden:YES];
    } else {
        [notificationsView.emailIcon setHidden:NO];
    }
    
    [emailButton setSelected:!emailButton.selected];
}

-(IBAction)onSMSButtonTap:(id)sender {
    UIButton *smsButton = (UIButton *)sender;
    
    if([smsButton isSelected]) {
        [notificationsView.smsIcon setHidden:YES];
    } else {
        [notificationsView.smsIcon setHidden:NO];
    }
    
    [smsButton setSelected:!smsButton.selected];
}

-(IBAction)onUpdateButtonTap:(id)sender {
    UIButton *updateButton = (UIButton *)sender;
    [updateButton setBackgroundColor:[BaseView colorWithHexString:@"D2EBD4"]];
    [updateButton setTitle:@"SUCCESSFULLY UPDATED" forState:UIControlStateNormal];
    [updateButton setTitleColor:[BaseView colorWithHexString:@"748074"] forState:UIControlStateNormal];
}

#pragma mark PickerView DataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [daysArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    
    return daysArray[row];
}

#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    float rate = [_exchangeRates[row] floatValue];
//    float dollars = [_dollarText.text floatValue];
//    float result = dollars * rate;
//    
//    NSString *resultString = [[NSString alloc] initWithFormat:
//                              @"%.2f USD = %.2f %@", dollars, result,
//                              _countryNames[row]];
//    _resultLabel.text = resultString;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *days= (UILabel*)view;
    if (!days){
        days = [[UILabel alloc] init];
        
        // Setup label properties - frame, font, colors etc
        [days setFrame:CGRectMake(0, 0, pickerView.frame.size.width, pickerView.frame.size.height - 20)];
        [days setFont:[UIFont fontWithName:AVENIR_HEAVY size:11]];
        [days setTextColor:[UIColor blackColor]];
        [days setTextAlignment:NSTextAlignmentCenter];
        
    }
    
    // Fill the label text here
    [days setText:[NSString stringWithFormat:@"%@", [daysArray objectAtIndex:row]]];
    
    return days;
}

@end
