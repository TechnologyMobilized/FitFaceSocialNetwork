//
//  SignInView.m
//  fitface
//
//  Created by Launch Labs on 2/9/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "SignInView.h"

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;



@implementation SignInView{
    float animatedDistance;
}
@synthesize signInViewDelegate,usernameField,passwordField;

- (void)setupLayout{
    [self setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    
    UIView *viewMain = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self addSubview:viewMain];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, viewMain.frame.size.width, viewMain.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [viewMain addSubview:scrollView];
    
    //header screen
    UIView *viewHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewMain.frame.size.width, 315)];
//    [viewHeader.layer setBorderWidth:2];
    [scrollView addSubview:viewHeader];
    
    UIImageView *ivHeaderImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner"]];
    [ivHeaderImage setFrame:viewHeader.frame];
    
    [viewHeader addSubview:ivHeaderImage];
    
    //Logo container
    UIView *viewLogoContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 230, 230)];
    [viewLogoContainer setCenter:CGPointMake(viewHeader.frame.size.width/2, viewHeader.frame.size.height/2)];
//    [viewLogoContainer setBackgroundColor:[UIColor greenColor ]];
    [viewHeader addSubview:viewLogoContainer];
    //logo
    float logoDimen = (viewLogoContainer.frame.size.height/3) *2; //two thirds of the container height
    UIImageView *ivLogo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, logoDimen, logoDimen)];
    [ivLogo setImage:[UIImage imageNamed:@"ic_logo"]];
    [ivLogo setCenter:CGPointMake(viewLogoContainer.frame.size.width/2, ivLogo.center.y)];
    [viewLogoContainer addSubview:ivLogo];
    
    //app title
    UIImageView *lblTitle = [[UIImageView alloc]initWithFrame:CGRectMake(78, ivLogo.frame.size.height + ivLogo.frame.origin.y+5, 163, 44)];
    [lblTitle setImage:[UIImage imageNamed:@"text"]];
    [lblTitle setCenter:CGPointMake(viewLogoContainer.frame.size.width/2, lblTitle.center.y)];
    [viewLogoContainer addSubview:lblTitle];
    
    //buttons container
    UIView *viewTabButtonsContainer = [[UIView alloc]initWithFrame:CGRectMake(0, viewHeader.frame.size.height-40, viewHeader.frame.size.width, 40)];
    [viewTabButtonsContainer setBackgroundColor:[[UIColor lightTextColor ] colorWithAlphaComponent:0.3]];
    [viewHeader addSubview:viewTabButtonsContainer];
    
    //sign in
    UIButton *btnSignIn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, viewTabButtonsContainer.frame.size.width/2, viewTabButtonsContainer.frame.size.height)];
