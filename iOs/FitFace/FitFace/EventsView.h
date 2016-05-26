//
//  EventsView.h
//  fitface
//
//  Created by LLDM 0037 on 3/2/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol EventsViewDelegate <UIScrollViewDelegate, UIActionSheetDelegate>

-(void)onEventViewTap:(id)sender;

@end

@interface EventsView : BaseView {
    UIScrollView *scrollView;
    int yOrigin;
    int tag;
}

@property (nonatomic, weak) id<EventsViewDelegate> eventsDelegate;

-(void)eventsList:(NSArray *)eventsArray;

@end
