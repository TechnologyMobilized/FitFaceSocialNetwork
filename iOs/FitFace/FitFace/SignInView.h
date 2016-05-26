//
//  SignInView.h
//  fitface
//
//  Created by Launch Labs on 2/9/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "BaseView.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@protocol SignInViewDelegate;

@interface SignInView : BaseView<BaseViewDelegate,UITextFieldDelegate>{
    UIScrollView *scrollView;
    
}

@property (nonatomic, strong) id <SignInViewDelegate> signInViewDelegate;
@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (weak, nonatomic) FBSDKLoginButton *loginButton;

@end

@protocol SignInViewDelegate <NSObject>
- (IBAction) btnSignUpClicked:(id)sender;
- (IBAction) btnContinueClicked:(id)sender;
- (IBAction) btnForgotCredentialsClicked:(id)sender;
- (IBAction) onFacebookButtonTap:(id)sender;
- (IBAction) onInstagramButtonTap:(id)sender;
@end
