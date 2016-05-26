//
//  AddAchievementView.h
//  fitface
//
//  Created by LLDM 0037 on 4/21/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol AddAchievementViewDelegate <UITextFieldDelegate>

-(IBAction)onAddButtonTap:(id)sender;

@end

@interface AddAchievementView : BaseView

@property (nonatomic, weak)id <AddAchievementViewDelegate> addAchievementDelegate;
@property (nonatomic, strong) UITextField *achievementField;
@property (nonatomic, strong) UITextField *eventField;

@end
