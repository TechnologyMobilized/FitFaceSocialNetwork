//
//  PreferencesViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "PreferencesViewController.h"

@interface PreferencesViewController ()

@end

@implementation PreferencesViewController

- (void)loadView {
    
    preferencesView = [[PreferencesView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [preferencesView setupLayout];
    [self setView:preferencesView];
    
    [preferencesView setBaseViewDelegate:self];
//    [preferencesView setHomeViewDelegate:self];
    
//    [self addRightPanel];
    
    [self.navigationController.navigationBar setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setTitle:@"On-The-Go Preferences"];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

-(IBAction)onBackButtonTap:(id)sender {
    
    NSLog(@"ON BACK BUTTON TAP");
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - PreferenceViewDelegate methods
-(IBAction)onMatchListButtonTap:(id)sender {
    
    NSLog(@"MATCH LIST BUTTON TAPPED");
    MatchListViewController *matchListView = [[MatchListViewController alloc]init];
    [self.navigationController pushViewController:matchListView animated:YES];
    
}

-(IBAction)onHourButtonTap:(id)sender {
    UIButton *button = (UIButton *)sender;
    
    if(previousButton == button) {
        
        NSLog(@"HAAAAA -- %d", [button isSelected]);
        if([button isSelected]) {
            [button setSelected:NO];
            [previousButton setSelected:NO];
        } else {
            NSLog(@"wut");
//            [button setSelected:YES];
            [button setSelected:NO];
            [button setBackgroundColor:[UIColor whiteColor]];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button.layer setBorderColor:[BaseView colorWithHexString:@"C1C2C2"].CGColor];
        }
        previousButton = nil;
        
    } else {
        [button setSelected:YES];
        
        if([button isSelected]) {
            NSLog(@"SELECTED");
            [button setSelected:NO];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
            [button.layer setBorderColor:[BaseView colorWithHexString:THEME_COLOR].CGColor];
            
            [previousButton setSelected:NO];
            [previousButton setBackgroundColor:[UIColor whiteColor]];
            [previousButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [previousButton.layer setBorderColor:[BaseView colorWithHexString:@"C1C2C2"].CGColor];
        }
        previousButton = button;
    }
    
}

-(IBAction)onDayButtonTap:(id)sender {
    UIButton *dayButton = (UIButton *)sender;
    
    if([dayButton isSelected]) {
        [dayButton setBackgroundColor:[UIColor whiteColor]];
        [dayButton.layer setBorderColor:[BaseView colorWithHexString:@"C1C2C2"].CGColor];
        [dayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    } else {
        [dayButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [dayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [dayButton.layer setBorderColor:[BaseView colorWithHexString:THEME_COLOR].CGColor];
    }
    
    [dayButton setSelected:![dayButton isSelected]];
}

-(IBAction)onSaveButtonTap:(id)sender {
    UIButton *saveButton = (UIButton *)sender;
    [saveButton setTitle:@"Successfully Updated" forState:UIControlStateNormal];
    [saveButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
}

@end
