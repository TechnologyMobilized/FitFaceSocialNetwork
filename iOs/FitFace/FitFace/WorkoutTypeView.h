//
//  WorkoutTypeView.h
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol WorkoutTypeDelegate <UIScrollViewDelegate, UIActionSheetDelegate>

-(IBAction)onAllButtonTap:(id)sender;
-(IBAction)onMatchesOnlyTap:(id)sender;

@end

@interface WorkoutTypeView : BaseView {
    UIScrollView *scrollView;
    UIView *popupContainer;
    UIView *buttonsContainer;
    int yOrigin;
    int tag;
}

@property(nonatomic, weak) id<WorkoutTypeDelegate> workoutTypeDelegate;

-(void)workoutTypesList:(NSArray *)gymsArray;
-(void)displayPopup;

@end
