//
//  FitnessPartnersViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "FitnessPartnersViewController.h"

@interface FitnessPartnersViewController ()

@end

@implementation FitnessPartnersViewController

-(void)loadView {
    fitnessPartners = [[FitnessPartnersView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [fitnessPartners setBaseViewDelegate:self];
    [fitnessPartners setFitnessPartnersDelegate:self];
    
    [self setView:fitnessPartners];
    [fitnessPartners setupLayout];
    
    [fitnessPartners fitnessPartnersList:@[]];
}

-(void)viewWillAppear:(BOOL)animated {
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            [btn setHidden:YES];
        }
    }
    
    self.navigationController.navigationBar.barTintColor = [BaseView colorWithHexString:THEME_COLOR];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setTitle:@"Fitness Partners"];
    
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

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - actionSheet methods
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            int yorig = 0;
            CGRect frame = button.superview.frame;
            
            for(UIView *view in [fitnessPartners scrollView].subviews) {
                
                if(view.tag >= button.tag) {
                    if(view.tag == button.tag) {
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
            
            [fitnessPartners setYOrigin:yorig + 2];
            [fitnessPartners.scrollView setContentSize:CGSizeMake(fitnessPartners.scrollView.frame.size.width, yorig + 60)];
            
        } break;
            
        default:
            break;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    
    if (bottomEdge >= scrollView.contentSize.height) {
        [fitnessPartners fitnessPartnersList:@[]];
    }
}

#pragma mark - FitnessPartnersViewDelegate Methods
-(IBAction)onDeleteButtonTap:(id)sender {
    button = (UIButton *)sender;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Delete?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Yes", nil];
    
    [actionSheet showInView:self.view];
}

-(IBAction)onMessageButtonTap:(id)sender {
    ConversationViewController *conversationView = [[ConversationViewController alloc]init];
    [self.navigationController pushViewController:conversationView animated:YES];
}

-(IBAction)onProfileButtonTap:(id)sender {
    ProfileViewController *profileView = [[ProfileViewController alloc]init];
    [profileView setFromFitnessScreen:YES];
    [self.navigationController pushViewController:profileView animated:YES];
    
}

@end
