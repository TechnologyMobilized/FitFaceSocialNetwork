//
//  PreferencesViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PreferencesView.h"
#import "MatchListViewController.h"

@interface PreferencesViewController : BaseViewController {
    PreferencesView *preferencesView;
    UIButton *previousButton;
}

@end
