//
//  HomeViewController.m
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    
    UIButton *moreButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 4)];
    [moreButton setBackgroundImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(onMoreButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moreButton];
    
}

- (void)loadView {
    
    homeView = [[HomeView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [homeView setBaseViewDelegate:self];
    [homeView setHomeViewDelegate:self];
    
    [homeView setupLayout];
    [self setView:homeView];
    [self addRightPanel];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    if(self.isFirstLoad) {
        [UIView animateWithDuration:0.25
                              delay:0.2
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             
                             [[self.view viewWithTag:10] setAlpha:1];
                             
                         } completion:nil];
        self.isFirstLoad = NO;
        
    }
    
//    self.view.alpha = 0;
//    [UIView animateWithDuration:0.25 animations:^{
//        self.view.alpha = 1;
//    } completion:^(BOOL finished) {
//        
//    }];
    
}

- (void)addRightPanel{
    UINavigationBar *bar = self.navigationController.navigationBar;
    
    UIButton *btnHome = [[UIButton alloc]initWithFrame:CGRectMake(bar.frame.size.width - 30, 15, 18, 14)];
    [btnHome setImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    [btnHome addTarget:self action:@selector(toggleRightPanel) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:btnHome];
}

- (void)toggleRightPanel {
    NSLog(@"TAPPED -- %@", self.sidePanelController);
    if([self.sidePanelController centerPanelHidden]){
        [self.sidePanelController showCenterPanelAnimated:YES];
    }
    else [self.sidePanelController showRightPanelAnimated:YES];
}

-(IBAction)onMoreButtonTap:(id)sender {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
//                                                    message:@"More button clicked"
//                                                   delegate:self
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
    
    [self displayPopup];
    
}

-(void)displayPopup {
    
    if([homeView.popupView isHidden]) {
        [homeView.popupView setHidden:NO];
        
        homeView.popupView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        [homeView.popupView setHidden:NO];
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            homeView.popupView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished){
        }];
        
    } else {
        homeView.popupView.transform = CGAffineTransformIdentity;
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            homeView.popupView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        } completion:^(BOOL finished){
            [homeView.popupView setHidden:YES];
        }];
    }
}

#pragma mark - HomeViewDelegate methods
-(IBAction)onMotivateButtonTap:(id)sender {
    NSLog(@"MOTIVATE BUTTON TAPPED");
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
//                                                    message:@"Motivate button tapped"
//                                                   delegate:self
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
    MotivateViewController *motivateView = [[MotivateViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:motivateView];
    
    [self.sidePanelController setCenterPanel:navigationController];
}

-(IBAction)onDatabaseQuestionTap:(id)sender {
    NSLog(@"DATABASE BUTTON TAPPED");
    
    DatabaseViewController *databaseView = [[DatabaseViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:databaseView];
    
    [self.sidePanelController setCenterPanel:navigationController];
    
}

-(IBAction)onProfileButtonTap:(id)sender {
    NSLog(@"PROFILE BUTTON TAPPED");
    
    ProfileViewController *profileView = [[ProfileViewController alloc]init];
    [profileView setIsMyProfile:YES];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:profileView];
    [self.sidePanelController setCenterPanel:navigationController];
}

-(IBAction)onTrainerButtonTap:(id)sender {
    [self onTap];
    
    TrainersViewController *trainersView = [[TrainersViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:trainersView];
    [self.sidePanelController setCenterPanel:navigationController];
}

-(IBAction)onUpgradeButtonTap:(id)sender {
    [self onTap];
    
    UpgradeViewController *upgradeView = [[UpgradeViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:upgradeView];
    [self.sidePanelController setCenterPanel:navigationController];
    
}

-(IBAction)onSuccessButtonTap:(id)sender {
//    [self alertMessageDisplay];
    
    SuccessStoryViewController *successStoryView = [[SuccessStoryViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:successStoryView];
    [self.sidePanelController setCenterPanel:navigationController];
}

-(IBAction)onPlaceButtonTap:(id)sender {
    //    [self alertMessageDisplay];
    PlaceViewController *placeView = [[PlaceViewController alloc]init];
    [placeView setIsFromHome:YES];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:placeView];
    [self.sidePanelController setCenterPanel:navigationController];
}

-(void)onSwitchButtonTap:(UIImageView *)switchButton {
    NSLog(@"here");
    
    if([homeView isOn]) {
        [[self.view viewWithTag:1]setAlpha:1];
        [UIView animateWithDuration:0.25
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [switchButton setFrame:CGRectMake(4, switchButton.frame.origin.y, switchButton.frame.size.width, switchButton.frame.size.height)];
                             [[self.view viewWithTag:1]setAlpha:0];
                             
                         }
                         completion:^(BOOL finished){
                             [switchButton setImage:[UIImage imageNamed:@"switch_gray"]];
                             [[self.view viewWithTag:1]setHidden:YES];
                         }];
        
        [homeView setIsOn:NO];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"0" forKey:@"switch"];
        
        [defaults synchronize];
        
        UILabel *label = (UILabel *)[self.view viewWithTag:2];
        [label setTextColor:[BaseView colorWithHexString:@"959595"]];
        
    } else {
        [[self.view viewWithTag:1]setAlpha:0];
        [UIView animateWithDuration:0.25
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [switchButton setFrame:CGRectMake(switchButton.frame.size.width + 4, switchButton.frame.origin.y, switchButton.frame.size.width, switchButton.frame.size.height)];
                             [[self.view viewWithTag:1]setHidden:NO];
                             [[self.view viewWithTag:1]setAlpha:1];
                             
                         }
                         completion:^(BOOL finished){
                             [switchButton setImage:[UIImage imageNamed:@"switch_blue"]];
                         }];
        
        [homeView setIsOn:YES];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"1" forKey:@"switch"];
        [defaults synchronize];
        
        UILabel *label = (UILabel *)[self.view viewWithTag:2];
        [label setTextColor:[BaseView colorWithHexString:THEME_COLOR]];
    }
}