//    [btnSignIn setTitle:@"SIGN IN" forState:UIControlStateNormal];
    
    NSMutableAttributedString *strSignIn = [[BaseView setCharacterSpacingWithString:@"SIGN IN"] mutableCopy];
    [strSignIn addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, strSignIn.length)];
    
    [btnSignIn setAttributedTitle:strSignIn forState:UIControlStateNormal];
    [btnSignIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnSignIn.titleLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [viewTabButtonsContainer addSubview:btnSignIn];
    
    UIView *viewBtnHighlight = [[UIView alloc]initWithFrame:CGRectMake(0, viewTabButtonsContainer.frame.size.height-2, viewTabButtonsContainer.frame.size.width/2, 2)];
    [viewBtnHighlight setBackgroundColor:[BaseView colorWithHexString:HIGHLIGHT]];
    [viewTabButtonsContainer addSubview:viewBtnHighlight];
    
    
    //signup
    UIButton *btnSignUp = [[UIButton alloc]initWithFrame:CGRectMake(btnSignIn.frame.size.width +btnSignIn.frame.origin.x, 0, viewTabButtonsContainer.frame.size.width/2, viewTabButtonsContainer.frame.size.height)];
    [btnSignUp addTarget:signInViewDelegate action:@selector(btnSignUpClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableAttributedString *strSignUp = [[BaseView setCharacterSpacingWithString:@"SIGN UP"] mutableCopy];
    [strSignUp addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, strSignUp.length)];
//    [btnSignUp setTitle:@"SIGN UP" forState:UIControlStateNormal];
    [btnSignUp setAttributedTitle:strSignUp forState:UIControlStateNormal];
    [btnSignUp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnSignUp.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [viewTabButtonsContainer addSubview:btnSignUp];
    
    UIButton *facebookButton = [[UIButton alloc]initWithFrame:CGRectMake(16, viewHeader.frame.size.height + 16, 134, 44)];
    [facebookButton.layer setBorderColor:[BaseView colorWithHexString:THEME_COLOR].CGColor];
    [facebookButton.layer setBorderWidth:1.0];
    [facebookButton.layer setCornerRadius:1.0];
    [facebookButton setTitle:@"FACEBOOK" forState:UIControlStateNormal];
    [facebookButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [facebookButton setTitleColor:[BaseView colorWithHexString:THEME_COLOR] forState:UIControlStateNormal];
    [facebookButton addTarget:self.signInViewDelegate action:@selector(onFacebookButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:facebookButton];
    
    UIButton *instagramButton = [[UIButton alloc]initWithFrame:CGRectMake(facebookButton.frame.size.width + facebookButton.frame.origin.x + 16, facebookButton.frame.origin.y, 134, 44)];
    [instagramButton.layer setBorderColor:[BaseView colorWithHexString:THEME_COLOR].CGColor];
    [instagramButton.layer setBorderWidth:1.0];
    [instagramButton.layer setCornerRadius:1.0];
    [instagramButton setTitle:@"INSTAGRAM" forState:UIControlStateNormal];
    [instagramButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [instagramButton setTitleColor:[BaseView colorWithHexString:THEME_COLOR] forState:UIControlStateNormal];
    [instagramButton addTarget:self.signInViewDelegate action:@selector(onInstagramButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:instagramButton];
    
    UIImageView *usernameIcon = [[UIImageView alloc]initWithFrame:CGRectMake(20, facebookButton.frame.size.height + facebookButton.frame.origin.y + 20, 14, 20)];
    [usernameIcon setImage:[UIImage imageNamed:@"ic_user"]];
    [scrollView addSubview:usernameIcon];
    
    self.usernameField = [[UITextField alloc]initWithFrame:CGRectMake(usernameIcon.frame.size.width + usernameIcon.frame.origin.x + 14, usernameIcon.frame.origin.y, 250, 20)];
    [self.usernameField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                              NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:11]	}]];
    [self.usernameField setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [self.usernameField setReturnKeyType:UIReturnKeyNext];
    [self.usernameField setDelegate:self];
    [self.usernameField addTarget:self action:@selector(inputFocused:) forControlEvents:UIControlEventEditingDidBegin];
    [self.usernameField addTarget:self action:@selector(inputOffFocused) forControlEvents:UIControlEventEditingDidEnd];
    [self.usernameField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [scrollView addSubview:self.usernameField];
    
    UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(16, self.usernameField.frame.size.height + self.usernameField.frame.origin.y + 8, scrollView.frame.size.width - 32, 1)];
    [viewLine setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:viewLine];
    
    UIImageView *passwordIcon = [[UIImageView alloc]initWithFrame:CGRectMake(20, viewLine.frame.size.height + viewLine.frame.origin.y + 12, 14, 20)];
    [passwordIcon setImage:[UIImage imageNamed:@"ic_lock"]];
    [scrollView addSubview:passwordIcon];
    
    self.passwordField = [[UITextField alloc]initWithFrame:CGRectMake(passwordIcon.frame.size.width + passwordIcon.frame.origin.x + 14, passwordIcon.frame.origin.y, 250, 20)];
    [self.passwordField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                                NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:11]	}]];
    [self.passwordField setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [self.passwordField setReturnKeyType:UIReturnKeyNext];
    [self.passwordField setDelegate:self];
    [self.passwordField addTarget:self action:@selector(inputFocused:) forControlEvents:UIControlEventEditingDidBegin];
    [self.passwordField addTarget:self action:@selector(inputOffFocused) forControlEvents:UIControlEventEditingDidEnd];
    [self.passwordField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [self.passwordField setSecureTextEntry:YES];
    [scrollView addSubview:self.passwordField];
    
    viewLine = [[UIView alloc] initWithFrame:CGRectMake(16, self.passwordField.frame.size.height + self.passwordField.frame.origin.y + 8, scrollView.frame.size.width - 32, 1)];
    [viewLine setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:viewLine];
    
    UIButton *btnContinue = [[UIButton alloc]initWithFrame:CGRectMake(16, viewLine.frame.origin.y + viewLine.frame.size.height + 12, scrollView.frame.size.width - 32, 50)];
    [btnContinue addTarget:signInViewDelegate action:@selector(btnContinueClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnContinue setTitle:@"CONTINUE" forState:UIControlStateNormal];
    [btnContinue.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [btnContinue setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [scrollView addSubview:btnContinue];
    
    UIButton *btnForgot = [[UIButton alloc]initWithFrame:CGRectMake(16, btnContinue.frame.origin.y + btnContinue.frame.size.height, btnContinue.frame.size.width, 40)];
    [btnForgot addTarget:signInViewDelegate action:@selector(btnForgotCredentialsClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnForgot setTitle:@"Forgot Credentials" forState:UIControlStateNormal];
    [btnForgot setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btnForgot.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [scrollView addSubview:btnForgot];
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, btnForgot.frame.size.height + btnForgot.frame.origin.y)];
    
    ///
    /// USERNAME
    ///
    //username container
//    UIView *viewUsernameContainer= [[UIView alloc]initWithFrame:CGRectMake(20, facebookButton.frame.size.height + facebookButton.frame.origin.y + 12, viewPadding.frame.size.width, 36)];
//    
//    //icon
//    UIImageView *ivUsernameIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_user"]];
//    [ivUsernameIcon setFrame:CGRectMake(0, 20, 15, 20)];
//    [viewUsernameContainer addSubview:ivUsernameIcon];
//    
//    //textfield
//    txtUsername = [[UITextField alloc]initWithFrame:CGRectMake(ivUsernameIcon.frame.origin.x + ivUsernameIcon.frame.size.width + 10, ivUsernameIcon.frame.origin.y, viewUsernameContainer.frame.size.width - (ivUsernameIcon.frame.origin.x + ivUsernameIcon.frame.size.width +20), ivUsernameIcon.frame.size.height)];
//    [txtUsername setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],
//                                                                                                              NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:11]	}]];
//    [txtUsername setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
//    [txtUsername setReturnKeyType:UIReturnKeyNext];
//    [txtUsername setDelegate:self];
//    [txtUsername addTarget:self action:@selector(inputFocused:) forControlEvents:UIControlEventEditingDidBegin];
//    [txtUsername addTarget:self action:@selector(inputOffFocused) forControlEvents:UIControlEventEditingDidEnd];
//    [txtUsername setAutocorrectionType:UITextAutocorrectionTypeNo];
//    [viewUsernameContainer addSubview:txtUsername];
//    
//    [txtUsername setBackgroundColor:[UIColor redColor]];
////    [viewUsernameContainer setBackgroundColor:[UIColor grayColor]];
//    
//    //add line
//    UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, viewUsernameContainer.frame.size.height + viewUsernameContainer.frame.origin.y-1, viewUsernameContainer.frame.size.width, 1)];
//    [viewLine setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
//    [viewUsernameContainer addSubview:viewLine];
//    
//    
//    [viewInputContainer addSubview:viewUsernameContainer];
//    
//    ///
//    ///  PASSWORD
//    ///
//    
//    //password container
//    UIView *viewPasswordContainer= [[UIView alloc]initWithFrame:CGRectMake(0, viewUsernameContainer.frame.size.height + viewUsernameContainer.frame.origin.y, viewPadding.frame.size.width, 50)];
//    
//    //icon
//    UIImageView *ivPasswordIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_lock"]];
//    [ivPasswordIcon setFrame:CGRectMake(0, 20, 15, 20)];
//    [viewPasswordContainer addSubview:ivPasswordIcon];
//    
//    //textfield
//    txtPassword = [[UITextField alloc]initWithFrame:CGRectMake(ivPasswordIcon.frame.origin.x + ivPasswordIcon.frame.size.width + 10, ivPasswordIcon.frame.origin.y, viewPasswordContainer.frame.size.width - (ivPasswordIcon.frame.origin.x + ivPasswordIcon.frame.size.width +20), ivPasswordIcon.frame.size.height)];
//    
//    [txtPassword setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName  :[UIFont fontWithName:AVENIR_BOOK size:11]}]];
//    [txtPassword setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
//    [txtPassword setReturnKeyType:UIReturnKeyDone];
//    [txtPassword setDelegate:self];
//    [txtPassword setSecureTextEntry:YES];
//    [txtPassword addTarget:self action:@selector(inputFocused:) forControlEvents:UIControlEventEditingDidBegin];
//    [txtPassword addTarget:self action:@selector(inputOffFocused) forControlEvents:UIControlEventEditingDidEnd];
//    [txtPassword setAutocorrectionType:UITextAutocorrectionTypeNo];
//    [viewPasswordContainer addSubview:txtPassword];
//    
//    [viewPasswordContainer setBackgroundColor:[UIColor brownColor]];
//    //add line
//    UIView *viewLine2 = [[UIView alloc] initWithFrame:CGRectMake(0, viewPasswordContainer.frame.size.height-1, viewPasswordContainer.frame.size.width, 1)];
//    [viewLine2 setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
//    [viewPasswordContainer addSubview:viewLine2];
//    [viewPadding addSubview:viewPasswordContainer];
    
    ///
    /// CONTINUE
    ///
    
//    UIButton *btnContinue = [[UIButton alloc]initWithFrame:CGRectMake(0, viewPasswordContainer.frame.origin.y+ viewPasswordContainer.frame.size.height +20, viewPadding.frame.size.width, 50)];
//    [btnContinue addTarget:signInViewDelegate action:@selector(btnContinueClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [btnContinue setTitle:@"CONTINUE" forState:UIControlStateNormal];
//    [btnContinue.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
//    [btnContinue setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
//    [viewPadding addSubview:btnContinue];
//    
//    ///
//    /// Forgot Credentials
//    ///
//    
//    UIButton *btnForgot = [[UIButton alloc]initWithFrame:CGRectMake(0, btnContinue.frame.origin.y+ btnContinue.frame.size.height , viewPadding.frame.size.width, 40)];
//    [btnForgot addTarget:signInViewDelegate action:@selector(btnForgotCredentialsClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [btnForgot setTitle:@"Forgot Credentials" forState:UIControlStateNormal];
//    [btnForgot setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    [btnForgot.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
//    
//    [viewPadding addSubview:btnForgot];
    
//    loginButton = [[FBSDKLoginButton alloc] init];
//    loginButton.center = scrollView.center;
//    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
//    [loginButton setDelegate:self.signInViewDelegate];
//    [scrollView addSubview:loginButton];
    
}



#pragma textfield focus changes
- (void)inputFocused:(UIView*)sender{
    CGRect textFieldRect =
    [self.window convertRect:sender.bounds fromView:sender];
    CGRect viewRect =
    [self.window convertRect:self.bounds fromView:self];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame = self.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self setFrame:viewFrame];
    
    [UIView commitAnimations];
}
- (void) inputOffFocused{
    CGRect viewFrame = self.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self setFrame:viewFrame];
    
    [UIView commitAnimations];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if([textField isEqual:self.usernameField]){
        [self.passwordField becomeFirstResponder];
    }
    else
        [textField resignFirstResponder];
    return NO;
}
@end
