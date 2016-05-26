//
//  SportsView.h
//  fitface
//
//  Created by LLDM 0037 on 3/2/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol SportsViewDelegate <UIScrollViewDelegate, UIActionSheetDelegate>

-(IBAction)onAllButtonTap:(id)sender;
-(IBAction)onMatchesOnlyTap:(id)sender;

@end

@interface SportsView : BaseView {
    UIScrollView *scrollView;
    UIView *buttonsContainer;
    UIView *popupContainer;
    NSArray *images;
    int yOrigin;
    int tag;
}

@property (nonatomic, weak) id<SportsViewDelegate> sportsDelegate;

-(void)sportsList:(NSArray *)sportsArray;

@end
