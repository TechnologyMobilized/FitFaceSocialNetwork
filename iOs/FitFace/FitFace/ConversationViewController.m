//
//  ConversationViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/31/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "ConversationViewController.h"

@interface ConversationViewController ()

@end

@implementation ConversationViewController

-(void)loadView {
    conversationView = [[ConversationView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [conversationView setBaseViewDelegate:self];
    [conversationView  setConversationDelegate:self];
    [conversationView setupLayout];
    [self setView:conversationView];
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    currentInset = [[UIScreen mainScreen]bounds].size.height - 84;
    
//    [messagesView messagesList:@[]];
    NSLog(@"nav -- %@", NSStringFromCGRect(conversationView.scrollView.frame));
}

-(void)viewWillAppear:(BOOL)animated {

    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:backButton]];
    
    [self.navigationItem setTitle:[NSString stringWithFormat:@"%@", @"Jose Estrada"]];
    
    [self.navigationController.navigationBar setTranslucent:NO];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(IBAction)onBackButtonTap:(id)sender {
    NSLog(@"BACK BUTTON TAPPED");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)fieldNotification:(NSNotification*)notification {
    NSDictionary *keyboardInfo = [notification userInfo];
    NSValue *keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    
    [conversationView.scrollView setFrame:CGRectMake(0, 0, conversationView.frame.size.width, [[UIScreen mainScreen]bounds].size.height - keyboardFrameBeginRect.size.height - 84)];
    
    if(conversationView.yOrigin > conversationView.scrollView.frame.size.height) {
        NSLog(@"HERE");
        
        [conversationView.scrollView setContentSize:CGSizeMake(conversationView.scrollView.frame.size.width, currentInset + 10)];
        ////    [conversationView.scrollView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
        CGPoint bottomOffset = CGPointMake(0, conversationView.scrollView.contentSize.height - conversationView.scrollView.bounds.size.height);
        [conversationView.scrollView setContentOffset:bottomOffset animated:YES];
    }
    
    [superview setFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height - 84 - keyboardFrameBeginRect.size.height, superview.frame.size.width, superview.frame.size.height)];
    
}

-(void)adjustPositionWithHeight:(int)height {
    UIView *tempView;
    for(UIView *view in conversationView.scrollView.subviews) {
        if(view.frame.origin.y <= conversationView.yOrigin) {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y - height - 12, view.frame.size.width, view.frame.size.height)];
        }
        tempView = view;
    }
    
//    [tempView setFrame:CGRectMake(tempView.frame.origin.x, tempView.frame.origin.y, tempView.frame.size.width, tempView.frame.size.height)];
    
//    [conversationView.scrollView setContentSize:CGSizeMake(conversationView.scrollView.frame.size.width, [[UIScreen mainScreen]bounds].size.height - 84)];
////    //    [conversationView.scrollView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
    CGPoint bottomOffset = CGPointMake(0, conversationView.scrollView.contentSize.height - conversationView.scrollView.bounds.size.height);
    [conversationView.scrollView setContentOffset:bottomOffset animated:YES];
}

#pragma mark - ConversationViewDelegate methods
-(void)addDateReceived {
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 12, [[UIScreen mainScreen]bounds].size.width, 10)];
    [dateLabel setText:[NSString stringWithFormat:@"%@ %@", @"DECEMBER 15, 2015", @"10:00AM"]];
    [dateLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
    [dateLabel setTextColor:[BaseView colorWithHexString:@"A7A7A7"]];
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    [conversationView.scrollView addSubview:dateLabel];
    
    conversationView.yOrigin = dateLabel.frame.size.height + dateLabel.frame.origin.y + 12;
    
    currentInset = dateLabel.frame.origin.y + dateLabel.frame.size.height;
    
//    [conversationView.scrollView setContentSize:CGSizeMake(conversationView.scrollView.frame.size.width, currentInset + 10)];
//    //    //    [conversationView.scrollView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
//    CGPoint bottomOffset = CGPointMake(0, conversationView.scrollView.contentSize.height - conversationView.scrollView.bounds.size.height);
//    [conversationView.scrollView setContentOffset:bottomOffset animated:YES];
    
}

-(void)addRightMessagesWithData:(NSDictionary *)data {
    UIView *messageContainer = [[UIView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width - 216, conversationView.yOrigin, 216, 100)];
    
    UIView *message = [[UIView alloc]initWithFrame:CGRectMake(0, 0, messageContainer.frame.size.width - 58, 50)];
    [message setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [message.layer setCornerRadius:3];
    [messageContainer addSubview:message];
    
    UIImageView *avatar = [[UIImageView alloc]initWithFrame:CGRectMake(messageContainer.frame.size.width - 46, 1, 35, 35)];
    [avatar.layer setCornerRadius:avatar.frame.size.height/2];
    [avatar setImage:[UIImage imageNamed:@"ic_default_profile"]];
    [avatar setContentMode:UIViewContentModeScaleAspectFill];
    [avatar setClipsToBounds:YES];
    [messageContainer addSubview:avatar];
    
    UILabel *messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 12, message.frame.size.width - 24, 50)];
    [messageLabel setTextColor:[BaseView colorWithHexString:@"464A4D"]];
    [messageLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [messageLabel setText:text];
    [messageLabel setClipsToBounds:YES];
    [messageLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [messageLabel setNumberOfLines:0];
    [messageLabel sizeToFit];
    [message addSubview: messageLabel];
    
    if(messageLabel.frame.size.width + 24 < message.frame.size.width) {
        [message setFrame:CGRectMake(0, 0, messageLabel.frame.size.width + 24, messageLabel.frame.size.height + 24)];
        [messageContainer setFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width - (message.frame.size.width + 58), messageContainer.frame.origin.y, message.frame.size.width + 58, 100)];
        NSLog(@"frame -- %@", NSStringFromCGRect(message.frame));
        NSLog(@"frame -- %@", NSStringFromCGRect(messageContainer.frame));
        [avatar setFrame:CGRectMake(messageContainer.frame.size.width - 46, 1, 35, 35)];
    }
    
    [messageContainer setFrame:CGRectMake(messageContainer.frame.origin.x, messageContainer.frame.origin.y, messageContainer.frame.size.width, messageLabel.frame.size.height + 24)];
    conversationView.yOrigin = messageContainer.frame.size.height + messageContainer.frame.origin.y + 12;
    
//    if(conversationView.yOrigin > conversationView.scrollView.frame.size.height) {
//        [conversationView.scrollView setContentSize:CGSizeMake(conversationView.scrollView.frame.size.width, conversationView.yOrigin + 10)];
////        [conversationView.scrollView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
//        CGPoint bottomOffset = CGPointMake(0, conversationView.scrollView.contentSize.height - conversationView.scrollView.bounds.size.height);
//        [conversationView.scrollView setContentOffset:bottomOffset animated:YES];
//    }
    
    currentInset = messageContainer.frame.origin.y + messageContainer.frame.size.height;
    [conversationView.scrollView addSubview:messageContainer];
}

