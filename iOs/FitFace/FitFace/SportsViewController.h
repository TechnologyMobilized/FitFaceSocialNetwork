//
//  SportsViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/2/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SportsView.h"

@interface SportsViewController : BaseViewController<SportsViewDelegate> {
    SportsView *sportsView;
    NSMutableArray *sports;
}

@end
