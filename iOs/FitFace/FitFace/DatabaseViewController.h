//
//  DatabaseViewController.h
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DatabaseView.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "HomeViewController.h"
#import "GymsViewController.h"
#import "OutdoorPlacesViewController.h"
#import "WorkoutTypesViewController.h"
#import "SportsViewController.h"
#import "EventsViewController.h"
#import "CheckinViewController.h"
#import "FitnessPartnersViewController.h"

@interface DatabaseViewController : BaseViewController <DatabaseViewDelegate> {
    DatabaseView *databaseView;
    BOOL isConnected;
}

@end
