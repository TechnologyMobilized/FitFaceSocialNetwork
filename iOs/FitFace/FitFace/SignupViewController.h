//
//  SignupViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/4/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SignupView.h"
#import "JASidePanelController.h"
#import "HomeViewController.h"
#import "MenuViewController.h"

@interface SignupViewController : BaseViewController <SignupViewDelegate> {
    SignupView *signupView;
    UITextField *selectedTextfield;
    float animatedDistance;
}

@end
