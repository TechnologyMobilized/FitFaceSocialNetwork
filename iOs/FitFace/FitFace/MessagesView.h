//
//  MessagesView.h
//  fitface
//
//  Created by LLDM 0037 on 3/30/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol MessagesViewDelegate <UIScrollViewDelegate, UIGestureRecognizerDelegate, UIActionSheetDelegate>

-(void)onMessageSwipe:(UISwipeGestureRecognizer *)gesture;
-(IBAction)onDeleteButtonTap:(id)sender;
-(IBAction)onReplyButtonTap:(id)sender;
-(void)onMessageTap:(UITapGestureRecognizer *)gesture;

@end

@interface MessagesView : BaseView {
    int tag;
}

@property (nonatomic, weak)id <MessagesViewDelegate> messagesDelegate;
@property (nonatomic, strong) UIScrollView *scrollView;
@property int yOrigin;

-(void)messagesList:(NSArray *)messagesArray;

@end
