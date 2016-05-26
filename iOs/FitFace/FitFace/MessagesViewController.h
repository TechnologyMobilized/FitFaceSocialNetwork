//
//  MessagesViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/30/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MessagesView.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "HomeViewController.h"
#import "ConversationViewController.h"

@interface MessagesViewController : BaseViewController <MessagesViewDelegate> {
    MessagesView *messagesView;
    UIView *prevView;
    UIButton *deleteButton;
}

@end
