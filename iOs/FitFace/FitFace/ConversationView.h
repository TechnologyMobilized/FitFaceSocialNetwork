//
//  ConversationView.h
//  fitface
//
//  Created by LLDM 0037 on 3/31/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol ConversationViewDelegate <UIScrollViewDelegate, UITextFieldDelegate>

-(void)addDateReceived;

@end

@interface ConversationView : BaseView

@property (nonatomic, weak)id <ConversationViewDelegate> conversationDelegate;
@property (nonatomic, strong) UIScrollView *scrollView;
@property int yOrigin;


@end
