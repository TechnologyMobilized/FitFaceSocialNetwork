//
//  AchievementsView.m
//  fitface
//
//  Created by LLDM 0037 on 2/17/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "AchievementsView.h"

@implementation AchievementsView
@synthesize achievementDelegate, scrollView, yOrigin;

- (void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setDelegate:achievementDelegate];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:scrollView];
    
//    [scrollView setBackgroundColor:[UIColor lightGrayColor]];
    
    yOrigin = 12;
    self.viewTag = 0;
}

- (void)achievementsList:(NSArray *)achievementArray {
    
    for (int x = 0; x < 10; x++) {
        AchievementEntryView *achievement = [[AchievementEntryView alloc]initWithFrame:CGRectMake(13, yOrigin, scrollView.frame.size.width - 26, 59)];
//        [achievement.editButton addTarget:self.achievementDelegate action:@selector(editAchievement:) forControlEvents:UIControlEventTouchUpInside];
//        [achievement.deleteButton addTarget:self.achievementDelegate action:@selector(deleteAchievement:) forControlEvents:UIControlEventTouchUpInside];
        [achievement setDelegate:self.achievementDelegate];
        [achievement setTag:self.viewTag];
        [achievement.deleteButton setTag:self.viewTag];
        [achievement.editButton setTag:self.viewTag];
        [scrollView addSubview:achievement];
//        UIView *viewAchievement = [[UIView alloc] initWithFrame:CGRectMake(13, yOrigin, scrollView.frame.size.width - 26, 59)];
//        [viewAchievement setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
//        [viewAchievement setTag:tag];
//        [scrollView addSubview:viewAchievement];
//        
//        UIView *viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, viewAchievement.frame.size.height)];
//        [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
//        [viewAchievement addSubview:viewBorder];
//        
//        UIImageView *imgRibbon = [[UIImageView alloc] initWithFrame:CGRectMake(viewBorder.frame.size.width + viewBorder.frame.origin.x + 8, 16, 12, 12)];
//        [imgRibbon setImage:[UIImage imageNamed:@"ic_ribbon"]];
//        [viewAchievement addSubview:imgRibbon];
//        
//        UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(imgRibbon.frame.size.width + imgRibbon.frame.origin.x + 8, 17, 180, 12)];
//        [lblTitle setText:[NSString stringWithFormat:@"Most Valuable Player"]];
//        [lblTitle setTextAlignment:NSTextAlignmentLeft];
//        [lblTitle setTextColor:[BaseView colorWithHexString:@"000000"]];
//        [lblTitle setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
//        [viewAchievement addSubview:lblTitle];
//        
//        UILabel *lblEvent = [[UILabel alloc] initWithFrame:CGRectMake(lblTitle.frame.origin.x, lblTitle.frame.origin.y + lblTitle.frame.size.height + 5, lblTitle.frame.size.width, 10)];
//        [lblEvent setText:[NSString stringWithFormat:@"ABC Basketball League"]];
//        [lblEvent setTextColor:[BaseView colorWithHexString:@"838383"]];
//        [lblEvent setTextAlignment:NSTextAlignmentLeft];
//        [lblEvent setFont:[UIFont fontWithName:AVENIR_BOOK size:8]];
//        [viewAchievement addSubview:lblEvent];
//        
//        UIButton *btnEdit = [[UIButton alloc] initWithFrame:CGRectMake(viewAchievement.frame.size.width - 80, 13, 33, 33)];
//        [btnEdit setBackgroundImage:[UIImage imageNamed:@"pencil"] forState:UIControlStateNormal];
//        [btnEdit addTarget:achievementDelegate action:@selector(editAchievement:) forControlEvents:UIControlEventTouchUpInside];
//    
//        UIButton *btnDelete = [[UIButton alloc] initWithFrame:CGRectMake(viewAchievement.frame.size.width - 40, 13, 33, 33)];
//        [btnDelete setBackgroundImage:[UIImage imageNamed:@"trash_icon"] forState:UIControlStateNormal];
//        [btnDelete setTag:tag];
//        
//        [btnDelete addTarget:achievementDelegate action:@selector(deleteAchievement:) forControlEvents:UIControlEventTouchUpInside];
//        
//        
        if(self.isMyProfile) {
            [achievement.editButton setHidden:NO];
            [achievement.deleteButton setHidden:NO];
        }
        
        yOrigin += achievement.frame.size.height + 1;
        self.viewTag += 1;
    }

    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin + 60)];
}

@end
