//
//  FitnessInformationViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/18/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "FitnessInformationView.h"
#import "CommunityViewController.h"

@interface FitnessInformationViewController : BaseViewController <FitnessInformationViewDelegate, UIActionSheetDelegate> {
    FitnessInformationView *fitnessInformationView;
    NSArray *sportsList;
    NSMutableArray *choices;
    NSArray *trainingList;
    NSArray *martialArtsList;
    UIPickerView *picker;
    NSMutableArray *gymsArray;
    NSMutableArray *outdoorsArray;
    NSMutableArray *trainingArray;
    NSMutableArray *sportsArray;
    NSMutableArray *martialArtsArray;
    NSMutableArray *involvementArray;
    UILabel *selectedLabel;
    NSIndexPath *selectedPath;
}

@end
