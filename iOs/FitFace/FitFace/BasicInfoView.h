//
//  BasicInfoView.h
//  fitface
//
//  Created by LLDM 0037 on 2/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol BasicInfoViewDelegate <UITextFieldDelegate, UIActionSheetDelegate>

-(IBAction)onGenderButtonTap:(id)sender;
-(IBAction)onSecurityQuestionTap:(id)sender;
-(void)onScreenTap:(UIGestureRecognizer *)sender;
//-(IBAction)onUpdateButtonTap:(id)sender;

@end

@interface BasicInfoView : BaseView {
    UITextField *name;
    UITextField *email;
    UITextField *age;
    UITextField *gender;
    UITextField *country;
    UITextField *securityQuestion;
    UITextField *answerField;
}

@property (nonatomic, weak) id <BasicInfoViewDelegate> basicInfoViewDelegate;

@end
