//
//  BlockedUsersViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/17/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "BlockedUsersView.h"

@interface BlockedUsersViewController : BaseViewController <BlockedUsersViewDelegate> {
    BlockedUsersView *blockedUsersView;
}

@end
