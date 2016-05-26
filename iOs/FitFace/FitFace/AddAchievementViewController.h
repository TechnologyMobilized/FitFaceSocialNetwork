//
//  AddAchievementViewController.h
//  fitface
//
//  Created by LLDM 0037 on 4/21/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "AddAchievementView.h"

@interface AddAchievementViewController : BaseViewController <AddAchievementViewDelegate> {
    AddAchievementView *addAchievementView;
}

@end
