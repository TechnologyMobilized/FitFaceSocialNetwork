//
//  AboutViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "AboutView.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import <MessageUI/MessageUI.h>

@interface AboutViewController : BaseViewController <MFMailComposeViewControllerDelegate> {
    AboutView *aboutView;
}

@end