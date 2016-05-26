//
//  SendMessageView.m
//  fitface
//
//  Created by LLDM 0037 on 4/22/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "SendMessageView.h"

@implementation SendMessageView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self addSubview:mainView];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:mainView.frame];
    [background setImage:[UIImage imageNamed:@"bg_photos"]];
    [mainView addSubview:background];
    
    UIView *popupContainer = [[UIView alloc]initWithFrame:CGRectMake(18, 84, mainView.frame.size.width - 32, 368)];
    [popupContainer setBackgroundColor:[UIColor whiteColor]];
    [popupContainer.layer setCornerRadius:1];
    [mainView addSubview:popupContainer];
    
    UILabel *messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, popupContainer.frame.size.width, 52)];
    [messageLabel setBackgroundColor:[BaseView colorWithHexString:@"F4F2F0"]];
    [messageLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"Meet Now"]];
    [messageLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:15]];
    [messageLabel setTextColor:[BaseView colorWithHexString:@"083E94"]];
    [messageLabel setTextAlignment:NSTextAlignmentCenter];
    [popupContainer addSubview:messageLabel];
    
    UILabel *meetLabel = [[UILabel alloc]initWithFrame:CGRectMake(18, messageLabel.frame.size.height + 12, 110, 12)];
    [meetLabel setText:@"Can you meet me in "];
    [meetLabel setTextColor:[BaseView colorWithHexString:@"797979"]];
    [meetLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [meetLabel sizeToFit];
    [popupContainer addSubview:meetLabel];
    
    UITextField *timeField = [[UITextField alloc]initWithFrame:CGRectMake(meetLabel.frame.size.width + meetLabel.frame.origin.x + 1, meetLabel.frame.origin.y, 30, 12)];
    [timeField setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [timeField setTextColor:[BaseView colorWithHexString:@"797979"]];
    [timeField setDelegate:self.sendMessageDelegate];
    [popupContainer addSubview:timeField];
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(timeField.frame.origin.x, timeField.frame.origin.y + timeField.frame.size.height, timeField.frame.size.width, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"EEEEEE"]];
    [popupContainer addSubview:border];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(timeField.frame.size.width + timeField.frame.origin.x + 4, meetLabel.frame.origin.y, 95, meetLabel.frame.size.height)];
    [timeLabel setText:@"minutes/hours at"];
    [timeLabel setTextColor:[BaseView colorWithHexString:@"797979"]];
    [timeLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [timeLabel sizeToFit];
    [popupContainer addSubview:timeLabel];
    
    UITextField *placeField = [[UITextField alloc]initWithFrame:CGRectMake(18, meetLabel.frame.size.height + meetLabel.frame.origin.y + 6, 62, 12)];
    [placeField setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [placeField setTextColor:[BaseView colorWithHexString:@"797979"]];
    [placeField setDelegate:self.sendMessageDelegate];
    [popupContainer addSubview:placeField];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(placeField.frame.origin.x, placeField.frame.origin.y + placeField.frame.size.height, placeField.frame.size.width, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"EEEEEE"]];
    [popupContainer addSubview:border];
    
    UILabel *forText = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + border.frame.origin.x + 4, placeField.frame.origin.y, 26, 12)];
    [forText setText:@"for a "];
    [forText setTextColor:[BaseView colorWithHexString:@"797979"]];
    [forText setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [forText sizeToFit];
    [popupContainer addSubview:forText];
    
    UITextField *purposeField = [[UITextField alloc]initWithFrame:CGRectMake(forText.frame.size.width + forText.frame.origin.x + 4, forText.frame.origin.y, 62, 12)];
    [purposeField setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [purposeField setTextColor:[BaseView colorWithHexString:@"797979"]];
    [purposeField setDelegate:self.sendMessageDelegate];
    [popupContainer addSubview:purposeField];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(purposeField.frame.origin.x, purposeField.frame.origin.y + purposeField.frame.size.height, purposeField.frame.size.width, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"EEEEEE"]];
    [popupContainer addSubview:border];
    
    UILabel *purposeText = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.size.width + border.frame.origin.x + 4, placeField.frame.origin.y, 26, 12)];
    [purposeText setText:@"training/workout? "];
    [purposeText setTextColor:[BaseView colorWithHexString:@"797979"]];
    [purposeText setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [purposeText sizeToFit];
    [popupContainer addSubview:purposeText];
    
    UILabel *contactLabel = [[UILabel alloc]initWithFrame:CGRectMake(18, purposeText.frame.size.height + purposeText.frame.origin.y + 30, popupContainer.frame.size.width - 36, 50)];
//    [contactLabel setText:[NSString stringWithFormat:@"My number is %@ if you would like to contact me. Thanks!", @"+1 234 5678"]];
    [contactLabel setTextColor:[BaseView colorWithHexString:@"797979"]];
    [contactLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [contactLabel setNumberOfLines:0];
    NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:6.0];
    NSString *label = [NSString stringWithFormat:@"My number is %@ if you would like to contact me. Thanks!", @"+1 234 5678"];
    NSDictionary *attributtes = @{NSParagraphStyleAttributeName : style,};
    [contactLabel setAttributedText:[[NSAttributedString alloc]initWithString:label attributes:attributtes]];
    [contactLabel sizeToFit];
    [popupContainer addSubview:contactLabel];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(18, contactLabel.frame.size.height + contactLabel.frame.origin.y + 12,  contactLabel.frame.size.width, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"EEEEEE"]];
    [popupContainer addSubview:border];
    
    UIButton *sendButton = [[UIButton alloc]initWithFrame:CGRectMake(0, popupContainer.frame.size.height - 46, popupContainer.frame.size.width, 46)];
    [sendButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [sendButton setTitle:@"SEND MESSAGE" forState:UIControlStateNormal];
    [sendButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
//    [sendButton addTarget:self.requestDelegate action:@selector(onSendButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [popupContainer addSubview:sendButton];
    
}

@end