-(void)addLeftMessagesWithData:(NSDictionary *)data {
    UIView *messageContainer = [[UIView alloc]initWithFrame:CGRectMake(0, conversationView.yOrigin, 216, 100)];
    
    UIImageView *avatar = [[UIImageView alloc]initWithFrame:CGRectMake(12, 1, 35, 35)];
    [avatar.layer setCornerRadius:avatar.frame.size.height/2];
    //    [avatar setBackgroundColor:[UIColor lightGrayColor]];
    [avatar setImage:[UIImage imageNamed:@"ic_default_profile"]];
    [avatar setContentMode:UIViewContentModeScaleAspectFill];
    [avatar setClipsToBounds:YES];
    [messageContainer addSubview:avatar];
    
    UIView *message = [[UIView alloc]initWithFrame:CGRectMake(avatar.frame.size.width + avatar.frame.origin.x + 10, 0, messageContainer.frame.size.width - 58, 50)];
    [message setBackgroundColor:[BaseView colorWithHexString:@"F6F5F7"]];
    [message.layer setCornerRadius:3];
    [messageContainer addSubview:message];
    
    UILabel *messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 12, message.frame.size.width - 24, 50)];
    [messageLabel setTextColor:[BaseView colorWithHexString:@"464A4D"]];
    [messageLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [messageLabel setText:text];
    //    [messageLabel setTextAlignment:NSTextAlignmentCenter];
    //    [messageLabel setBackgroundColor:[UIColor whiteColor]];
    [messageLabel setClipsToBounds:YES];
    [messageLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [messageLabel setNumberOfLines:0];
    [messageLabel sizeToFit];
    [message addSubview: messageLabel];
    
    if(messageLabel.frame.size.width + 24 < message.frame.size.width) {
        [message setFrame:CGRectMake(message.frame.origin.x, 0, messageLabel.frame.size.width + 24, messageLabel.frame.size.height + 24)];
        [messageContainer setFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width - (message.frame.size.width + 58), messageContainer.frame.origin.y, message.frame.size.width + 58, 100)];
        NSLog(@"frame -- %@", NSStringFromCGRect(message.frame));
        NSLog(@"frame -- %@", NSStringFromCGRect(messageContainer.frame));
    }
    
    [messageContainer setFrame:CGRectMake(0, messageContainer.frame.origin.y, messageContainer.frame.size.width, messageLabel.frame.size.height + 24)];
    conversationView.yOrigin = messageContainer.frame.size.height + messageContainer.frame.origin.y + 12;
    
//    if(conversationView.yOrigin > conversationView.scrollView.frame.size.height) {
//        [conversationView.scrollView setContentSize:CGSizeMake(conversationView.scrollView.frame.size.width, conversationView.yOrigin + 10)];
//        //        [conversationView.scrollView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
//        CGPoint bottomOffset = CGPointMake(0, conversationView.scrollView.contentSize.height - conversationView.scrollView.bounds.size.height);
//        [conversationView.scrollView setContentOffset:bottomOffset animated:YES];
//    }
    
    currentInset = messageContainer.frame.origin.y + messageContainer.frame.size.height;
    [conversationView.scrollView addSubview:messageContainer];
}

#pragma mark - UITextFieldDelegate method
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"tapped");
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(fieldNotification:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    superview = textField.superview;
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField  {
    [textField resignFirstResponder];
    
    if([textField.text length] != 0) {
        text = textField.text;
//        textField.text = @"";
    }
    NSDictionary *dictionary = [[NSDictionary alloc]init];
    [self addRightMessagesWithData:dictionary];
    [self addLeftMessagesWithData:dictionary];
    [conversationView.scrollView setFrame:CGRectMake(0, 0, conversationView.frame.size.width, [[UIScreen mainScreen]bounds].size.height - 84)];
    [superview setFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height - 84, superview.frame.size.width, superview.frame.size.height)];
    
    if(conversationView.yOrigin > conversationView.scrollView.frame.size.height) {
        [conversationView.scrollView setContentSize:CGSizeMake(conversationView.scrollView.frame.size.width, conversationView.yOrigin + 10)];
        CGPoint bottomOffset = CGPointMake(0, conversationView.scrollView.contentSize.height - conversationView.scrollView.bounds.size.height);
        [conversationView.scrollView setContentOffset:bottomOffset animated:YES];
    }
    textField.text = nil;
    return YES;
}

@end
