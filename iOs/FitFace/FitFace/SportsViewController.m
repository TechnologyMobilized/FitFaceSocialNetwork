//
//  SportsViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/2/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "SportsViewController.h"

@interface SportsViewController ()

@end

@implementation SportsViewController

-(void)loadView {
    sportsView = [[SportsView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [sportsView setBaseViewDelegate:self];
    [sportsView setSportsDelegate:self];
    [self setView:sportsView];
    [sportsView setupLayout];
    
    [self.navigationItem setTitle:@"Sports"];
    
    sports = [NSMutableArray arrayWithObjects:@"Bike Riding", @"Football", @"Basketball", @"Baseball", @"Soccer", @"Wrestling", @"Volleyball", nil];
    
    [sportsView sportsList:sports];
}

-(void)viewWillAppear:(BOOL)animated {
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark SportsViewDelegate Methods
-(IBAction)onAllButtonTap:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"All button clicked"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(IBAction)onMatchesOnlyTap:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Matches Only button clicked"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex == [alertView cancelButtonIndex]){
//        //cancel clicked ...do your action
//        
//        [sportsView displayPopup];
//        
//    }
//}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"HERE");
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height) {
        [sportsView sportsList:sports];
    }
}

@end
