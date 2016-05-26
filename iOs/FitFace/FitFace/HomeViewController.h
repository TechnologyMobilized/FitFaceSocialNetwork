//
//  HomeViewController.h
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "BaseViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "HomeView.h"
#import "ProfileViewController.h"
#import "DatabaseViewController.h"
#import "TrainersViewController.h"
#import "MotivateViewController.h"
#import "MatchesFoundViewController.h"
#import "UpgradeViewController.h"
#import "SuccessStoryViewController.h"
#import "PlaceViewController.h"

@interface HomeViewController : BaseViewController<HomeViewDelegate>{
    HomeView *homeView;
    
}

@property BOOL isFirstLoad;

@end
