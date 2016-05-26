//
//  ForgotUsernameViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/9/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "ForgotUsernameViewController.h"
#import "SignInViewController.h"

@interface ForgotUsernameViewController ()

@end

@implementation ForgotUsernameViewController

-(void)loadView {
    forgotUsername = [[ForgotUsernameView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [forgotUsername setBaseViewDelegate:self];
    [forgotUsername setForgotUsernameDelegate:self];
    
    [self setView:forgotUsername];
    [forgotUsername setupLayout];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    
}

#pragma mark - ForgotUsernameViewDelegate methods

-(IBAction)onBackButtonTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onUsernameButtonTap:(id)sender {
    NSLog(@"FORGOT USERNAME");
    UIButton *btn = (UIButton *)sender;
    
    if(![btn isSelected]) {
        NSLog(@"NOT SELECTED");
        
        [UIView animateWithDuration:0.25f delay:0.0f options:UIViewAnimationOptionCurveLinear
                         animations: ^{
                             [forgotUsername.selector setFrame:CGRectMake(forgotUsername.selector.frame.origin.x - forgotUsername.selector.frame.size.width, forgotUsername.selector.frame.origin.y, forgotUsername.selector.frame.size.width, forgotUsername.selector.frame.size.height)];
                             
                             [forgotUsername.usernameContainer setFrame:CGRectMake(0, forgotUsername.usernameContainer.frame.origin.y, forgotUsername.usernameContainer.frame.size.width, forgotUsername.usernameContainer.frame.size.height)];
                             
                             [forgotUsername.passwordContainer setFrame:CGRectMake(forgotUsername.usernameContainer.frame.size.width, forgotUsername.passwordContainer.frame.origin.y, forgotUsername.passwordContainer.frame.size.width, forgotUsername.passwordContainer.frame.size.height)];
                             
                             [forgotUsername.passwordLabel.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
                             [forgotUsername.usernameLabel.titleLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
            
                         } completion:^(BOOL finished) {
                             
                         }];
        
        [btn setSelected:YES];
        [forgotUsername.passwordLabel setSelected:NO];
        
    }
}

-(IBAction)onPasswordButtonTap:(id)sender {
    NSLog(@"FORGOT PASWORD");
    UIButton *btn = (UIButton *)sender;
    
    if(![btn isSelected]) {
        NSLog(@"NOT SELECTED");
        
        [UIView animateWithDuration:0.25f delay:0.0f options:UIViewAnimationOptionCurveLinear
                         animations: ^{
                             [forgotUsername.selector setFrame:CGRectMake(forgotUsername.selector.frame.origin.x + forgotUsername.selector.frame.size.width, forgotUsername.selector.frame.origin.y, forgotUsername.selector.frame.size.width, forgotUsername.selector.frame.size.height)];
                             
                             [forgotUsername.usernameContainer setFrame:CGRectMake(-forgotUsername.usernameContainer.frame.size.width, forgotUsername.usernameContainer.frame.origin.y, forgotUsername.usernameContainer.frame.size.width, forgotUsername.usernameContainer.frame.size.height)];
                             
                             [forgotUsername.passwordContainer setFrame:CGRectMake(0, forgotUsername.passwordContainer.frame.origin.y, forgotUsername.passwordContainer.frame.size.width, forgotUsername.passwordContainer.frame.size.height)];
                             
                             [forgotUsername.passwordLabel.titleLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
                             [forgotUsername.usernameLabel.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
                             
                         } completion:^(BOOL finished) {
                             
                         }];
        
        [btn setSelected:YES];
        [forgotUsername.usernameLabel setSelected:NO];
    }
}

-(IBAction)onSubmitButtonTap:(id)sender {
    NSLog(@"SUBMIT BUTTON CLICKED");
//    UIButton *button = (UIButton *)sender;
    
    int i = arc4random() % 2;
    
    NSLog(@"randomized number %d", i);
    
    if(usernameSuccess) {
        SignInViewController *signin = [SignInViewController getInstance];
        signin.forgotUsername = forgotUsername.correctName.text;
        NSLog(@"FORGOT: %@", forgotUsername.username.text);
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        if(i == 1) {
            
            [forgotUsername.wrongAnswerText setHidden:YES];
            [forgotUsername.username setHidden:NO];
            [forgotUsername.correctName setHidden:NO];
            [forgotUsername.endBorder setHidden:NO];
            
            [forgotUsername.submitButton setTitle:@"CONTINUE WITH SIGN IN" forState:UIControlStateNormal];
            usernameSuccess = YES;
            
            
        } else {
            [forgotUsername.wrongAnswerText setHidden:NO];
            [forgotUsername.submitButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
            
        }
    }
}

-(IBAction)onCancelButtonTap:(id)sender {
    NSLog(@"CANCEL BUTTON TAPPED");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onResetButtonTap:(id)sender {
    int i = arc4random() % 2;
    
    NSLog(@"randomized number %d", i);
    
//    if(passwordSuccess) {
//        [forgotUsername.resetButton setBackgroundColor:[BaseView colorWithHexString:@"D2EBD4"]];
//        [forgotUsername.resetButton setTitle:@"NEW PASSWORD SENT!" forState:UIControlStateNormal];
//        
//    } else {
        if(i == 1) {
            
            [forgotUsername.invalidEmailText setHidden:YES];
            [forgotUsername.resetButton setBackgroundColor:[BaseView colorWithHexString:@"D2EBD4"]];
            [forgotUsername.resetButton setTitle:@"NEW PASSWORD SENT!" forState:UIControlStateNormal];
            [forgotUsername.resetButton setTitleColor:[BaseView colorWithHexString:@"748074"] forState:UIControlStateNormal];
            
        } else {
            [forgotUsername.invalidEmailText setHidden:NO];
            [forgotUsername.resetButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
            [forgotUsername.resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
//    }
}

-(void)textFieldDidChange:(UITextField *)field {
    if(!usernameSuccess && field != forgotUsername.emailField) {
        NSLog(@"YEEE");
        if([field.text length] == 0) {
            [forgotUsername.submitButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
            [forgotUsername.submitButton setEnabled:NO];
        } else {
            [forgotUsername.submitButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
            [forgotUsername.submitButton setEnabled:YES];
        }
        
    } else if(field == forgotUsername.emailField) {
        NSLog(@"YEEEESH");
        if([field.text length] == 0) {
            [forgotUsername.resetButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
            [forgotUsername.resetButton setEnabled:NO];
            [forgotUsername.resetButton setTitle:@"RESET PASSWORD" forState:UIControlStateNormal];
            [forgotUsername.resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        } else {
            [forgotUsername.resetButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
            [forgotUsername.resetButton setEnabled:YES];
            
        }
    }
}

#pragma mark - UITextFieldDelegate methods
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField setPlaceholder:@""];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    if(textField == forgotUsername.emailField) {
        [textField setPlaceholder:@"Your Email Address"];
        
    } else {
        [textField setPlaceholder:@"Your Answer"];
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
