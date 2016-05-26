//
//  DatabaseViewController.m
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "DatabaseViewController.h"

@interface DatabaseViewController ()

@end

@implementation DatabaseViewController

-(void)loadView {
    databaseView = [[DatabaseView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [databaseView setupLayout];
    [self setView:databaseView];
    
    [databaseView setBaseViewDelegate:self];
    [databaseView setDatabaseDelegate:self];
    
    [self addHeaderTitle:@"Database"];
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

- (void)addHeaderTitle:(NSString*)title{
    [self.navigationController.navigationBar.topItem setTitle:title];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:AVENIR_BOOK size:14] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}

-(void)alertMessageDisplay {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Functionality coming soon"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.sidePanelController showRightPanelAnimated:YES];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController: [[HomeViewController alloc] init] ];
    [self.sidePanelController setCenterPanel:nil];
    
    [self.sidePanelController setCenterPanel:navController];
    [self.sidePanelController showCenterPanelAnimated:YES];
}

#pragma mark - DatabaseViewDelegate methods

-(IBAction)onGymsButtonTap:(id)sender {
    NSLog(@"GYMS BUTTON TAPPED");
    
    GymsViewController *gymsView = [[GymsViewController alloc]init];
    [self.navigationController pushViewController:gymsView animated:YES];
}

-(IBAction)onOutdoorsButtonTap:(id)sender {
    NSLog(@"OUTDOORS BUTTON TAPPED");
    
    OutdoorPlacesViewController *outdoorPlaces = [[OutdoorPlacesViewController alloc]init];
    [self.navigationController pushViewController:outdoorPlaces animated:YES];
}

-(IBAction)onTypesOfWorkoutButtonTap:(id)sender {
    NSLog(@"TYPES OF WORKOUT BUTTON TAPPED");
    
    WorkoutTypesViewController *workoutTypes = [[WorkoutTypesViewController alloc]init];
    [self.navigationController pushViewController:workoutTypes animated:YES];
    
}

-(IBAction)onSportsButtonTap:(id)sender {
    NSLog(@"SPORTS BUTTON TAPPED");
    
    SportsViewController *sportsView = [[SportsViewController alloc]init];
    [self.navigationController pushViewController:sportsView animated:YES];
}

-(IBAction)onEventsButtonTap:(id)sender {
    NSLog(@"EVENTS BUTTON TAPPED");
    
    EventsViewController *eventsView = [[EventsViewController alloc]init];
    [self.navigationController pushViewController:eventsView animated:YES];
    
}

-(IBAction)onFitnessPartnersButtonTap:(id)sender {
    NSLog(@"FITNESS PARTNERS BUTTON TAPPED");
    
    FitnessPartnersViewController *fitnessPartnersView = [[FitnessPartnersViewController alloc]init];
    [self.navigationController pushViewController:fitnessPartnersView animated:YES];
    
}

-(IBAction)onCheckinButtonTap:(id)sender {
    NSLog(@"CHECK-IN BUTTON TAPPED");
    
    CheckinViewController *checkinView = [[CheckinViewController alloc]init];
    [self.navigationController pushViewController:checkinView animated:YES];
    
}

-(IBAction)onRoutinesButtonTap:(id)sender {
    NSLog(@"ROUTINES BUTTON TAPPED");
    [self alertMessageDisplay];
    
}

-(IBAction)onDietButtonTap:(id)sender; {
    NSLog(@"DIETS BUTTON TAPPED");
    [self alertMessageDisplay];
    
}

-(IBAction)onPlaylistButtonTap:(id)sender {
    
    if(isConnected) {
        [databaseView.connectionText setText:@"NOT CONNECTED"];
        [databaseView.connectionImage setImage:[UIImage imageNamed:@"spotify-gray"]];
        [databaseView.connectionText setTextColor:[BaseView colorWithHexString:@"878787"]];
        isConnected = NO;
        
    } else {
        [databaseView.connectionText setText:@"CONNECTED"];
        [databaseView.connectionImage setImage:[UIImage imageNamed:@"spotify-green"]];
        [databaseView.connectionText setTextColor:[BaseView colorWithHexString:@"A9D106"]];
        isConnected = YES;
        
    }
}

-(IBAction)onOthersButtonTap:(id)sender {
    NSLog(@"OTHERS BUTTON TAPPED");
    [self alertMessageDisplay];
    
}

@end
