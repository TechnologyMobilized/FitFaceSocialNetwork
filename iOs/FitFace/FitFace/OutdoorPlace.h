//
//  OutdoorPlace.h
//  fitface
//
//  Created by Launch Labs on 2/15/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OutdoorPlace : NSObject

@property (nonatomic, strong) NSString *outdoorPlaceId;
@property (nonatomic, strong) NSString *outdoorPlaceName;
@property (nonatomic, strong) NSString *outdoorPlaceLocation;
@property (nonatomic, strong) NSString *outdoorPlaceSportSchedule;
@property (nonatomic, strong) NSString *outdoorPlaceStartDate;
@property (nonatomic) int outdoorPlaceBudsCount;
- (id)initWithPlaceId:(NSString *)placeId placeName:(NSString*)placeName location:(NSString*)location schedule:(NSString*)schedule startDate:(NSString*)startDate budsCount:(int)budsCount;
@end
