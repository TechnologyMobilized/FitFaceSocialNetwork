//
//  RequestViewController.h
//  fitface
//
//  Created by LLDM 0037 on 4/20/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "RequestView.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface RequestViewController : BaseViewController <RequestViewDelegate> {
    RequestView *requestView;
    UIView *whereChoiceSelected;
    UIView *whatChoiceSelected;
}

@end
