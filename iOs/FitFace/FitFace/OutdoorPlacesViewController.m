//
//  OutdoorPlacesViewController.m
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "OutdoorPlacesViewController.h"

@interface OutdoorPlacesViewController ()

@end

@implementation OutdoorPlacesViewController

-(void)loadView {
    outdoorPlacesView = [[OutdoorPlaces alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [outdoorPlacesView setBaseViewDelegate:self];
    [outdoorPlacesView setOutdoorPlacesDelegate:self];
    
    [self setView:outdoorPlacesView];
    [outdoorPlacesView setupLayout];
    
    [self.navigationItem setTitle:@"Outdoor Places"];
    
    [outdoorPlacesView outdoorPlacesList:@[]];
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.barTintColor = [BaseView colorWithHexString:THEME_COLOR];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController setNavigationBarHidden:NO];
    
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
    NSLog(@"UPLOAD BUTTON TAPPED");
    PlaceViewController *placesView = [[PlaceViewController alloc]init];
    [self.navigationController pushViewController:placesView animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height) {
        [outdoorPlacesView outdoorPlacesList:@[]];
    }
}

@end
