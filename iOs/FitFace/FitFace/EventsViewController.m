//
//  EventsViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/2/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController

-(void)loadView {
    eventsView = [[EventsView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [eventsView setBaseViewDelegate:self];
    [eventsView setEventsDelegate:self];
    [self setView:eventsView];
    [eventsView setupLayout];
    
    [self.navigationItem setTitle:@"Events"];
    
    [eventsView eventsList:@[]];
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.barTintColor = [BaseView colorWithHexString:THEME_COLOR];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    UIButton *uploadButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 2, 17, 14)];
    [uploadButton setBackgroundImage:[UIImage imageNamed:@"upload"] forState:UIControlStateNormal];
    [uploadButton addTarget:self action:@selector(onUploadButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:uploadButton];
    
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onUploadButtonTap:(id)sender {
    NSLog(@"tapped");
}

-(void)onEventViewTap:(id)sender {
    EventPageViewController *eventPage = [[EventPageViewController alloc]init];
    [self.navigationController pushViewController:eventPage animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"HERE");
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height) {
        [eventsView eventsList:@[]];
    }
}

@end
