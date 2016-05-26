//
//  CommunityView.m
//  fitface
//
//  Created by LLDM 0037 on 3/24/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "CommunityView.h"

@implementation CommunityView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    UILabel *whereLabel = [[UILabel alloc]initWithFrame:CGRectMake(18, 16, mainView.frame.size.width - 36, 10)];
    [whereLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"WHERE"]];
    [whereLabel setTextColor:[BaseView colorWithHexString:@"04298D"]];
    [whereLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [mainView addSubview:whereLabel];
    
    self.locationField = [[UITextField alloc]initWithFrame:CGRectMake(21, whereLabel.frame.size.height + whereLabel.frame.origin.y + 10, mainView.frame.size.width - 42, 34)];
    [self.locationField setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [self.locationField setDelegate:self.communityDelegate];
    [self.locationField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [self.locationField setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"Add a location"
                                                                            attributes:@{
                                                                                         NSForegroundColorAttributeName:[BaseView colorWithHexString:@"ABAAAB"],
                                                                                                              NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                         }]];
    [mainView addSubview:self.locationField];
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(18, self.locationField.frame.size.height + self.locationField.frame.origin.y, mainView.frame.size.width - 36, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"EDEDEE"]];
    [mainView addSubview:border];
    
    UILabel *whenLabel = [[UILabel alloc]initWithFrame:CGRectMake(18, border.frame.size.height + border.frame.origin.y + 21, mainView.frame.size.width, 10)];
    [whenLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"WHEN"]];
    [whenLabel setTextColor:[BaseView colorWithHexString:@"04298D"]];
    [whenLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [mainView addSubview:whenLabel];
    
    self.dateField = [[UITextField alloc]initWithFrame:CGRectMake(21, whenLabel.frame.size.height + whenLabel.frame.origin.y + 10, mainView.frame.size.width - 42, 34)];
    [self.dateField setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [self.dateField setDelegate:self.communityDelegate];
    [self.dateField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [self.dateField setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"Add time and day"
                                                                           attributes:@{
                                                                                        NSForegroundColorAttributeName:[BaseView colorWithHexString:@"ABAAAB"],
                                                                                        NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10]
                                                                                        }]];
    [mainView addSubview:self.dateField];
    
    border = [[UIView alloc]initWithFrame:CGRectMake(18, self.dateField.frame.size.height + self.dateField.frame.origin.y, mainView.frame.size.width - 36, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:@"EDEDEE"]];
    [mainView addSubview:border];
    
    UIButton *addButton = [[UIButton alloc]initWithFrame:CGRectMake(18, mainView.frame.size.height - 110, mainView.frame.size.width - 36, 46)];
    [addButton setTitle:@"ADD" forState:UIControlStateNormal];
    [addButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [addButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [mainView addSubview:addButton];
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]initWithTarget:self.communityDelegate action:@selector(onScreenTap:)];
    [self addGestureRecognizer:tapped];
}

@end
