//
//  ConversationViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/31/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "BaseViewController.h"
#import "ConversationView.h"

@interface ConversationViewController : BaseViewController <ConversationViewDelegate> {
    ConversationView *conversationView;
    UIView *superview;
    int currentInset;
    NSString *text;
}

@end
