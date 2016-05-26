//
//  CommunityViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CommunityView.h"

@interface CommunityViewController : BaseViewController <CommunityViewDelegate> {
    CommunityView *communityView;
}

@end