-(IBAction)onOnTheGoTap:(id)sender {
    NSLog(@"ON THE GO LABEL TAP");
    NSLog(@"SUBVIEWS -- %@", homeView.subviews.lastObject.subviews);
    
    if([homeView.searchPopupBackground isHidden]) {
        [homeView.searchPopupBackground setHidden:NO];
        
        homeView.searchPopupBackground.transform = CGAffineTransformMakeScale(0.01, 0.01);
        [homeView.searchPopupBackground setHidden:NO];
        
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            homeView.searchPopupBackground.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished){
        }];
        
    }
}

-(void)onChoicesTap:(UITapGestureRecognizer *)gesture {
    UIView *tappedView = (UIView *)gesture.view;
    
    if([tappedView.subviews.lastObject isHidden]) {
        [tappedView.subviews.lastObject setHidden:NO];
    } else {
        [tappedView.subviews.lastObject setHidden:YES];
    }
}

-(void)onBackgroundTap:(UIGestureRecognizer *)gesture {
    homeView.searchPopupBackground.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        homeView.searchPopupBackground.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished){
        [homeView.searchPopupBackground setHidden:YES];
        
    }];
}

-(IBAction)onMatchesButtonTap:(id)sender {
    MatchesFoundViewController *matchesScreen = [[MatchesFoundViewController alloc]init];
    [self.navigationController pushViewController:matchesScreen animated:YES];
    homeView.searchPopupBackground.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        homeView.searchPopupBackground.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished){
        [homeView.searchPopupBackground setHidden:YES];
        
    }];
    
}

-(IBAction)onTipsButtonTap:(id)sender {
    
    UIView *container = (UIView *)[self.view viewWithTag:11];
    UIButton *doneButton = (UIButton *)[self.view viewWithTag:17];
    [doneButton setTitle:@"NEXT" forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.3 animations:^{
        [[self.view viewWithTag:16] setHidden:YES];
        [[self.view viewWithTag:10] setAlpha:1];
        [[self.view viewWithTag:11] setAlpha:1];
        [[self.view viewWithTag:11] setHidden:NO];
        [[self.view viewWithTag:12] setAlpha:1];
        [[self.view viewWithTag:12] setHidden:NO];
        [[self.view viewWithTag:23]setBackgroundColor:[UIColor clearColor]];
        [[self.view viewWithTag:20]setBackgroundColor:[UIColor whiteColor]];
        
    } completion:^(BOOL finished) {
        UIImageView *arrow = (UIImageView *)[self.view viewWithTag:9];
        [arrow setFrame:CGRectMake(0, container.frame.size.height + container.frame.origin.y + 4, arrow.frame.size.width, arrow.frame.size.height)];
        [arrow setCenter:CGPointMake(container.frame.size.width/2, arrow.center.y)];
        [arrow setImage:[UIImage imageNamed:@"arrow"]];
        [arrow setHidden:NO];
    }];
}

