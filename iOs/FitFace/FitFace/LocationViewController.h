//
//  LocationViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "LocationView.h"

@interface LocationViewController : BaseViewController <LocationViewDelegate> {
    LocationView *locationView;
    NSMutableArray *locations;
}

@end
