//
//  RadiusViewController.m
//  fitface
//
//  Created by LLDM 0037 on 4/22/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "RadiusViewController.h"

@interface RadiusViewController ()

@end

@implementation RadiusViewController

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
    
    radiusView = [[RadiusView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [radiusView setBaseViewDelegate:self];
    [radiusView setRadiusDelegate:self];
    
    [radiusView setupLayout];
    [self setView:radiusView];
    
    [self.navigationItem setTitle:@"Radius"];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    selectedEntry = radiusView.currentlySelected;
    
    NSLog(@"IN HERE -- %@", selectedEntry);
    
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - RadiusViewDelegate methods
-(void)onRadiusEntryTap:(UITapGestureRecognizer *)gesture {
    UIView *tappedView = (UIView *)gesture.view;
    if(tappedView == selectedEntry) {
//        UIImageView *selectionIcon = (UIImageView *)[tappedView viewWithTag:3];
//        [selectionIcon setHidden:YES];
//        selectedEntry = nil;
    } else {
        [[selectedEntry viewWithTag:40] setHidden:YES];
        [[tappedView viewWithTag:40] setHidden:NO];
        selectedEntry = tappedView;
        
        UIButton *updateButton = (UIButton *)[self.view viewWithTag:100];
        [updateButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [updateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
    }
}

-(void)onUpdateButtonTap:(id)sender {
    UIButton *updateButton = (UIButton *)sender;
    [updateButton setBackgroundColor:[BaseView colorWithHexString:@"D2EBD4"]];
    [updateButton setTitle:@"SUCCESSFULLY UPDATED" forState:UIControlStateNormal];
    [updateButton setTitleColor:[BaseView colorWithHexString:@"748074"] forState:UIControlStateNormal];
    
    NSMutableDictionary *selectionInfo = [[NSMutableDictionary alloc]init];
    NSString *selectedLabel = ((UILabel *)[selectedEntry viewWithTag:20]).text;
    [selectionInfo setValue:[NSNumber numberWithInt:(int)selectedEntry.tag] forKey:@"selectedIndex"];
    [selectionInfo setValue:selectedLabel forKey:@"selectedLabel"];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:selectionInfo forKey:@"selectionInfo"];
    [userDefault synchronize];
    
    NSLog(@"SELECTED -- %@", selectionInfo);
    
//    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
