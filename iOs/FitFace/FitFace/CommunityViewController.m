//
//  CommunityViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "CommunityViewController.h"

@interface CommunityViewController ()

@end

@implementation CommunityViewController

-(void)loadView {
    communityView = [[CommunityView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [communityView setBaseViewDelegate:self];
    [communityView setCommunityDelegate:self];
    
    [communityView setupLayout];
    [self setView:communityView];
    
    [self.navigationController.navigationBar.topItem setTitle:@"Community Involvement"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:AVENIR_BOOK size:14] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [BaseView colorWithHexString:THEME_COLOR];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"ic_dismiss"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(onCloseButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
}

-(IBAction)onCloseButtonTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)onScreenTap:(UIGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return  YES;
}
@end
