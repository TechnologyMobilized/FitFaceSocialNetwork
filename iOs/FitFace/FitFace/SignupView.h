//
//  SignupView.h
//  fitface
//
//  Created by LLDM 0037 on 3/4/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol SignupViewDelegate <UITextFieldDelegate, UIActionSheetDelegate>

-(IBAction)onGenderButtonTap:(id)sender;
-(IBAction)onSecurityQuestionTap:(id)sender;
-(IBAction)onSignupButtonTap:(id)sender;
-(IBAction)onSigninButtonTap:(id)sender;
-(IBAction)onBackButtonTap:(id)sender;
-(void)screenTapped;

@end

@interface SignupView : BaseView {
    UIScrollView *scrollView;
    UITextField *gender;
    UITextField *questionField;
}

@property (nonatomic, weak) id <SignupViewDelegate> signupDelegate;

@end
