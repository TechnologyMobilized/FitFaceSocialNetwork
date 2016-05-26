//
//  WorkoutTypesViewController.m
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "WorkoutTypesViewController.h"

@interface WorkoutTypesViewController ()

@end

@implementation WorkoutTypesViewController

-(void)loadView {
    workoutTypeView = [[WorkoutTypeView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [workoutTypeView setBaseViewDelegate:self];
    [workoutTypeView setWorkoutTypeDelegate:self];
    
    [self setView:workoutTypeView];
    [workoutTypeView setupLayout];
    
    [self.navigationItem setTitle:@"Types of Workout"];
    
    types = [NSMutableArray arrayWithObjects:@"Cardio", @"Cutting/Shredding", @"High Intensity",
             @"Heavy Weights", @"Medium Weights", @"Light Weights", nil];
    
    [workoutTypeView workoutTypesList:types];
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

-(IBAction)onMoreButtonTap:(id)sender {
//    NSLog(@"MORE BUTTON TAPPED");
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
//                                                    message:@"More button clicked"
//                                                   delegate:self
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
    [workoutTypeView displayPopup];
}

#pragma mark - WorkoutTypeDelegate methods
-(IBAction)onMatchesOnlyTap:(id)sender {
    NSLog(@"MATCHES ONLY BUTTON TAPPED");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Matches Only button clicked"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == [alertView cancelButtonIndex]){
        //cancel clicked ...do your action
        
        [workoutTypeView displayPopup];
        
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"HERE");
    
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height) {
        [workoutTypeView workoutTypesList:types];
    }
}

@end
