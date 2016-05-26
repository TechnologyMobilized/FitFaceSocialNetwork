//
//  SendMessageViewController.h
//  fitface
//
//  Created by LLDM 0037 on 4/22/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SendMessageView.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface SendMessageViewController : BaseViewController <SendMessageViewDelegate> {
    SendMessageView *sendMessageView;
}

@end
