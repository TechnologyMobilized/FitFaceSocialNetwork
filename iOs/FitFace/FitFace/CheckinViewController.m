//
//  CheckinViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "CheckinViewController.h"

@interface CheckinViewController ()

@end

@implementation CheckinViewController

-(void)loadView {
    checkinView = [[CheckinView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [checkinView setBaseViewDelegate:self];
    [checkinView setCheckinDelegate:self];
    [self setView:checkinView];
    [checkinView setupLayout];
    
    [checkinView checkinList:@[]];
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
    
    UIButton *locationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 14, 18)];
    [locationButton setBackgroundImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    [locationButton addTarget:self action:@selector(onLocationButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:locationButton];
    
    [self.navigationItem setTitle:@"Check-In"];
    
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onLocationButtonTap:(id)sender {
    NSLog(@"TAPPED LOCATION");
    
    LocationViewController *locationView = [[LocationViewController alloc]init];
    [self.navigationController pushViewController:locationView animated:YES];
    
}

#pragma mark - CheckinViewDelegate Methods
-(IBAction)onButtonTap:(id)sender {
    ConversationViewController *conversationView = [[ConversationViewController alloc]init];
    [self.navigationController pushViewController:conversationView animated:YES];
}

-(IBAction)onProfileButtonTap:(id)sender {
    ProfileViewController *profileView = [[ProfileViewController alloc]init];
    [profileView setFromFitnessScreen:YES];
    [self.navigationController pushViewController:profileView animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    
    if (bottomEdge >= scrollView.contentSize.height) {
        [checkinView checkinList:@[]];
    }
}

@end
