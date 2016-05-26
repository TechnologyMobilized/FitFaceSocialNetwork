//
//  SendMessageViewController.m
//  fitface
//
//  Created by LLDM 0037 on 4/22/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "SendMessageViewController.h"

@interface SendMessageViewController ()

@end

@implementation SendMessageViewController

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
    sendMessageView = [[SendMessageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [sendMessageView setBaseViewDelegate:self];
    [sendMessageView setSendMessageDelegate:self];
    [sendMessageView setupLayout];
    [self setView:sendMessageView];
    
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
    [self.navigationItem setTitle:[NSString stringWithFormat:@"%@", @"Lionel Messi"]];
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

#pragma mark - SendMessageDelegate methods 
-(void)onSendMessageButtonTap:(id)sender {
    
}

#pragma mark - UITextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
