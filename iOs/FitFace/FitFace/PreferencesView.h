//
//  PreferencesView.h
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol PreferenceViewDelegate <UIScrollViewDelegate>

-(IBAction)onMatchListButtonTap:(id)sender;
-(IBAction)onHourButtonTap:(id)sender;
-(IBAction)onDayButtonTap:(id)sender;
-(IBAction)onSaveButtonTap:(id)sender;

@end

@interface PreferencesView : BaseView {
    UIScrollView *hourScroll;
    UIScrollView *dayScroll;
//    UIDatePicker *leftPicker;
}

@property (nonatomic, weak) id <PreferenceViewDelegate> preferenceDelegate;

@end
