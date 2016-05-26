
//
//  RequestViewController.m
//  fitface
//
//  Created by LLDM 0037 on 4/20/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "RequestViewController.h"

@interface RequestViewController ()

@end

@implementation RequestViewController

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [view setHidden:YES];
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            
            if([btn isHidden] != YES) {
                [btn removeFromSuperview];
                
            } else {
                [btn setHidden:NO];
            }
        }
    }
}

-(void)loadView {
    requestView = [[RequestView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [requestView setBaseViewDelegate:self];
    [requestView setRequestDelegate:self];
    [requestView setupLayout];
    [self setView:requestView];
    
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 18, 14)];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(onMenuButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:backButton]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    NSArray *whereArray = [NSArray arrayWithObjects:@"Fitness Pro Gym", @"Central Park", nil];
    [requestView addWhereChoices:whereArray];
    
    NSArray *whatArray = [NSArray arrayWithObjects:@"Football", @"Leg Work", nil];
    [requestView addWhatChoices:whatArray];
    
    [self.navigationItem setTitle:[NSString stringWithFormat:@"%@", @"Lionel Messi"]];
}

- (void)addHeaderTitle:(NSString*)title{
    [self.navigationController.navigationBar.topItem setTitle:title];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:AVENIR_BOOK size:14] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}

-(IBAction)onMenuButtonTap:(id)sender {
    if([self.sidePanelController centerPanelHidden]){
        [self.sidePanelController showCenterPanelAnimated:YES];
    }
    else [self.sidePanelController showRightPanelAnimated:YES];
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - mark RequestViewDelegate methods
-(void)onWhereChoiceTap:(UITapGestureRecognizer *)tap {
    UIView *tappedView = (UIView *)tap.view;
    if(tappedView == whereChoiceSelected) {
        if([tappedView.subviews.lastObject isHidden]) {
            [tappedView.subviews.lastObject setHidden:NO];
        } else {
            [tappedView.subviews.lastObject setHidden:YES];
        }
        
    } else {
        [whereChoiceSelected.subviews.lastObject setHidden:YES];
        [tappedView.subviews.lastObject setHidden:NO];
    }
    
    whereChoiceSelected = tappedView;
}

-(void)onWhatChoiceTap:(UITapGestureRecognizer *)tap {
    UIView *tappedView = (UIView *)tap.view;
    if(tappedView == whatChoiceSelected) {
        if([tappedView.subviews.lastObject isHidden]) {
            [tappedView.subviews.lastObject setHidden:NO];
        } else {
            [tappedView.subviews.lastObject setHidden:YES];
        }
        
    } else {
        [whatChoiceSelected.subviews.lastObject setHidden:YES];
        [tappedView.subviews.lastObject setHidden:NO];
    }
    
    whatChoiceSelected = tappedView;
}

-(IBAction)onSendButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
