//
//  FitnessPartnersViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "FitnessPartnersView.h"
#import "ProfileViewController.h"
#import "ConversationViewController.h"

@interface FitnessPartnersViewController : BaseViewController <FitnessPartnersViewDelegate> {
    FitnessPartnersView *fitnessPartners;
    UIButton *button;
}

@end
