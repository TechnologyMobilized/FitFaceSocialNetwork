//
//  AchievementsViewController.h
//  fitface
//
//  Created by LLDM 0037 on 2/17/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "BaseViewController.h"
#import "AchievementsView.h"
#import "AddAchievementViewController.h"

@interface AchievementsViewController : BaseViewController <AchievementViewDelegate> {
    AchievementsView *achievementView;
}

@property BOOL isMyProfile;
@property (nonatomic, strong) NSString *achievementTitle;
@property (nonatomic, strong) NSString *event;

+ (AchievementsViewController *) getInstance;

@end
