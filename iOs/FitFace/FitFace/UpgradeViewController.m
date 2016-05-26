//
//  UpgradeViewController.m
//  fitface
//
//  Created by LLDM 0037 on 4/27/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "UpgradeViewController.h"
#import "HomeViewController.h"

@interface UpgradeViewController ()

@end

@implementation UpgradeViewController

-(void)loadView {
    upgradeView = [[UpgradeView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [upgradeView setBaseViewDelegate:self];
    [upgradeView setTrainersDelegate:self];
    
    [upgradeView setupLayout];
    [self setView:upgradeView];
    
    [self.navigationController.navigationBar.topItem setTitle:@"Community Involvement"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:AVENIR_BOOK size:14] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)showAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Functionality Coming Soon"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - TrainersViewDelegate methods
-(void)onMenuButtonTap:(id)sender {
    
    if([self.sidePanelController centerPanelHidden]){
        [self.sidePanelController showCenterPanelAnimated:YES];
    } else
        [self.sidePanelController showRightPanelAnimated:YES];
}

-(IBAction)onContinueButtonTap:(id)sender {
//    [self showAlert];
    [self.sidePanelController showRightPanelAnimated:YES];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController: [[HomeViewController alloc] init] ];
    [self.sidePanelController setCenterPanel:nil];
    
    [self.sidePanelController setCenterPanel:navController];
    [self.sidePanelController showCenterPanelAnimated:YES];
    
}



@end
