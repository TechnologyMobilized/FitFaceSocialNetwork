//
//  ViewController.h
//  fitface
//
//  Created by Launch Labs on 2/9/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "JASidePanelController.h"
#import "MenuViewController.h"
#import "HomeViewController.h"
#import "SignupViewController.h"
#import "SignInView.h"
#import "ForgotUsernameViewController.h"

@interface SignInViewController : BaseViewController<SignInViewDelegate>{
    SignInView *signInView;
    JASidePanelController *jaSidePanelController;
    MenuViewController *menuViewController;
    HomeViewController *homeViewController;
}

@property (nonatomic, strong) NSString *forgotUsername;
+ (SignInViewController *) getInstance;

@end

