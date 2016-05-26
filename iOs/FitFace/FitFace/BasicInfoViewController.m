//
//  BasicInfoViewController.m
//  fitface
//
//  Created by LLDM 0037 on 2/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "BasicInfoViewController.h"

@interface BasicInfoViewController ()

@end

@implementation BasicInfoViewController

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

-(void)viewWillAppear:(BOOL)animated {
    
    for(UIView *view in self.navigationController.navigationBar.subviews) {
        if([view isKindOfClass:[UIButton class]]) {
            [view setHidden:YES];
        }
    }
    
    NSLog(@"SUBVIEWS: %@", self.navigationController.navigationBar.subviews);
}

-(void)viewWillDisappear:(BOOL)animated {
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            
            if(![btn isHidden]) {
                [btn removeFromSuperview];
                
            } else {
                [btn setHidden:NO];
            }
        }
    }
}

- (void)loadView {
    
    basicInfoView = [[BasicInfoView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [basicInfoView setBaseViewDelegate:self];
    [basicInfoView setBasicInfoViewDelegate:self];
    
    [basicInfoView setupLayout];
    [self setView:basicInfoView];
    
    [self.navigationItem setTitle:@"Basic Information"];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)onCloseButtonTap {
    [self.view endEditing:YES];
}

#pragma mark BasicInfoViewDelegate methods
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

-(void)onScreenTap:(UIGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

#pragma mark - UIActionSheet methods
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        [selectedTextfield setText:[actionSheet buttonTitleAtIndex:buttonIndex]];
//        selectedTextfield = nil;
    }
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    NSLog(@"TEXTFIELD BRUH -- %@", selectedTextfield);
    if (textField != selectedTextfield) {
        NSLog(@"YYYY");
        return YES;
    }
    
    return NO;
}

@end
