//
//  AboutView.h
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol AboutViewDelegate

-(IBAction)onMenuButtonTap:(id)sender;
-(IBAction)onCallButtonTap:(id)sender;
-(IBAction)onMailButtonTap:(id)sender;
-(IBAction)onFacebookButtonTap:(id)sender;
-(IBAction)onTwitterButtonTap:(id)sender;

@end

@interface AboutView : BaseView {
    UIScrollView *scrollView;
}

@property(nonatomic, weak) id <AboutViewDelegate> aboutDelegate;

@end
