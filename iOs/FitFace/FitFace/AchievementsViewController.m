//
//  AchievementsViewController.m
//  fitface
//
//  Created by LLDM 0037 on 2/17/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "AchievementsViewController.h"

static AchievementsViewController *instance = nil;

@interface AchievementsViewController ()

@end

@implementation AchievementsViewController


+ (AchievementsViewController *) getInstance {
    return instance;
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"SUBVIEWS: %@", self.navigationController.navigationBar.subviews);
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            [view setHidden:YES];
        }
    }
    
    NSLog(@"%@", self.achievementTitle);
    NSLog(@"%@", self.event);
    
    if(self.event != nil) {
        [self addAchievement];
    }

    [self navigationTopView];
    
    
}

- (void)viewDidDisappear:(BOOL)animated {
    
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            UILabel *lblText = (UILabel *)view;
            [lblText removeFromSuperview];
        }
        
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            
            if([btn isHidden] != YES) {
                [btn removeFromSuperview];
                
            } else {
                [btn setHidden:NO];
            }
        }
    }
}

- (void)loadView {
    
    instance = self;
    
    achievementView = [[AchievementsView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [achievementView setBaseViewDelegate:self];
    [achievementView setAchievementDelegate:self];
    [achievementView setupLayout];
    [self setView:achievementView];
    
    [achievementView setIsMyProfile:self.isMyProfile];

    [achievementView achievementsList:@[]];
}

- (void)navigationTopView {
    UIImageView *imgViewLeftButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [imgViewLeftButton setImage:[UIImage imageNamed:@"ic_arrow_back"]];
    imgViewLeftButton.contentMode = UIViewContentModeScaleAspectFill;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.bounds = CGRectMake(0, 0, 22, 22);
    backButton.userInteractionEnabled = YES;
    [backButton setImage:imgViewLeftButton.image forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barBtnItemLeft = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = barBtnItemLeft;
    self.navigationItem.hidesBackButton = YES;
    
    [self.navigationItem setTitle:@"Achievements"];
    
    if(self.isMyProfile) {
        
        UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
        [addButton setBackgroundImage:[UIImage imageNamed:@"plus-menu"] forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
        
    }
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

-(void) addAchievement {
    NSLog(@"ADD");
    AchievementEntryView *newAchievement = [[AchievementEntryView alloc]initWithFrame:CGRectMake(13, 12, self.view.frame.size.width - 26, 59)];
    [newAchievement setTag:0];
    [newAchievement.editButton setTag:0];
    [newAchievement.deleteButton setTag:0];
    [newAchievement.achievementTitle setText:self.achievementTitle];
    [newAchievement.achievementEvent setText:self.event];
    [newAchievement.deleteButton setHidden:NO];
    [newAchievement.editButton  setHidden:NO];
    [achievementView.scrollView addSubview:newAchievement];
    
    int yorigin = newAchievement.frame.size.height + 13;
    int tag = 1;
    
    for(AchievementEntryView *view in achievementView.scrollView.subviews) {
        if(view.frame.origin.x > 13) {
            [view setFrame:CGRectMake(view.frame.origin.x, yorigin, view.frame.size.width, view.frame.size.height)];
            yorigin += view.frame.size.height + 1;
            [view setTag:tag];
            [view.editButton setTag:tag];
            [view.deleteButton setTag:tag];
            tag += 1;
        }
    }
}

- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addClick:(id)sender {
    NSLog(@"ADD");
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:[[AddAchievementViewController alloc]init]];
    [self presentViewController:navController animated:YES completion:nil];
}

#pragma mark - Achievement Delegate
- (IBAction)editAchievement:(id)sender {
    NSLog(@"EDIT");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                                   message:@"Functionality Coming Soon"
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
    [alert show];
}

- (IBAction)deleteAchievement:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSLog(@"DELETE TAG - %ld", (long)btn.tag);
    NSLog(@"view -- %@", btn.superview);
    int yorig = 0;
    CGRect frame = btn.superview.frame;
    
    AchievementEntryView *achievement = [[AchievementEntryView alloc]initWithFrame:CGRectMake(frame.origin.x, achievementView.yOrigin + 1, frame.size.width, frame.size.height)];
    [achievementView.scrollView addSubview:achievement];
    [achievement.editButton setHidden:NO];
    [achievement.deleteButton setHidden:NO];
    [achievement.editButton setTag:achievementView.viewTag];
    [achievement.deleteButton setTag:achievementView.viewTag];
    
    [achievement setTag:achievementView.viewTag];
    
    for(AchievementEntryView *view in [achievementView scrollView].subviews) {
        if(view.tag >= btn.tag) {
            if(view.tag == btn.tag) {
                [UIView animateWithDuration:0.25f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    [view setFrame:CGRectMake(-view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
                    [view setAlpha:0];
                } completion:^(BOOL finished) {
                    [view removeFromSuperview];
                }];
            } else {
                [achievementView setViewTag:(int)view.tag];
                CGRect temp = view.frame;
                [UIView animateWithDuration:0.25f delay:0.2f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    
                    [view setFrame:frame];
                    [view setTag:view.tag - 1];
                    [view.editButton setTag:view.editButton.tag - 1];
                    [view.deleteButton setTag:view.deleteButton.tag - 1];
                    
                } completion:^(BOOL finished) {
                    
                }];
                
                yorig = view.frame.size.height + view.frame.origin.y;
//                [[achievementView scrollView] setContentSize:CGSizeMake([achievementView scrollView].frame.size.width, yorig + 60)];
                frame = temp;
            }
        }
    }
    
    [achievementView setYOrigin:yorig + 1];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height) {
        [achievementView achievementsList:@[]];
    }
}

@end
