//
//  BlockedUsersViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/17/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "BlockedUsersViewController.h"

@interface BlockedUsersViewController ()

@end

@implementation BlockedUsersViewController

-(void)loadView {
    blockedUsersView = [[BlockedUsersView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [blockedUsersView setBaseViewDelegate:self];
    [blockedUsersView setBlockedUsersDelegate:self];
    
    [blockedUsersView setupLayout];
    [self setView:blockedUsersView];
    
    [self.navigationItem setTitle:@"Blocked Users"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [blockedUsersView blockedList:@[]];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [BaseView colorWithHexString:THEME_COLOR];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"IN HERE");
    
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    
    if (bottomEdge >= scrollView.contentSize.height) {
        [blockedUsersView blockedList:@[]];
    }
}

#pragma mark BlockedUsersViewDelegate methods
-(IBAction)onUnblockButtonTap:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"UNBLOCK BUTTON TAPPED"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    UIButton *tappedButton = (UIButton *)sender;
    NSLog(@"TAPPED BUTTON TAG -- %d", tappedButton.tag);
    UIScrollView *scroll = (UIScrollView *)[self.view viewWithTag:1000];
    CGRect frame;
    int yOrigin = 12;
    
//    NSLog(@"SUBVIEWS - %@", scroll.subviews);
    
//    for(UIView *view in scroll.subviews) {
////        NSLog(@"VIEW'S TAG --- %@", view);
//        if(view.tag >= tappedButton.tag) {
//            if(view.tag == tappedButton.tag) {
//                frame = view.frame;
//                [UIView animateWithDuration:0.25f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                    [view setFrame:CGRectMake(-view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
//                    [view setAlpha:0];
//                } completion:^(BOOL finished) {
//                    [view removeFromSuperview];
//                }];
//                
//            } else {
////                [achievementView setViewTag:(int)view.tag];
//                CGRect temp = view.frame;
//                [UIView animateWithDuration:0.25f delay:0.2f options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                    
//                    [view setFrame:frame];
////                    [view setTag:view.tag - 1];
////                    [view.editButton setTag:view.editButton.tag - 1];
////                    [view.deleteButton setTag:view.deleteButton.tag - 1];
//                    
//                } completion:^(BOOL finished) {
//                    
//                }];
//                
//                yOrigin = view.frame.size.height + view.frame.origin.y;
//                //                [[achievementView scrollView] setContentSize:CGSizeMake([achievementView scrollView].frame.size.width, yorig + 60)];
//                frame = temp;
//            }
//        }
//        [scroll setContentSize:CGSizeMake(scroll.frame.size.width, yOrigin + 60)];
//        [blockedUsersView setYOrigin:yOrigin + 2];
//    }
    

    
}

@end
