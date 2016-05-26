//
//  UpgradeView.h
//  fitface
//
//  Created by LLDM 0037 on 4/27/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol UpgradeViewDelegate

-(IBAction)onMenuButtonTap:(id)sender;
-(IBAction)onContinueButtonTap:(id)sender;

@end

@interface UpgradeView : BaseView

@property (nonatomic, weak)id <UpgradeViewDelegate> trainersDelegate;

@end
