//
//  TrainersViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "TrainersViewController.h"
#import "HomeViewController.h"

@interface TrainersViewController ()

@end

@implementation TrainersViewController

-(void)loadView {
    trainersView = [[TrainersView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [trainersView setBaseViewDelegate:self];
    [trainersView setTrainersDelegate:self];
    
    [trainersView setupLayout];
    [self setView:trainersView];
    
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
