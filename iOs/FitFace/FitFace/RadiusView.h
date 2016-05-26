//
//  RadiusView.h
//  fitface
//
//  Created by LLDM 0037 on 4/22/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol RadiusViewDelegate <UIGestureRecognizerDelegate>

-(void)onRadiusEntryTap:(UITapGestureRecognizer *)gesture;
-(void)onUpdateButtonTap:(id)sender;

@end

@interface RadiusView : BaseView {
    UIScrollView *scrollView;
    int yOrigin;
    int selectedIndex;
    NSString *selectedLabel;
}

@property (nonatomic, weak)id <RadiusViewDelegate> radiusDelegate;
@property (nonatomic, strong) UIView *currentlySelected;

@end
