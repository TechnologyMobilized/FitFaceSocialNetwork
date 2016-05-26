//
//  ForgotUsernameView.m
//  fitface
//
//  Created by LLDM 0037 on 3/9/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "ForgotUsernameView.h"

@implementation ForgotUsernameView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, 100)];
    [background setImage:[UIImage imageNamed:@"header"]];
    [background setClipsToBounds:YES];
    [mainView addSubview:background];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 24, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self.forgotUsernameDelegate action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:backButton];
    
    self.usernameLabel = [[UIButton alloc]initWithFrame:CGRectMake(0, backButton.frame.size.height + backButton.frame.origin.y + 10, mainView.frame.size.width/2, 46)];
    [self.usernameLabel setAttributedTitle:[BaseView setCharacterSpacingWithString:@"FORGOT USERNAME"] forState:UIControlStateNormal];
    [self.usernameLabel.titleLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [self.usernameLabel.titleLabel setTextColor:[UIColor whiteColor]];
    [self.usernameLabel.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.usernameLabel setSelected:YES];
    [self.usernameLabel addTarget:self.forgotUsernameDelegate action:@selector(onUsernameButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:self.usernameLabel];
    
    self.passwordLabel = [[UIButton alloc]initWithFrame:CGRectMake(self.usernameLabel.frame.size.width + self.usernameLabel.frame.origin.x, self.usernameLabel.frame.origin.y, mainView.frame.size.width/2, 46)];
    [self.passwordLabel setAttributedTitle:[BaseView setCharacterSpacingWithString:@"FORGOT PASSWORD"] forState:UIControlStateNormal];
    [self.passwordLabel.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [self.passwordLabel.titleLabel setTextColor:[UIColor whiteColor]];
    [self.passwordLabel.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.passwordLabel addTarget:self.forgotUsernameDelegate action:@selector(onPasswordButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:self.passwordLabel];
    
    self.selector = [[UIView alloc]initWithFrame:CGRectMake(0, background.frame.size.height - 2, mainView.frame.size.width/2, 2)];
    [self.selector setBackgroundColor:[BaseView colorWithHexString:HIGHLIGHT]];
    [mainView addSubview:self.selector];
    
    self.usernameContainer = [[UIView alloc]initWithFrame:CGRectMake(0, background.frame.size.height + background.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height - 100)];
    [self.usernameContainer setBackgroundColor:[UIColor whiteColor]];
    [mainView addSubview:self.usernameContainer];
    
    UILabel *question = [[UILabel alloc]initWithFrame:CGRectMake(0, 25, mainView.frame.size.width, 12)];
    [question setAttributedText:[BaseView setCharacterSpacingWithString:@"Can't remember your username?"]];
    [question setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [question setTextAlignment: NSTextAlignmentCenter];
    [self.usernameContainer addSubview:question];
    
    UILabel *text= [[UILabel alloc]initWithFrame:CGRectMake(0, question.frame.size.height + question.frame.origin.y + 8, mainView.frame.size.width, 14)];
    [text setText:@"Answer your own security question."];
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [text setTextAlignment:NSTextAlignmentCenter];
    [text  setTextColor:[BaseView colorWithHexString:@"6F6E6F"]];
    [self.usernameContainer addSubview:text];
    
    UILabel *securityQuestion = [[UILabel alloc]initWithFrame:CGRectMake(0, text.frame.size.height + text.frame.origin.y + 30, mainView.frame.size.width, 14)];
    [securityQuestion setAttributedText:[BaseView setCharacterSpacingWithString:[NSString stringWithFormat:@"What is your mother's maiden name?"]]];
    [securityQuestion setTextColor:[BaseView colorWithHexString:THEME_COLOR]];
    [securityQuestion setFont:[UIFont fontWithName:AVENIR_HEAVY size:11]];
    [securityQuestion setTextAlignment:NSTextAlignmentCenter];
    [self.usernameContainer addSubview:securityQuestion];
    
    UITextField *answer = [[UITextField alloc]initWithFrame:CGRectMake(16, securityQuestion.frame.size.height + securityQuestion.frame.origin.y + 8, mainView.frame.size.width - 36, 36)];
    [answer setPlaceholder:@"Your Answer"];
    [answer setTextAlignment:NSTextAlignmentCenter];
    [answer setTextColor:[BaseView colorWithHexString:@"262626"]];
    [answer setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [answer setDelegate:self.forgotUsernameDelegate];
    [answer setAutocorrectionType:UITextAutocorrectionTypeNo];
    [answer addTarget:self.forgotUsernameDelegate action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.usernameContainer addSubview:answer];
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, answer.frame.size.height + answer.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"E8E9E8"]];
    [self.usernameContainer addSubview:border];
    
    self.submitButton = [[UIButton alloc]initWithFrame:CGRectMake(16, self.usernameContainer.frame.size.height - 84, mainView.frame.size.width - 32, 50)];
    [self.submitButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [self.submitButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [self.submitButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
    [self.submitButton setEnabled:NO];
    [self.submitButton addTarget:self.forgotUsernameDelegate action:@selector(onSubmitButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.usernameContainer addSubview:self.submitButton];
    
    UIButton *cancel = [[UIButton alloc]initWithFrame:CGRectMake(16, self.submitButton.frame.size.height + self.submitButton.frame.origin.y + 2, mainView.frame.size.width - 32, 34)];
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancel.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [cancel addTarget:self.forgotUsernameDelegate action:@selector(onCancelButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [cancel setTitleColor:[BaseView colorWithHexString:@"A0A0A0"] forState:UIControlStateNormal];
    [self.usernameContainer addSubview:cancel];
    
    self.wrongAnswerText = [[UILabel alloc]initWithFrame:CGRectMake(0, border.frame.size.height + border.frame.origin.y + 6, mainView.frame.size.width, 14)];
    [self.wrongAnswerText setText:@"Sorry, your answer was wrong. Please try again."];
    [self.wrongAnswerText setTextColor:[BaseView colorWithHexString:@"ED0005"]];
    [self.wrongAnswerText setTextAlignment:NSTextAlignmentCenter];
    [self.wrongAnswerText setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [self.wrongAnswerText setHidden:YES];
    
    [self.usernameContainer addSubview:self.wrongAnswerText];
    self.username = [[UILabel alloc]initWithFrame:CGRectMake(0, border.frame.size.height + border.frame.origin.y + 50, mainView.frame.size.width, 10)];
    [self.username setTextAlignment:NSTextAlignmentCenter];
    [self.username setAttributedText:[BaseView setCharacterSpacingWithString:@"Your Username:"]];
    [self.username setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [self.username setTextColor:[BaseView colorWithHexString:@"54AF54"]];
    [self.username setHidden:YES];
    [self.usernameContainer addSubview:self.username];
    
    self.self.correctName = [[UILabel alloc]initWithFrame:CGRectMake(16, self.username.frame.size.height + self.username.frame.origin.y + 12, mainView.frame.size.width - 32, 35)];
    [self.correctName setTextAlignment:NSTextAlignmentCenter];
    [self.correctName setText:[NSString stringWithFormat:@"%@", @"patrickeedly"]];
    [self.correctName setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [self.correctName setHidden:YES];
    [self.usernameContainer addSubview:self.correctName];
    
    self.endBorder = [[UIView alloc]initWithFrame:CGRectMake(16, self.correctName.frame.size.height + self.correctName.frame.origin.y, mainView.frame.size.width - 32, 2)];
    [self.endBorder setBackgroundColor:[BaseView colorWithHexString:@"E8E9E8"]];
    [self.endBorder setHidden:YES];
    [self.usernameContainer addSubview:self.endBorder];
    
    //FORGOT PASSWORD
    
    self.passwordContainer = [[UIView alloc]initWithFrame:CGRectMake(mainView.frame.size.width, self.usernameContainer.frame.origin.y, mainView.frame.size.width, self.usernameContainer.frame.size.height)];
    [self.passwordContainer setBackgroundColor:[UIColor whiteColor]];
    [mainView addSubview:self.passwordContainer];
    
    UILabel *rememberText = [[UILabel alloc]initWithFrame:CGRectMake(0, 22, mainView.frame.size.width, 16)];
    [rememberText setAttributedText:[BaseView setCharacterSpacingWithString:@"Can't remember your password?"]];
    [rememberText setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [rememberText setTextAlignment:NSTextAlignmentCenter];
    [self.passwordContainer addSubview:rememberText];
    
    UILabel *instructionsText = [[UILabel alloc]initWithFrame:CGRectMake(22, rememberText.frame.size.height + rememberText.frame.origin.y + 6, mainView.frame.size.width - 44, 32)];
    [instructionsText setText:@"Enter your email address so we can send you a new password. You can change it once you're logged in."];
    [instructionsText setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [instructionsText setTextAlignment:NSTextAlignmentCenter];
    [instructionsText setNumberOfLines:0];
    [instructionsText  setTextColor:[BaseView colorWithHexString:@"6F6E6F"]];
    [self.passwordContainer addSubview:instructionsText];
    
    self.emailField = [[UITextField alloc]initWithFrame:CGRectMake(16, instructionsText.frame.size.height + instructionsText.frame.origin.y + 35, mainView.frame.size.width - 32, 34)];
    [self.emailField setPlaceholder:@"Your Email Address"];
    [self.emailField setTextAlignment:NSTextAlignmentCenter];
    [self.emailField setTextColor:[BaseView colorWithHexString:@"262626"]];
    [self.emailField setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [self.emailField setDelegate:self.forgotUsernameDelegate];
    [self.emailField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [self.emailField addTarget:self.forgotUsernameDelegate action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.passwordContainer addSubview:self.emailField];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(16, self.emailField.frame.size.height + self.emailField.frame.origin.y, mainView.frame.size.width - 32, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"E8E9E8"]];
    [self.passwordContainer addSubview:border];
    
    self.invalidEmailText = [[UILabel alloc]initWithFrame:CGRectMake(0, border.frame.size.height + border.frame.origin.y, mainView.frame.size.width, 14)];
    [self.invalidEmailText setText:@"Invalid Email Adrress. Please try again."];
    [self.invalidEmailText setTextColor:[BaseView colorWithHexString:@"ED0005"]];
    [self.invalidEmailText setTextAlignment:NSTextAlignmentCenter];
    [self.invalidEmailText setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [self.invalidEmailText setHidden:YES];
    [self.passwordContainer addSubview:self.invalidEmailText];
    
    self.resetButton = [[UIButton alloc]initWithFrame:CGRectMake(16, self.passwordContainer.frame.size.height - 84, mainView.frame.size.width - 32, 48)];
    [self.resetButton setTitle:@"RESET PASSWORD" forState:UIControlStateNormal];
    [self.resetButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [self.resetButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
    [self.resetButton setEnabled:NO];
    [self.resetButton addTarget:self.forgotUsernameDelegate action:@selector(onResetButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.passwordContainer addSubview:self.resetButton];
    
    cancel = [[UIButton alloc]initWithFrame:CGRectMake(16, self.resetButton.frame.size.height + self.resetButton.frame.origin.y + 2, mainView.frame.size.width - 32, 34)];
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancel.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [cancel addTarget:self.forgotUsernameDelegate action:@selector(onCancelButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [cancel setTitleColor:[BaseView colorWithHexString:@"A0A0A0"] forState:UIControlStateNormal];
    [self.passwordContainer addSubview:cancel];
    
}

@end
