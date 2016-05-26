//
//  EventPageViewController.m
//  fitface
//
//  Created by LLDM 0037 on 5/5/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "EventPageViewController.h"

@interface EventPageViewController ()

@end

@implementation EventPageViewController


-(void)loadView {
    eventPage = [[EventPage alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [eventPage setBaseViewDelegate:self];
//    [eventPage setPlaceDelegate:self];
    [eventPage setupLayout];
    [self setView:eventPage];
    
    [self.navigationItem setTitle:@"Event 1"];
}

-(void)viewWillAppear:(BOOL)animated {
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            [btn setHidden:YES];
        }
    }
    
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

@end
