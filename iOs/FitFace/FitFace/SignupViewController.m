//
//  SignupViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/4/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

-(void)loadView {
    signupView = [[SignupView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [signupView setBaseViewDelegate:self];
    [signupView setSignupDelegate:self];
    
    [self setView:signupView];
    [signupView setupLayout];
    
    [self.navigationController setNavigationBarHidden:YES];
}

-(IBAction)onBackButtonTap:(id)sender {
    NSLog(@"BACK BUTTON");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - SignupViewDelegate methods
-(IBAction)onSignupButtonTap:(id)sender {
    [self.view endEditing:YES];
    NSLog(@"SIDEPANEL: %@", self.sidePanelController);
    
    [[NSUserDefaults standardUserDefaults] setObject:@"HAS USER DATA" forKey:@"user_data"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(IBAction)onSigninButtonTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onGenderButtonTap:(id)sender {
    selectedTextfield = (UITextField *)sender;
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Select Gender:"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"Male", @"Female", nil];
    [sheet showInView:self.view];
    
    [selectedTextfield becomeFirstResponder];
}

-(IBAction)onSecurityQuestionTap:(id)sender {
    selectedTextfield = (UITextField *)sender;
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Select Security Question:"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"First Dog", @"Favorite Teacher", @"Mom's maiden name", nil];
    [sheet showInView:self.view];
    [selectedTextfield becomeFirstResponder];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        [selectedTextfield setText:[actionSheet buttonTitleAtIndex:buttonIndex]];
        selectedTextfield = nil;
    }
    
}

-(void)screenTapped {
    [self.view endEditing:YES];
}

#pragma mark UITextField Delegate
-(void) textFieldDidBeginEditing:(UITextField *)textField{
    
    CGRect textFieldRect =
    [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view.window convertRect:self.view.bounds fromView:self.view];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
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
        orientation == UIInterfaceOrientationPortraitUpsideDown){
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else{
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == selectedTextfield) {
        return NO;
    }
    
    return YES;
}

@end
