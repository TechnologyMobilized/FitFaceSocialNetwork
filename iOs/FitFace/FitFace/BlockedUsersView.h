//
//  BlockedUsersView.h
//  fitface
//
//  Created by LLDM 0037 on 3/17/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol BlockedUsersViewDelegate <UIScrollViewDelegate>

-(IBAction)onUnblockButtonTap:(id)sender;

@end

@interface BlockedUsersView : BaseView {
    UIScrollView *scrollView;
//    int yOrigin;
    int tag;
}

@property (nonatomic, weak) id <BlockedUsersViewDelegate> blockedUsersDelegate;
@property int yOrigin;

-(void)blockedList:(NSArray *)blockedUsersArray;

@end
