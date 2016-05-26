//
//  TrainersViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "TrainersView.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface TrainersViewController : BaseViewController <TrainersViewDelegate> {
    TrainersView *trainersView;
}

@end
