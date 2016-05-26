//
//  PlaceViewController.h
//  fitface
//
//  Created by LLDM 0037 on 5/4/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PlaceView.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface PlaceViewController : BaseViewController <PlaceViewDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate> {
    PlaceView *placeView;
    UIButton *selectedButton;
}

@property BOOL isFromHome;

@end
