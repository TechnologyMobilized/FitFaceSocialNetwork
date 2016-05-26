//
//  Achievement.h
//  fitface
//
//  Created by Launch Labs on 2/15/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Achievement : NSObject

@property(nonatomic, strong ) NSString * achievementId;
@property(nonatomic, strong ) NSString * achievementTitle;
@property(nonatomic, strong ) NSString * achievementEvent;
- (id)initWithAchievementId:(NSString*)aId title:(NSString*)title event:(NSString*)event;
@end
