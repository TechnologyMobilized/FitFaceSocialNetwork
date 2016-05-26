//
//  EventsViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/2/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "EventsView.h"
#import "EventPageViewController.h"

@interface EventsViewController : BaseViewController<EventsViewDelegate> {
    EventsView *eventsView;
}

@end
