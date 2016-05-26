//
//  Achievement.m
//  fitface
//
//  Created by Launch Labs on 2/15/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "Achievement.h"

@implementation Achievement
@synthesize achievementId,achievementTitle, achievementEvent;

- (id)initWithAchievementId:(NSString*)aId title:(NSString*)title event:(NSString*)event{
    
    self =[super init];
    
    if(self){
        achievementId=aId;
        achievementTitle = title;
        achievementEvent = event;
    }
    return self;
}
@end
