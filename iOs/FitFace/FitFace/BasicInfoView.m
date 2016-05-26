//
//  BasicInfoView.m
//  fitface
//
//  Created by LLDM 0037 on 2/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "BasicInfoView.h"

@implementation BasicInfoView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    CGRect bounds = [[UIScreen mainScreen]bounds];
    
    UILabel *detailsLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 6, bounds.size.width - 32, 28)];
    [detailsLabel setAttributedText: [BaseView setCharacterSpacingWithString:@"YOUR PERSONAL DETAILS"]];
    [detailsLabel setTextColor:[BaseView colorWithHexString:@"154F98"]];
    [detailsLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    
    [self addSubview:detailsLabel];
    
    name = [[UITextField alloc]initWithFrame:CGRectMake(21, detailsLabel.frame.origin.y + detailsLabel.frame.size.height, bounds.size.width - 37, 32)];
    [name setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Username" attributes:@{
                                                                                                       NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                       NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:11]
                                                                                                       }]];
    [name setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [name setDelegate:self.basicInfoViewDelegate];
    [name setReturnKeyType:UIReturnKeyDefault];
    
    [self addSubview:name];
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, name.frame.size.height + name.frame.origin.y, bounds.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [self addSubview:border];
    
    email = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 14, name.frame.size.width, name.frame.size.height)];
    [email setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Email" attributes:@{
                                                                                                     NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                     NSFontAttributeName :[UIFont fontWithName:AVENIR_BOOK size:11]	}]];
    [email setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [email setDelegate:self.basicInfoViewDelegate];
    [self addSubview:email];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, email.frame.size.height + email.frame.origin.y, bounds.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [self addSubview:border];
    
    age = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 14, (name.frame.size.width - 21)/2, 32)];
    [age setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Age" attributes:@{
                                                                                                 NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                 NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:11]
                                                                                                 }]];
    
    [age setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    
    [age setDelegate:self.basicInfoViewDelegate];
    [self addSubview:age];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, age.frame.size.height + age.frame.origin.y, (bounds.size.width - 48)/2, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    
    [self addSubview:border];
    
    gender = [[UITextField alloc]initWithFrame:CGRectMake(border.frame.size.width + border.frame.origin.x + 21, age.frame.origin.y, (name.frame.size.width - 54)/2, 32)];
    [gender setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [gender setDelegate:self.basicInfoViewDelegate];
    [gender setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Gender" attributes:@{
                                                                                                       NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                       NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:11]
                                                                                                       }]];
    
    
    [self addSubview:gender];
    
    UIImageView *dropdown = [[UIImageView alloc]initWithFrame:CGRectMake(gender.frame.origin.x + gender.frame.size.width, gender.frame.origin.y + (gender.frame.size.height/2), (name.frame.size.width - 21)/2 - (gender.frame.size.width) - 5, 6)];
    [dropdown setImage:[UIImage imageNamed:@"drop"]];
    
    [self addSubview:dropdown];
    
    UIButton *genderButton = [[UIButton alloc]initWithFrame:CGRectMake(gender.frame.origin.x, gender.frame.origin.y, age.frame.size.width, gender.frame.size.height)];
    [genderButton addTarget:self action:@selector(didTapGenderButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:genderButton];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(gender.frame.origin.x - 5, gender.frame.size.height + gender.frame.origin.y, (bounds.size.width - 48)/2, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [self addSubview:border];
    
    UITextField *phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 14, name.frame.size.width, name.frame.size.height)];
    [phoneNumber setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Phone Number" attributes:@{
                                                                                                     NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                     NSFontAttributeName :[UIFont fontWithName:AVENIR_BOOK size:11]	}]];
    [phoneNumber setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [phoneNumber setDelegate:self.basicInfoViewDelegate];
    [self addSubview:phoneNumber];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, phoneNumber.frame.size.height + phoneNumber.frame.origin.y, bounds.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [self addSubview:border];
    
    country = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 14, age.frame.size.width, 32)];
    [country setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [country setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Country" attributes:@{
                                                                                                         NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                         NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:11]
                                                                                                         }]];
    
    
    [country setDelegate:self.basicInfoViewDelegate];
    [self addSubview:country];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, country.frame.size.height + country.frame.origin.y, (bounds.size.width - 48)/2, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [self addSubview:border];
    
    UILabel *securityLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, border.frame.size.height + border.frame.origin.y + 16, detailsLabel.frame.size.width, 32)];
    [securityLabel setAttributedText: [BaseView setCharacterSpacingWithString:@"SECURITY DETAILS"]];
    [securityLabel setTextColor:[BaseView colorWithHexString:@"154F98"]];
    [securityLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    
    [self addSubview:securityLabel];
    
    securityQuestion = [[UITextField alloc]initWithFrame:CGRectMake(21, securityLabel.frame.size.height + securityLabel.frame.origin.y, name.frame.size.width - 17, 36)];
    [securityQuestion setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [securityQuestion setDelegate:self.basicInfoViewDelegate];
    [securityQuestion setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Security Question" attributes:@{
                                                                                                                            NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                                            NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:11]
                                                                                                                            }]];
    
    
    [self addSubview:securityQuestion];
    
    dropdown = [[UIImageView alloc]initWithFrame:CGRectMake(securityQuestion.frame.origin.x + securityQuestion.frame.size.width, securityQuestion.frame.origin.y + (securityQuestion.frame.size.height/2), securityLabel.frame.size.width - (securityQuestion.frame.size.width) - 10, 6)];
    
    [dropdown setImage:[UIImage imageNamed:@"drop"]];
    
    [self addSubview:dropdown];
    
    UIButton *securityQuestionButton = [[UIButton alloc]initWithFrame:CGRectMake(securityQuestion.frame.origin.x, securityQuestion.frame.origin.y, name.frame.size.width, securityQuestion.frame.size.height)];
    [securityQuestionButton addTarget:self action:@selector(didTapSecurityQuestionButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:securityQuestionButton];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, securityQuestion.frame.size.height + securityQuestion.frame.origin.y, bounds.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    
    [self addSubview:border];
    
    answerField = [[UITextField alloc]initWithFrame:CGRectMake(21, border.frame.size.height + border.frame.origin.y + 15, name.frame.size.width, 36)];
    [answerField setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [answerField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Your Answer" attributes:@{
                                                                                                                 NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                                                 NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:11]
                                                                                                                 }]];
    
    [answerField setDelegate:self.basicInfoViewDelegate];
    [self addSubview:answerField];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, answerField.frame.size.height + answerField.frame.origin.y, bounds.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    
    [self addSubview:border];
    
    UIButton *updateButton = [[UIButton alloc]initWithFrame:CGRectMake(16, bounds.size.height - 63 - 44, bounds.size.width - 32, 46)];
    [updateButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
    [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
    [[updateButton titleLabel]setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    
    [self addSubview:updateButton];
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]initWithTarget:self.basicInfoViewDelegate action:@selector(onScreenTap:)];
    [self addGestureRecognizer:tapped];

}

-(void)didTapGenderButton {
    [self.basicInfoViewDelegate onGenderButtonTap:gender];
}

-(void)didTapSecurityQuestionButton {
    [self.basicInfoViewDelegate onSecurityQuestionTap:securityQuestion];
}

@end
