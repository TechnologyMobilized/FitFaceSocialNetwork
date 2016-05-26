//
//  AchievementsView.h
//  fitface
//
//  Created by LLDM 0037 on 2/17/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "AchievementEntryView.h"

@protocol AchievementViewDelegate;

@interface AchievementsView : BaseView {
//    UIScrollView *scrollView;
//    float yOrigin;
//    int tag;
}

@property (nonatomic, weak) id <AchievementViewDelegate> achievementDelegate;
@property (nonatomic, strong) UIScrollView *scrollView;
@property int yOrigin;
@property int viewTag;
@property (nonatomic) BOOL isMyProfile;

- (void)achievementsList:(NSArray *)achievementArray;

@end

@protocol AchievementViewDelegate <UIScrollViewDelegate, AchievementEntryViewDelegate>

//- (IBAction)editAchievement:(id)sender;
//- (IBAction)deleteAchievement:(id)sender;

@end