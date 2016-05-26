//
//  OutdoorPlace.m
//  fitface
//
//  Created by Launch Labs on 2/15/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "OutdoorPlace.h"

@implementation OutdoorPlace
@synthesize outdoorPlaceId,outdoorPlaceName, outdoorPlaceLocation,outdoorPlaceSportSchedule,outdoorPlaceStartDate,outdoorPlaceBudsCount;

- (id)initWithPlaceId:(NSString *)placeId placeName:(NSString*)placeName location:(NSString*)location schedule:(NSString*)schedule startDate:(NSString*)startDate budsCount:(int)budsCount{
    
    self = [super init  ];
    
    if(self){
        outdoorPlaceId = placeId;
        outdoorPlaceName = placeName;
        outdoorPlaceLocation = location;
        outdoorPlaceSportSchedule = schedule;
        outdoorPlaceStartDate = startDate;
        outdoorPlaceBudsCount  = budsCount;
    }
    
    return self;
}
@end
