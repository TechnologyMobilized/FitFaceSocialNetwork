//
//  SendMessageView.h
//  fitface
//
//  Created by LLDM 0037 on 4/22/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol SendMessageViewDelegate <UITextFieldDelegate>

-(void)onSendMessageButtonTap:(id)sender;

@end

@interface SendMessageView : BaseView

@property (nonatomic, weak)id <SendMessageViewDelegate> sendMessageDelegate;

@end