-(IBAction)onNextButtonTap:(id)sender {
    if(![[self.view viewWithTag:11] isHidden]) {
        UIView *container = (UIView *)[self.view viewWithTag:13];
        
        [UIView animateWithDuration:0.3 animations:^{
            [[self.view viewWithTag:11] setAlpha:0];
            [[self.view viewWithTag:12] setAlpha:0];
            [[self.view viewWithTag:20]setBackgroundColor:[UIColor clearColor]];
            [[self.view viewWithTag:21]setBackgroundColor:[UIColor whiteColor]];
            
            UIImageView *arrow = (UIImageView *)[self.view viewWithTag:9];
            [arrow setAlpha:0.0];
            [arrow setFrame:CGRectMake(self.view.frame.size.width - 28, container.frame.origin.y - 24, arrow.frame.size.width, arrow.frame.size.height)];
            [arrow setImage:[UIImage imageNamed:@"arrow_up"]];
            [arrow setAlpha:1];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:.25 animations:^{
                [container setAlpha:1];
                [container setHidden:NO];
            } completion:^(BOOL finished) {
                
                [[self.view viewWithTag:11] setHidden:YES];
            }];
            
        }];
        
    } else if(![[self.view viewWithTag:13] isHidden]) {
        UIView *container = (UIView *)[self.view viewWithTag:14];
        UIView *onthego = (UIView *)[self.view viewWithTag:15];
        
        [UIView animateWithDuration:0.3 animations:^{
            [[self.view viewWithTag:14] setAlpha:0];
            [[self.view viewWithTag:21]setBackgroundColor:[UIColor clearColor]];
            [[self.view viewWithTag:22]setBackgroundColor:[UIColor whiteColor]];
            
            UIImageView *arrow = (UIImageView *)[self.view viewWithTag:9];
            [arrow setFrame:CGRectMake(0, container.frame.origin.y + container.frame.size.height + 2, arrow.frame.size.width, arrow.frame.size.height)];
            [arrow setCenter:CGPointMake(container.frame.size.width/2, arrow.center.y)];
            [arrow setImage:[UIImage imageNamed:@"arrow"]];
            
            [arrow setAlpha:0.0];
            [arrow setAlpha:1];
            
            [onthego setAlpha:1];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:.25 animations:^{
                [container setAlpha:1];
                [container setHidden:NO];
                [onthego setHidden:NO];
                
            } completion:^(BOOL finished) {
                [[self.view viewWithTag:13] setHidden:YES];
                
            }];
            
        }];
        
    } else if(![[self.view viewWithTag:14] isHidden]) {
        UIView *container = (UIView *)[self.view viewWithTag:16];
        
        [UIView animateWithDuration:0.3 animations:^{
            [[self.view viewWithTag:14] setAlpha:0];
            [[self.view viewWithTag:22]setBackgroundColor:[UIColor clearColor]];
            [[self.view viewWithTag:23]setBackgroundColor:[UIColor whiteColor]];
            
            UIImageView *arrow = (UIImageView *)[self.view viewWithTag:9];
            [arrow setFrame:CGRectMake(self.view.frame.size.width - 54, container.frame.origin.y - 24, arrow.frame.size.width, arrow.frame.size.height)];
            [arrow setImage:[UIImage imageNamed:@"arrow_up"]];
            [arrow setAlpha:0.0];
            [arrow setAlpha:1];
            
            UIButton *doneButton = (UIButton *)[self.view viewWithTag:17];
            [doneButton setTitle:@"DONE" forState:UIControlStateNormal];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:.25 animations:^{
                [container setAlpha:1];
                [container setHidden:NO];
                
            } completion:^(BOOL finished) {
                [[self.view viewWithTag:14] setHidden:YES];
                
            }];
            
        }];
        
    } else {
        
        [UIView animateWithDuration:0.3 animations:^{
            [[self.view viewWithTag:10] setAlpha:0];
            
        } completion:^(BOOL finished) {
//            [[self.view viewWithTag:10] setHidden:YES];
            [[self.view viewWithTag:11] setHidden:YES];
            [[self.view viewWithTag:13] setHidden:YES];
            [[self.view viewWithTag:14] setHidden:YES];
            [[self.view viewWithTag:9] setHidden:YES];
            [[self.view viewWithTag:15] setHidden:YES];
            [[self.view viewWithTag:16] setHidden:YES];
            
        }];
    }
}

-(void)onDontShowButtonTap:(UITapGestureRecognizer *)sender {
    UIView *tappedView = (UIView *)sender.view;
    
    if([tappedView.subviews.lastObject isHidden]) {
        [tappedView.subviews.lastObject setHidden:NO];
        
    } else {
        [tappedView.subviews.lastObject setHidden:YES];
        
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [[self.view viewWithTag:10] setAlpha:0];
        
    } completion:^(BOOL finished) {
        //            [[self.view viewWithTag:10] setHidden:YES];
        [[self.view viewWithTag:9] setHidden:YES];
        [[self.view viewWithTag:11] setHidden:YES];
        [[self.view viewWithTag:13] setHidden:YES];
        [[self.view viewWithTag:14] setHidden:YES];
        [[self.view viewWithTag:15] setHidden:YES];
        [[self.view viewWithTag:16] setHidden:YES];
        [tappedView.subviews.lastObject setHidden:YES];
        
    }];
    
}

-(void)onTap {
    NSLog(@"HERE");
    if(![homeView.popupView isHidden]) {
        homeView.popupView.transform = CGAffineTransformIdentity;
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            homeView.popupView.transform = CGAffineTransformMakeScale(0.01, 0.01);
            
        } completion:^(BOOL finished){
            [homeView.popupView setHidden:YES];
            
        }];
    }
    
}

-(void)alertMessageDisplay {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Functionality coming soon"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == [alertView cancelButtonIndex]){
        //cancel clicked ...do your action
        
        [self onTap];
        
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (touch.view != homeView.searchPopupBackground) {
        return NO;
    }
    return YES;
}

@end
