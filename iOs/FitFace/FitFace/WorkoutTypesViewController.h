//
//  WorkoutTypesViewController.h
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "WorkoutTypeView.h"

@interface WorkoutTypesViewController : BaseViewController <WorkoutTypeDelegate> {
    WorkoutTypeView *workoutTypeView;
    NSMutableArray *types;
}

@end
