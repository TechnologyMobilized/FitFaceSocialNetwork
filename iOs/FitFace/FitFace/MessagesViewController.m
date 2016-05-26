//
//  MessagesViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/30/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "MessagesViewController.h"

@interface MessagesViewController ()

@end

@implementation MessagesViewController

-(void)loadView {
    messagesView = [[MessagesView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [messagesView setBaseViewDelegate:self];
    [messagesView setMessagesDelegate:self];
    [messagesView setupLayout];
    [self setView:messagesView];
        
//    [self.navigationItem setTitle:@"Messages"];
    
    [messagesView messagesList:@[]];
}

- (void)addHeaderTitle:(NSString*)title{
    [self.navigationController.navigationBar.topItem setTitle:title];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:AVENIR_BOOK size:14] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController.navigationBar setHidden:NO];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:backButton]];
    
    UIButton *menuButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 14)];
    [menuButton setImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(onMenuButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:menuButton]];
    
    [self addHeaderTitle:@"Messages"];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

-(IBAction)onBackButtonTap:(id)sender {
    NSLog(@"BACK BUTTON TAPPED");
    [self.sidePanelController showRightPanelAnimated:YES];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController: [[HomeViewController alloc] init] ];
    [self.sidePanelController setCenterPanel:nil];
    [self.sidePanelController setCenterPanel:navController];
    [self.sidePanelController showCenterPanelAnimated:YES];
    
}

-(IBAction)onMenuButtonTap:(id)sender {
    NSLog(@"MENU BUTTON TAPPED");
//    [self.navigationController popViewControllerAnimated:YES];
    if([self.sidePanelController centerPanelHidden]){
        [self.sidePanelController showCenterPanelAnimated:YES];
    }
    else [self.sidePanelController showRightPanelAnimated:YES];
    
}

#pragma mark - MessagesViewDelegate methods
-(void)onMessageSwipe:(UISwipeGestureRecognizer *)gesture {
    NSLog(@"SWIPED");
    UIView *swipedView = (UIView *)gesture.view;
    
    if(gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        if(prevView != swipedView) {
            
            [UIView animateWithDuration:0.25f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [prevView setFrame:CGRectMake(swipedView.frame.origin.x, prevView.frame.origin.y, prevView.frame.size.width, prevView.frame.size.height)];
                [swipedView setFrame:CGRectMake(swipedView.frame.origin.x - 86, swipedView.frame.origin.y, swipedView.frame.size.width, swipedView.frame.size.height)];
                
            } completion:^(BOOL finished) {
            }];
        }
        
        prevView = swipedView;
        
    } else if(gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        if(swipedView == prevView) {
            [UIView animateWithDuration:0.25f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [swipedView setFrame:CGRectMake(0, 0, swipedView.frame.size.width, swipedView.frame.size.height)];
                
            } completion:^(BOOL finished) {
            }];
            
            prevView = nil;
        }
        
    }
    
}

-(IBAction)onDeleteButtonTap:(id)sender {
    deleteButton = (UIButton *)sender;
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Delete?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Yes", nil];
    
    [actionSheet showInView:self.view];
}

-(IBAction)onReplyButtonTap:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Functionality coming soon"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

-(void)onMessageTap:(UITapGestureRecognizer *)gesture {
    ConversationViewController *conversationView = [[ConversationViewController alloc]init];
    [self.navigationController pushViewController:conversationView animated:YES];
}

#pragma mark - actionSheet methods
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            int yorig = 0;
            CGRect frame = deleteButton.superview.frame;
            
            for(UIView *view in [messagesView scrollView].subviews) {
                
                if(view.tag >= deleteButton.tag) {
                    if(view.tag == deleteButton.tag) {
                        [UIView animateWithDuration:0.25f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            [view setFrame:CGRectMake(-view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
                            
                        } completion:^(BOOL finished) {
                            [view removeFromSuperview];
                        }];
                        
                    } else {
                        CGRect temp = view.frame;
                        
                        [UIView animateWithDuration:0.25f delay:0.2f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            [view setFrame:frame];
                            
                        } completion:^(BOOL finished) {
                        }];
                        
                        yorig = view.frame.size.height + view.frame.origin.y;
                        frame = temp;
                    }
                }
            }
            
            [messagesView setYOrigin:yorig + 2];
            [messagesView.scrollView setContentSize:CGSizeMake(messagesView.scrollView.frame.size.width, yorig + 60)];
            
        } break;
            
        default:
            break;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height) {
        [messagesView messagesList:@[]];
    }
}


@end
