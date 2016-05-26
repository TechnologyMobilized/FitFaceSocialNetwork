//
//  AchievementEntryView.m
//  fitface
//
//  Created by LLDM 0037 on 4/21/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "AchievementEntryView.h"

@implementation AchievementEntryView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
//        UIView *viewAchievement = [[UIView alloc] initWithFrame:CGRectMake(13, self.yOrigin, frame.size.width, 59)];
        [self setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
//        [self setTag:self.tag];
        
        UIView *viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, self.frame.size.height)];
        [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [self addSubview:viewBorder];
        
        UIImageView *imgRibbon = [[UIImageView alloc] initWithFrame:CGRectMake(viewBorder.frame.size.width + viewBorder.frame.origin.x + 8, 16, 12, 12)];
        [imgRibbon setImage:[UIImage imageNamed:@"ic_ribbon"]];
        [self addSubview:imgRibbon];
        
        self.achievementTitle = [[UILabel alloc] initWithFrame:CGRectMake(imgRibbon.frame.size.width + imgRibbon.frame.origin.x + 8, 17, 180, 12)];
        [self.achievementTitle setText:[NSString stringWithFormat:@"Most Valuable Player"]];
        [self.achievementTitle setTextAlignment:NSTextAlignmentLeft];
        [self.achievementTitle setTextColor:[BaseView colorWithHexString:@"000000"]];
        [self.achievementTitle setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
        [self addSubview:self.achievementTitle];
        
        self.achievementEvent = [[UILabel alloc] initWithFrame:CGRectMake(self.achievementTitle.frame.origin.x, self.achievementTitle.frame.origin.y + self.achievementTitle.frame.size.height + 5, self.achievementTitle.frame.size.width, 10)];
        [self.achievementEvent setText:[NSString stringWithFormat:@"ABC Basketball League"]];
        [self.achievementEvent setTextColor:[BaseView colorWithHexString:@"838383"]];
        [self.achievementEvent setTextAlignment:NSTextAlignmentLeft];
        [self.achievementEvent setFont:[UIFont fontWithName:AVENIR_BOOK size:8]];
        [self addSubview:self.achievementEvent];
        
        self.editButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 80, 13, 33, 33)];
        [self.editButton setBackgroundImage:[UIImage imageNamed:@"pencil"] forState:UIControlStateNormal];
        [self.editButton addTarget:self.delegate action:@selector(editAchievement:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.editButton];
        [self.editButton setHidden:YES];
        
        self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 40, 13, 33, 33)];
        [self.deleteButton setBackgroundImage:[UIImage imageNamed:@"trash_icon"] forState:UIControlStateNormal];
//        [self.deleteButton setTag:self.tag];
        [self.deleteButton addTarget:self.delegate action:@selector(deleteAchievement:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.deleteButton];
        [self.deleteButton setHidden:YES];
        
//        [btnDelete addTarget:self action:@selector(deleteAchievement:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return  self;
}

@end
