//
//  ForgotUsernameViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/9/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ForgotUsernameView.h"

@interface ForgotUsernameViewController : BaseViewController<ForgotUsernameViewDelegate> {
    ForgotUsernameView *forgotUsername;
    NSArray *array;
    UIImageView *image;
    BOOL usernameSuccess;
}

@end
