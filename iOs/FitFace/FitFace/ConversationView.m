//
//  ConversationView.m
//  fitface
//
//  Created by LLDM 0037 on 3/31/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "ConversationView.h"

@implementation ConversationView


-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, [[UIScreen mainScreen] bounds].size.height - 84)];
//    [self.scrollView setBackgroundColor:[UIColor lightGrayColor]];
    [mainView addSubview:self.scrollView];
    NSLog(@"nav -- %@", NSStringFromCGRect(self.scrollView.frame));
    
    UIView *textfieldContainer = [[UIView alloc]initWithFrame:CGRectMake(0, mainView.frame.size.height - 84, mainView.frame.size.width, 40)];
    [textfieldContainer setBackgroundColor:[BaseView colorWithHexString:@"F7F8F7"]];
    [mainView addSubview:textfieldContainer];
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, 2)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"D7D7D7"]];
    [textfieldContainer addSubview:border];
    
    UITextField *messageField = [[UITextField alloc]initWithFrame:CGRectMake(10, border.frame.size.height + border.frame.origin.y, mainView.frame.size.width - 48, textfieldContainer.frame.size.height - 2)];
    [messageField setDelegate:self.conversationDelegate];
    [messageField setPlaceholder:@"Type here"];
    [messageField setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [messageField setTextColor:[BaseView colorWithHexString:@"535353"]];
    [messageField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textfieldContainer addSubview:messageField];
    
    UIImageView *micIcon = [[UIImageView alloc]initWithFrame:CGRectMake(textfieldContainer.frame.size.width - 26, 12, 13, 19)];
    [micIcon setImage:[UIImage imageNamed:@"mic"]];
    [textfieldContainer addSubview:micIcon];
    
    self.yOrigin = 12;
    [self.conversationDelegate addDateReceived];
    
}
@end
