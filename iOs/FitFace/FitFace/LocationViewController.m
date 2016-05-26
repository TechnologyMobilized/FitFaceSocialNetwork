//
//  LocationViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

-(void)loadView {
    locationView = [[LocationView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [locationView setBaseViewDelegate:self];
    [locationView setLocationDelegate:self];
    
    [self setView:locationView];
    [locationView setupLayout];
    
    [self.navigationItem setTitle:@"Check-In"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    [checkinView checkinList:@[]];
    locations = [NSMutableArray arrayWithObjects:@"ABC Gym 1", @"ABC Gym 2", @"ABC Gym 3", nil];
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

-(IBAction)onButtonTap:(id)sender {
    
}

-(void)textFieldDidChange:(UITextField *)field {
    if([field.text length] == 0) {
//        [locationView.scrollView setHidden:YES];
        [locationView.scrollView removeFromSuperview];
    } else {
        [locationView.scrollView removeFromSuperview];
//        [locations removeLastObject];
        [locationView searchList:locations];
    }
}

@end
