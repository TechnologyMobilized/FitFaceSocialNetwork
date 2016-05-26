//
//  CheckinViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CheckinView.h"
#import "LocationViewController.h"
#import "ConversationViewController.h"
#import "ProfileViewController.h"

@interface CheckinViewController : BaseViewController <CheckinViewDelegate> {
    CheckinView *checkinView;
}

@end
