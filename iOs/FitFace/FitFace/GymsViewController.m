//
//  GymsViewController.m
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "GymsViewController.h"

@interface GymsViewController ()

@end

@implementation GymsViewController

-(void)loadView {
    gymsView = [[GymsView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [gymsView setBaseViewDelegate:self];
    [gymsView setGymsDelegate:self];
    [self setView:gymsView];
    [gymsView setupLayout];
    
    [self.navigationItem setTitle:@"Gyms"];
    
    [gymsView gymsList:@[]];
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

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height) {
        [gymsView gymsList:@[]];
    }
}

@end
