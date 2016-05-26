//
//  Membership.m
//  fitface
//
//  Created by Launch Labs on 2/12/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "Membership.h"

@implementation Membership
@synthesize membershipId,membershipName,membershipAddress,membershipStartDate,membershipWorkoutBuds;
- (id)init{
    self = [super init];
    
    if(self){
        membershipId = @"";
        membershipName= @"";
        membershipAddress= @"";
        membershipStartDate= @"";
        membershipWorkoutBuds= 0;
    }
    
    return self;
}

- (id) initWithMembershipId: (NSString*)mId name:(NSString*)name address:(NSString*)address startDate:(NSString*)startDate budsCount: (int) budsCount{
    self = [super init];
    
    if(self){
        membershipId = mId;
        membershipName= name;
        membershipAddress= address;
        membershipStartDate= startDate;
        membershipWorkoutBuds= budsCount;
    }
    
    return self;
}
@end
