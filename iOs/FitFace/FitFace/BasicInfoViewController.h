//
//  BasicInfoViewController.h
//  fitface
//
//  Created by LLDM 0037 on 2/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "BasicInfoView.h"

@interface BasicInfoViewController : BaseViewController <BasicInfoViewDelegate> {
    BasicInfoView *basicInfoView;
    UITextField *selectedTextfield;
    float animatedDistance;
}

@end
