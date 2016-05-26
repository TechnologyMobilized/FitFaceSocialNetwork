//
//  UpgradeViewController.h
//  fitface
//
//  Created by LLDM 0037 on 4/27/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UpgradeView.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface UpgradeViewController : BaseViewController <UpgradeViewDelegate> {
    UpgradeView *upgradeView;
}

@end
