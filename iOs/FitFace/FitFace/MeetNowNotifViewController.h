//
//  MeetNowNotifViewController.h
//  fitface
//
//  Created by LLDM 0037 on 4/8/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MeetNowNotifView.h"
#import "SDWebImage/SDWebImageManager.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "SendMessageViewController.h"

@interface MeetNowNotifViewController : BaseViewController <MeetNowNotifViewDelegate> {
    MeetNowNotifView *meetNowView;;
    NSMutableArray *dataArray;
    NSMutableArray *reasonsArray;
    UIScrollView *scrollView;
    int yOrigin;
}

@end
