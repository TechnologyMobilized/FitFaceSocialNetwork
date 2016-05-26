//
//  CommunityView.h
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol CommunityViewDelegate <UITextFieldDelegate>

-(void)onScreenTap:(UIGestureRecognizer *)sender;

@end

@interface CommunityView : BaseView

@property (nonatomic, weak) id <CommunityViewDelegate> communityDelegate;
@property (nonatomic, strong) UITextField *locationField;
@property (nonatomic, strong) UITextField *dateField;

@end
