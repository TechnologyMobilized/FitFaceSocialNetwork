//
//  Membership.h
//  fitface
//
//  Created by Launch Labs on 2/12/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Membership : NSObject
@property (nonatomic, strong) NSString *membershipId;
@property (nonatomic, strong) NSString *membershipName;
@property (nonatomic, strong) NSString *membershipAddress;
@property (nonatomic, strong) NSString *membershipStartDate;
@property (nonatomic) NSInteger membershipWorkoutBuds;
- (id) init;
- (id) initWithMembershipId: (NSString*)mId name:(NSString*)name address:(NSString*)address startDate:(NSString*)startDate budsCount: (int) budsCount;
@end
