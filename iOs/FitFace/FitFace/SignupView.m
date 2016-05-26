//
//  SignupView.m
//  fitface
//
//  Created by LLDM 0037 on 3/4/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "SignupView.h"

@implementation SignupView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, 100)];
    [background setImage:[UIImage imageNamed:@"header"]];
    [background setClipsToBounds:YES];
    [mainView addSubview:background];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, background.frame.size.height, mainView.frame.size.width, mainView.frame.size.height - background.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:scrollView];
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]initWithTarget:self.signupDelegate action:@selector(screenTapped)];
    [self addGestureRecognizer:tapped];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 24, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self.signupDelegate action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:backButton];
    
    UILabel *signupLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, background.frame.size.height - 48, mainView.frame.size.width, 48)];
    [signupLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"Sign Up"]];
    [signupLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:17]];
    [signupLabel setTextAlignment:NSTextAlignmentCenter];
    [signupLabel setTextColor:[UIColor  whiteColor]];
    [mainView addSubview:signupLabel];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(16, 16, mainView.frame.size.width - 32, 10)];
    [label setAttributedText: [BaseView setCharacterSpacingWithString:@"YOUR PERSONAL DETAILS"]];
    [label setTextColor:[BaseView colorWithHexString:@"154F98"]];
    [label setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [scrollView addSubview:label];
    
    UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake(21, label.frame.size.height + label.frame.origin.y + 12, mainView.frame.size.width - 37, 33)];
    [nameField setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [nameField setDelegate:self.signupDelegate];
    [nameField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [nameField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Name" attributes:@{
                                                                                                       NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                       NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                       }]];
    [scrollView addSubview:nameField];
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, nameField.frame.size.height + nameField.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:border];
    
    UITextField *emailField = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 12, mainView.frame.size.width - 37, 33)];
    [emailField setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [emailField setDelegate:self.signupDelegate];
    [emailField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [emailField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Email Address" attributes:@{
                                                                                                        NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                        NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                        }]];
    [scrollView addSubview:emailField];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, emailField.frame.size.height + emailField.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:border];
    
    UITextField *age = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 14, (nameField.frame.size.width - 21)/2, 32)];
    [age setDelegate:self.signupDelegate];
    [age setAutocorrectionType:UITextAutocorrectionTypeNo];
    [age setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Age" attributes:@{
                                                                                                 NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                 NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                 }]];
    
    [age setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [scrollView addSubview:age];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, age.frame.size.height + age.frame.origin.y, (mainView.frame.size.width - 48)/2, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:border];
    
    gender = [[UITextField alloc]initWithFrame:CGRectMake(border.frame.size.width + border.frame.origin.x + 21, age.frame.origin.y, (nameField.frame.size.width - 54)/2, 32)];
    [gender setDelegate:self.signupDelegate];
    [gender setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Sex" attributes:@{
                                                                                                       NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                       NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                       }]];
    [gender setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [scrollView addSubview:gender];
    
    UIImageView *dropdown = [[UIImageView alloc]initWithFrame:CGRectMake(gender.frame.origin.x + gender.frame.size.width + 2, gender.frame.origin.y + (gender.frame.size.height/2) - 2, (nameField.frame.size.width - 21)/2 - (gender.frame.size.width) - 8, 5)];
    [dropdown setImage:[UIImage imageNamed:@"drop"]];
    [scrollView addSubview:dropdown];
    
    UIButton *genderButton = [[UIButton alloc]initWithFrame:CGRectMake(gender.frame.origin.x, gender.frame.origin.y, age.frame.size.width, gender.frame.size.height)];
    [genderButton addTarget:self action:@selector(didTapGenderButton) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:genderButton];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(gender.frame.origin.x - 5, gender.frame.size.height + gender.frame.origin.y, (mainView.frame.size.width - 48)/2, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    
    [scrollView addSubview:border];
    
    UITextField *phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 12, mainView.frame.size.width - 37, 33)];
    [phoneNumber setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [phoneNumber setDelegate:self.signupDelegate];
    [phoneNumber setAutocorrectionType:UITextAutocorrectionTypeNo];
    [phoneNumber setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Phone Number" attributes:@{
                                                                                                        NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                        NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                        }]];
    [scrollView addSubview:phoneNumber];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, phoneNumber.frame.size.height + phoneNumber.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:border];
    
    UITextField *city = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 14, (nameField.frame.size.width - 21)/2, 32)];
    [city setDelegate:self.signupDelegate];
    [city setAutocorrectionType:UITextAutocorrectionTypeNo];
    [city setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"City" attributes:@{
                                                                                                 NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                 NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                 }]];
    
    [city setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    
    [scrollView addSubview:city];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, city.frame.size.height + city.frame.origin.y, (mainView.frame.size.width - 48)/2, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:border];
    
    UITextField *zipcode = [[UITextField alloc]initWithFrame:CGRectMake(border.frame.size.width + border.frame.origin.x + 21, city.frame.origin.y, (nameField.frame.size.width - 21)/2, 32)];
    [zipcode setDelegate:self.signupDelegate];
    [zipcode setAutocorrectionType:UITextAutocorrectionTypeNo];
    [zipcode setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Zip Code" attributes:@{
                                                                                                    NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                    NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                    }]];
    [zipcode setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    
    [scrollView addSubview:zipcode];
   
    border = [[UIView alloc]initWithFrame:CGRectMake(zipcode.frame.origin.x - 5, zipcode.frame.size.height + zipcode.frame.origin.y, (mainView.frame.size.width - 48)/2, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:border];
    
    UILabel *loginDetails = [[UILabel alloc]initWithFrame:CGRectMake(16, border.frame.size.height + border.frame.origin.y + 30, nameField.frame.size.width, 12)];
    [loginDetails setAttributedText: [BaseView setCharacterSpacingWithString:@"YOUR LOGIN DETAILS"]];
    
    [loginDetails setTextColor:[BaseView colorWithHexString:@"154F98"]];
    [loginDetails setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [scrollView addSubview:loginDetails];
    
    UITextField *usernameField = [[UITextField alloc]initWithFrame:CGRectMake(21, loginDetails.frame.size.height + loginDetails.frame.origin.y + 12, mainView.frame.size.width - 37, 33)];
    [usernameField setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [usernameField setDelegate:self.signupDelegate];
    [usernameField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [usernameField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Username" attributes:@{
                                                                                                        NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                        NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                        }]];
    [scrollView addSubview:usernameField];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, usernameField.frame.size.height + usernameField.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:border];
    
    UITextField *password = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 12, mainView.frame.size.width - 37, 33)];
    [password setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [password setDelegate:self.signupDelegate];
    [password setAutocorrectionType:UITextAutocorrectionTypeNo];
    [password setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Password" attributes:@{
                                                                                                                  NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                                  NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                                  }]];
    [scrollView addSubview:password];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, password.frame.size.height + password.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:border];
    
    
    UILabel *securityDetails = [[UILabel alloc]initWithFrame:CGRectMake(16, border.frame.size.height + border.frame.origin.y + 30, nameField.frame.size.width, 12)];
    [securityDetails setAttributedText: [BaseView setCharacterSpacingWithString:@"SECURITY DETAILS"]];
    
    [securityDetails setTextColor:[BaseView colorWithHexString:@"154F98"]];
    [securityDetails setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [scrollView addSubview:securityDetails];
    
    questionField = [[UITextField alloc]initWithFrame:CGRectMake(21, securityDetails.frame.size.height + securityDetails.frame.origin.y, nameField.frame.size.width - 15, 33)];
    [questionField setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [questionField setDelegate:self.signupDelegate];
    [questionField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Security Question" attributes:@{
                                                                                                                NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                                NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                                }]];
    [scrollView addSubview:questionField];
    
    dropdown = [[UIImageView alloc]initWithFrame:CGRectMake(questionField.frame.origin.x + questionField.frame.size.width, questionField.frame.origin.y + (questionField.frame.size.height/2) - 2, securityDetails.frame.size.width - (questionField.frame.size.width) - 6, 5)];
    [dropdown setImage:[UIImage imageNamed:@"drop"]];
    [scrollView addSubview:dropdown];
    
    UIButton *questionButton = [[UIButton alloc]initWithFrame:CGRectMake(questionField.frame.origin.x, questionField.frame.origin.y, nameField.frame.size.width, nameField.frame.size.height)];
    [questionButton addTarget:self action:@selector(didTapQuestionButton) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:questionButton];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, questionField.frame.size.height + questionField.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:border];
    
    UITextField *answerField = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 12, mainView.frame.size.width - 37, 33)];
    [answerField setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [answerField setDelegate:self.signupDelegate];
    [answerField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [answerField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Your Answer" attributes:@{
                                                                                                           NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                           NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                                           }]];
    [scrollView addSubview:answerField];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, answerField.frame.size.height + answerField.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [scrollView addSubview:border];
    
    UIButton *signupButton = [[UIButton alloc]initWithFrame:CGRectMake(16, border.frame.size.height + border.frame.origin.y + 22, mainView.frame.size.width - 32, 50)];
    [signupButton setTitle:@"SIGN UP" forState:UIControlStateNormal];
    [signupButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [[signupButton titleLabel] setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [signupButton addTarget:self.signupDelegate action:@selector(onSignupButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:signupButton];
    
    UIButton *signinButton = [[UIButton alloc]initWithFrame:CGRectMake(16, signupButton.frame.size.height + signupButton.frame.origin.y, mainView.frame.size.width - 32, 34)];
    [signinButton setTitle:@"Sign In" forState:UIControlStateNormal];
    [signinButton setTitleColor:[BaseView colorWithHexString:@"BABABA"] forState:UIControlStateNormal];
    [[signinButton titleLabel] setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [signinButton addTarget:self.signupDelegate action:@selector(onSigninButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addSubview:signinButton];
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, signinButton.frame.origin.y + signinButton.frame.size.height)];
    
}

-(void)didTapGenderButton {
    [self.signupDelegate onGenderButtonTap:gender];
}

-(void)didTapQuestionButton {
    [self.signupDelegate onSecurityQuestionTap:questionField];
}

@end
