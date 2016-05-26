//
//  RadiusViewController.h
//  fitface
//
//  Created by LLDM 0037 on 4/22/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "RadiusView.h"

@interface RadiusViewController : BaseViewController <RadiusViewDelegate> {
    RadiusView *radiusView;
    UIView *selectedEntry;
}

@end
