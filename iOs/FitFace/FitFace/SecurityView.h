//
//  SecurityView.h
//  fitface
//
//  Created by LLDM 0037 on 3/16/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol SecurityViewDelegate

-(IBAction)onSMSButtonTap:(id)sender;
-(IBAction)onEmailButtonTap:(id)sender;
-(IBAction)onResetButtonTap:(id)sender;
-(IBAction)onUpdateButtonTap:(id)sender;

@end

@interface SecurityView : BaseView {
    BOOL smsActive;
    BOOL emailActive;
}

@property (nonatomic, weak) id <SecurityViewDelegate> securityDelegate;
@property (nonatomic, strong) UIImageView *smsSwitchIcon;
@property (nonatomic, strong) UIImageView *emailSwitchIcon;
@property (nonatomic, strong) UIImageView *resetIcon;
@property (nonatomic, strong) UIButton *updateButton;

@end
