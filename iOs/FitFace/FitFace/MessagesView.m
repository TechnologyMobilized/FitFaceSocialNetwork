//
//  MessagesView.m
//  fitface
//
//  Created by LLDM 0037 on 3/30/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "MessagesView.h"

@implementation MessagesView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [self.scrollView setBackgroundColor:[UIColor whiteColor]];
    [self.scrollView setDelegate:self.messagesDelegate];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:self.scrollView];
    
    NSLog(@"-- %@", self.scrollView.subviews);
    
    self.yOrigin = 14;
    tag = 0;
}

-(void)messagesList:(NSArray *)messagesArray {
    for(int i = 0; i < 10; i++) {
        UIView *messageContainer = [[UIView alloc]initWithFrame:CGRectMake(16, self.yOrigin, [[UIScreen mainScreen]bounds].size.width - 32, 60)];
//        [messageContainer setBackgroundColor:[UIColor blackColor]];
        [messageContainer setTag:tag];
        [self.scrollView addSubview:messageContainer];
        
        UIButton *replyButton = [[UIButton alloc]initWithFrame:CGRectMake(messageContainer.frame.size.width - 75, 14, 31, 31)];
        [replyButton setBackgroundImage:[UIImage imageNamed:@"reply_blue"] forState:UIControlStateNormal];
        [replyButton addTarget:self.messagesDelegate action:@selector(onReplyButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [replyButton setTag:tag];
        [messageContainer addSubview:replyButton];
        
        UIButton *deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(messageContainer.frame.size.width - 34, 14, 31, 31)];
        [deleteButton setBackgroundImage:[UIImage imageNamed:@"trash_blue"] forState:UIControlStateNormal];
        [deleteButton addTarget:self.messagesDelegate action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [deleteButton setTag:tag];
        [messageContainer addSubview:deleteButton];
        
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self.messagesDelegate action:@selector(onMessageSwipe:)];
        [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self.messagesDelegate action:@selector(onMessageSwipe:)];
        [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
        UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]initWithTarget:self.messagesDelegate action:@selector(onMessageTap:)];
        
        UIView *message = [[UIView alloc]initWithFrame:CGRectMake(0, 0, messageContainer.frame.size.width, messageContainer.frame.size.height)];
        [message setBackgroundColor:[BaseView colorWithHexString:@"F6F5F7"]];
        [messageContainer addSubview:message];
        [message addGestureRecognizer:swipeLeft];
        [message addGestureRecognizer:swipeRight];
        [message addGestureRecognizer:tapped];
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 3, message.frame.size.height)];
        [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [message addSubview:border];
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + 10, 15, 212, 15)];
        [nameLabel setText:@"Henry Oliver"];
        [nameLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:13]];
        [nameLabel setTextColor:[BaseView colorWithHexString:@"545354"]];
        [nameLabel setTag:100];
        [message addSubview:nameLabel];
        
        UILabel *messageReceived = [[UILabel alloc]initWithFrame:CGRectMake(message.frame.size.width - 70, 12, 70, 8)];
        [messageReceived setText:@"JUST NOW"];
        [messageReceived setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
        [messageReceived setTextColor:[BaseView colorWithHexString:@"C1C2C3"]];
        [messageReceived setTextAlignment:NSTextAlignmentCenter];
        [message addSubview:messageReceived];
        
        UIImageView *replyIcon = [[UIImageView alloc]initWithFrame:CGRectMake(nameLabel.frame.origin.x, nameLabel.frame.size.height + nameLabel.frame.origin.y + 5, 10, 9)];
        [replyIcon setImage:[UIImage imageNamed:@"reply_gray"]];
        [message addSubview:replyIcon];
        
        UILabel *messageSnippet = [[UILabel alloc]initWithFrame:CGRectMake(nameLabel.frame.origin.x + 14, nameLabel.frame.size.height + nameLabel.frame.origin.y, message.frame.size.width - 30, 18)];
        [messageSnippet setText:@"Aesthetic next level narwhal seitan, scenester franzen."];
        [messageSnippet setBackgroundColor:[BaseView colorWithHexString:@"F6F5F7"]];
        [messageSnippet setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
        [messageSnippet setTextColor:[BaseView colorWithHexString:@"B6B5B6"]];
        [message addSubview:messageSnippet];
        
        self.yOrigin += messageContainer.frame.size.height + 2;
        tag += 1;
    }
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, self.yOrigin + 60)];
}

@end
