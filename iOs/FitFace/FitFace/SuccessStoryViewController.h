//
//  SuccessStoryViewController.h
//  fitface
//
//  Created by LLDM 0037 on 4/29/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SuccessStoryView.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface SuccessStoryViewController : BaseViewController<SuccessStoryViewDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate> {
    SuccessStoryView *successStoryView;
    UIButton *selectedButton;
}

@end
