//
//  MatchListViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "MatchListViewController.h"

@interface MatchListViewController ()

@end

@implementation MatchListViewController

- (void)loadView {
    
    matchListView = [[MatchListView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [matchListView setBaseViewDelegate:self];
    [matchListView setMatchListDelegate:self];
    
    [matchListView setupLayout];
    [self setView:matchListView];
    
    [self.navigationController.navigationBar setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setTitle:@"Do Not Match"];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [matchListView matchList:@[]];
}

-(IBAction)onBackButtonTap:(id)sender {
    NSLog(@"BACK BUTTON TAPPED");
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"IN HERE");
    
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    
    if (bottomEdge >= scrollView.contentSize.height) {
        [matchListView matchList:@[]];
    }
}

#pragma mark - MatchListViewDelegate methods 
-(IBAction)onRemoveButtonTap:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Remove?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Remove", nil];
    
    [actionSheet showInView:self.view];
}

@end
