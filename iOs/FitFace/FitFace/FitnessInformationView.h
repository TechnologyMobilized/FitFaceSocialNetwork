//
//  FitnessInformationView.h
//  fitface
//
//  Created by LLDM 0037 on 3/18/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol FitnessInformationViewDelegate <UIScrollViewDelegate, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate>


@end

@interface FitnessInformationView : BaseView {
    UIView *mainView;
    UIButton *updateButton;
}

@property (nonatomic, weak) id <FitnessInformationViewDelegate> fitnessInformationDelegate;
@property (nonatomic, strong) UITableView *tableView;

@end
