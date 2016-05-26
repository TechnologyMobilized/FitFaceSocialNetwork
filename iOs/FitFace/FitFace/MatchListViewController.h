//
//  MatchListViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MatchListView.h"

@interface MatchListViewController : BaseViewController <MatchListViewDelegate> {
    MatchListView *matchListView;
}

@end
