//
//  ForgotUsernameView.h
//  fitface
//
//  Created by LLDM 0037 on 3/9/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol ForgotUsernameViewDelegate <UITextFieldDelegate>

-(IBAction)onBackButtonTap:(id)sender;
-(IBAction)onUsernameButtonTap:(id)sender;
-(IBAction)onPasswordButtonTap:(id)sender;
-(void)textFieldDidChange:(UITextField *)textfield;
-(IBAction)onSubmitButtonTap:(id)sender;
-(IBAction)onCancelButtonTap:(id)sender;
-(IBAction)onResetButtonTap:(id)sender;
//-(void)fillInUsername:(NSString *)userName;

@end

@interface ForgotUsernameView : BaseView

@property (nonatomic, weak) id<ForgotUsernameViewDelegate> forgotUsernameDelegate;
@property (nonatomic, strong) UIView *selector;
@property (nonatomic, strong) UIView *usernameContainer;
@property (nonatomic, strong) UIView *passwordContainer;
@property (nonatomic, strong) UIButton *submitButton;
@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) UIButton *usernameLabel;
@property (nonatomic, strong) UIButton *passwordLabel;
@property (nonatomic, strong) UILabel *username;
@property (nonatomic, strong) UILabel *correctName;
@property (nonatomic, strong) UILabel *wrongAnswerText;
@property (nonatomic, strong) UILabel *invalidEmailText;
@property (nonatomic, strong) UIView *endBorder;
@property (nonatomic, strong) UITextField *emailField;;

@end
