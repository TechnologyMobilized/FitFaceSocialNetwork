//
//  GymsViewController.h
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "GymsView.h"
#import "HomeViewController.h"

@interface GymsViewController : BaseViewController <GymsViewDelegate> {
    GymsView *gymsView;
}

@end
