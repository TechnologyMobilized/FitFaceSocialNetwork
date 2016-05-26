//
//  Sport.m
//  fitface
//
//  Created by Launch Labs on 2/12/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "Sport.h"

@implementation Sport
@synthesize sportId,sportName,sportImage;

- (id)init{
    self = [super init];
    if(self){
        sportId=@"";
        sportName= @"";
        sportImage = nil;
    }
    return self;
}
- (id)initWithSportId: (NSString*)sId name:(NSString *)name image:(UIImage*)image{
    self = [super init];
    if(self){
        self.sportId=sportId;
        sportName= name;
        sportImage = image;
    }
    return self;
}
@end
