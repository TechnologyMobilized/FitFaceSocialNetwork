//
//  TrainersView.h
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol TrainersViewDelegate

-(IBAction)onMenuButtonTap:(id)sender;
-(IBAction)onContinueButtonTap:(id)sender;

@end

@interface TrainersView : BaseView

@property (nonatomic, weak)id <TrainersViewDelegate> trainersDelegate;

@end
