//
//  ViewController.m
//  fitface
//
//  Created by Launch Labs on 2/9/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "SignInViewController.h"

static SignInViewController *instance = nil;

@interface SignInViewController ()

@end

@implementation SignInViewController{
    
}

+ (SignInViewController *) getInstance{
    return instance;
}

- (void)loadView{
    
    instance = self;
    
    signInView = [[SignInView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [signInView setSignInViewDelegate:self];
    [self setView:signInView];
    [signInView setupLayout];
    
    NSArray *fontFamilies = [UIFont familyNames];
    for (int i = 0; i < [fontFamilies count]; i++) {
        NSString *fontFamily = [fontFamilies objectAtIndex:i];
        NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
        NSLog (@"%@: %@", fontFamily, fontNames);
    }
    
}

-(void)viewWillAppear:(BOOL)animated {
    NSLog(@"USERNAME: %@", self.forgotUsername);
    signInView.usernameField.text = self.forgotUsername;
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"user_data"]) {
        [self loadSidePanel];
    }
}

-(void)receivedUsername {
//    NSString *string = (NSString *)notificaiton;
    [signInView.usernameField setText:@"TEEST"];
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
- (IBAction)btnContinueClicked:(id)sender{
    if(signInView.usernameField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error:"
                                                        message:@"Username field must not be empty."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else if(signInView.passwordField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error:"
                                                        message:@"Password field must not be empty"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    } else {
        [self loadSidePanel];
        [self.view endEditing:YES];
        [signInView.usernameField setText:nil];
        [signInView.passwordField setText:nil];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"HAS USER DATA" forKey:@"user_data"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)loadSidePanel{
    jaSidePanelController = [JASidePanelController getInstance];
    menuViewController = [[MenuViewController alloc]init];
    UINavigationController *menuNav = [[UINavigationController alloc] initWithRootViewController:menuViewController];
    homeViewController = [[HomeViewController alloc] init];
    [homeViewController setIsFirstLoad:YES];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:homeViewController];
    
    [jaSidePanelController  setShouldDelegateAutorotateToVisiblePanel:NO];
    [jaSidePanelController setCenterPanel:navController];
    [jaSidePanelController setRightPanel:menuNav];
    
    [self.view addSubview:jaSidePanelController.view];
    
}

- (IBAction)btnForgotCredentialsClicked:(id)sender{
    ForgotUsernameViewController *forgotUsernameView = [[ForgotUsernameViewController alloc]init];
    [self presentViewController:forgotUsernameView animated:YES completion:nil];
}

- (IBAction)btnSignUpClicked:(id)sender {
    
    SignupViewController *signup = [[SignupViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:signup];
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (IBAction) onFacebookButtonTap:(id)sender {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
//                                                    message:@"Functionality coming soon"
//                                                   delegate:self
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
             [parameters setValue:@"id,name,email" forKey:@"fields"];
             if ([FBSDKAccessToken currentAccessToken]) {
                 [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
                  startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                      if (!error) {
                          NSLog(@"fetched user:%@", result);
                      }
                  }];
             }
             [self loadSidePanel];
         }
     }];
}

- (IBAction) onInstagramButtonTap:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Functionality coming soon"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
