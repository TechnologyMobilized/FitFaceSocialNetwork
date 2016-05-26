//
//  AchievementEntryView.h
//  fitface
//
//  Created by LLDM 0037 on 4/21/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol AchievementEntryViewDelegate

- (IBAction)editAchievement:(id)sender;
- (IBAction)deleteAchievement:(id)sender;

@end

@interface AchievementEntryView : BaseView

@property int yOrigin;
@property int viewTag;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UIButton *editButton;
@property (nonatomic, strong) UILabel *achievementTitle;
@property (nonatomic, strong) UILabel *achievementEvent;
@property (nonatomic, weak) id<AchievementEntryViewDelegate> delegate;

@end
