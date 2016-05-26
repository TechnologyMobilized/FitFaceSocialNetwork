//
//  FitnessInformationView.m
//  fitface
//
//  Created by LLDM 0037 on 3/18/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "FitnessInformationView.h"

@implementation FitnessInformationView

-(void)setupLayout {
    mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height - 44)];
    [self.tableView setDataSource:self.fitnessInformationDelegate];
    [self.tableView setDelegate:self.fitnessInformationDelegate];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:self.tableView];
    
    
}

@end
