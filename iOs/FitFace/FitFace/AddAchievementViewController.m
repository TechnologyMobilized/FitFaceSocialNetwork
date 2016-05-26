//
//  AddAchievementViewController.m
//  fitface
//
//  Created by LLDM 0037 on 4/21/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "AddAchievementViewController.h"
#import "AchievementsViewController.h"

@interface AddAchievementViewController ()

@end

@implementation AddAchievementViewController


- (void)loadView {
    
    addAchievementView = [[AddAchievementView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [addAchievementView setBaseViewDelegate:self];
    [addAchievementView setAddAchievementDelegate:self];
    
    [addAchievementView setupLayout];
    [self setView:addAchievementView];
    
    [self addHeaderTitle:@"ADD ACHIEVEMENT"];
    
}

-(void)viewWillAppear:(BOOL)animated {
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            [btn setHidden:YES];
        }
    }
    
    [self.navigationItem setTitle:@"ADD ACHIEVEMENT"];
    
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"ic_dismiss"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(onCloseButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)addHeaderTitle:(NSString*)title{
    [self.navigationController.navigationBar.topItem setTitle:title];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:AVENIR_BOOK size:14] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}

-(IBAction)onCloseButtonTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - AddAchievementsViewDelegate method
-(IBAction)onAddButtonTap:(id)sender {
    AchievementsViewController *achievementView = [AchievementsViewController getInstance];
    [achievementView setEvent:addAchievementView.eventField.text];
    [achievementView setAchievementTitle:addAchievementView.achievementField.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate methods 
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
