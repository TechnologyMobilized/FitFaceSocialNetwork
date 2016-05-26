//
//  AboutViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

-(void)loadView {
    aboutView = [[AboutView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [aboutView setBaseViewDelegate:self];
//    [aboutView setTrainersDelegate:self];
    
    [aboutView setupLayout];
    [self setView:aboutView];
    
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)showAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Functionality Coming Soon"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - AboutViewDelegate methods
-(void)onMenuButtonTap:(id)sender {
    
    if([self.sidePanelController centerPanelHidden]){
        [self.sidePanelController showCenterPanelAnimated:YES];
    } else
        [self.sidePanelController showRightPanelAnimated:YES];
}

-(IBAction)onCallButtonTap:(id)sender {
    [self showAlert];
}

-(IBAction)onMailButtonTap:(id)sender {
//    [self showAlert];
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"Sample Subject"];
        [mail setMessageBody:@"Here is some main text in the email!" isHTML:NO];
        [mail setToRecipients:@[@"testingEmail@example.com"]];
        
        [self presentViewController:mail animated:YES completion:NULL];
    } else {
        NSLog(@"This device cannot send email");
    }
}

-(IBAction)onFacebookButtonTap:(id)sender {
//    [self showAlert];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/"]];
}

-(IBAction)onTwitterButtonTap:(id)sender {
//    [self showAlert];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.twitter.com/"]];
}

#pragma mark
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
