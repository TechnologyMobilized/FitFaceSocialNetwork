//
//  Sport.h
//  fitface
//
//  Created by Launch Labs on 2/12/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Sport : NSObject

@property(nonatomic, strong) NSString *sportId;
@property(nonatomic, strong) NSString *sportName;
@property(nonatomic, strong) UIImage *sportImage;

- (id)init;
- (id)initWithSportId: (NSString*)sportId name:(NSString *)name image:(UIImage*)image;
@end
