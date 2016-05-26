//
//  PreferencesView.m
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "PreferencesView.h"

@implementation PreferencesView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    UIView *category = [[UIView alloc]initWithFrame:CGRectMake(0, 12, mainView.frame.size.width, 40)];
    [category setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    
    [mainView addSubview:category];
    
    UILabel *categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, category.frame.size.width - 24, category.frame.size.height)];
    [categoryLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"TURN OFF AFTER"]];
    [categoryLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [categoryLabel setTextColor:[UIColor blackColor]];
    
    [category addSubview:categoryLabel];
    
    UIView *hourView = [[UIView alloc]initWithFrame:CGRectMake(0, category.frame.size.height + category.frame.origin.y, mainView.frame.size.width - 12, 56)];
//    [hourView setBackgroundColor:[UIColor lightGrayColor]];
    
    [mainView addSubview:hourView];
    
    hourScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, hourView.frame.size.height)];
    [hourScroll setShowsHorizontalScrollIndicator:NO];
    [hourView addSubview:hourScroll];
    
    int xOrigin = 12;
    
    for(int i = 1; i <= 12; i++) {
        UIButton *hour = [[UIButton alloc]initWithFrame:CGRectMake(xOrigin, 12, 60, 32)];
        [hour setBackgroundColor:[UIColor whiteColor]];
        
        [hour setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [hour.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
        [hour.layer setBorderWidth:1.0];
        [hour.layer setCornerRadius:2.0];
        [hour.layer setBorderColor:[BaseView colorWithHexString:@"C1C2C2"].CGColor];
        [hour setSelected:NO];
        [hour addTarget:self.preferenceDelegate action:@selector(onHourButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        
        [hourScroll addSubview:hour];
        
        if(i == 1)
            [hour setTitle:[NSString stringWithFormat:@"%d hr", i] forState:UIControlStateNormal];
        
        else {
            [hour setTitle:[NSString stringWithFormat:@"%d hrs", i] forState:UIControlStateNormal];
        }
        
        [hour setTag:i];
        xOrigin += hour.frame.size.width + 12;
    }
    
    [hourScroll setContentSize:CGSizeMake(xOrigin, hourScroll.frame.size.height)];
    
    category = [[UIView alloc]initWithFrame:CGRectMake(0, hourView.frame.size.height + hourView.frame.origin.y + 8, mainView.frame.size.width, 40)];
    [category setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    
    [mainView addSubview:category];
    
    categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, category.frame.size.width - 24, category.frame.size.height)];
    [categoryLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"ALWAYS ON DURING"]];
    [categoryLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [categoryLabel setTextColor:[UIColor blackColor]];
    
    [category addSubview:categoryLabel];
    
    UIView *pickerView = [[UIView alloc]initWithFrame:CGRectMake(0, category.frame.size.height + category.frame.origin.y, mainView.frame.size.width - 24, 182)];
    [mainView addSubview:pickerView];
    
    UIView *pickerContainer = [[UIView alloc]initWithFrame:CGRectMake(0, category.frame.size.height + category.frame.origin.y, mainView.frame.size.width, 136)];
//    [pickerContainer setBackgroundColor:[UIColor lightGrayColor]];
    [mainView addSubview:pickerContainer];
    [pickerContainer setClipsToBounds:YES];
    
    UIView *background;
    
    if(IS_OS_9_OR_LATER) {
        background = [[UIView alloc]initWithFrame:CGRectMake(0, 48, mainView.frame.size.width, 36)];
    } else {
        background = [[UIView alloc]initWithFrame:CGRectMake(0, pickerView.frame.size.height - 82, mainView.frame.size.width, 36)];
        
    }
    
    [background setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [pickerView addSubview:background];
    
    UIDatePicker *leftPicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(10, 10, 150 - 10, 112)];
    [leftPicker setDatePickerMode:UIDatePickerModeTime];
    [pickerContainer addSubview:leftPicker];
    
//    [leftPicker setValue:[UIColor whiteColor] forKeyPath:@"textColor"];
//    SEL selector = NSSelectorFromString( @"setHighlightsToday:" );
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature :
//                                [UIDatePicker instanceMethodSignatureForSelector:selector]];
//    BOOL no = NO;
//    [invocation setSelector:selector];
//    [invocation setArgument:&no atIndex:2];
//    [invocation invokeWithTarget:leftPicker];
    
    UILabel *toLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftPicker.frame.size.width + 15, 43, 20, 44)];
    [toLabel setText:@"TO"];
    [toLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [pickerContainer addSubview:toLabel];
    
    UIDatePicker *rightPicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(mainView.frame.size.width - mainView.frame.size.width/2, 10, mainView.frame.size.width/2 - 10, 112)];
    [rightPicker setDatePickerMode:UIDatePickerModeTime];
    [pickerContainer addSubview:rightPicker];
    
    dayScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 136, mainView.frame.size.width, hourScroll.frame.size.height)];
    [dayScroll setShowsHorizontalScrollIndicator:NO];
    [pickerView addSubview:dayScroll];
    
    xOrigin = 12;
    NSArray *days = [NSArray arrayWithObjects:@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", nil];
    
    for(int i = 0; i < 7; i++) {
        UIButton *day = [[UIButton alloc]initWithFrame:CGRectMake(xOrigin, 12, 90, 32)];
        [day setBackgroundColor:[UIColor whiteColor]];
        
        [day setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [day.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
        [day.layer setBorderWidth:1.0];
        [day.layer setCornerRadius:2.0];
        [day.layer setBorderColor:[BaseView colorWithHexString:@"C1C2C2"].CGColor];
        [day setSelected:NO];
        [day addTarget:self.preferenceDelegate action:@selector(onDayButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        
        [dayScroll addSubview:day];
        [day setTitle:[NSString stringWithFormat:@"%@", [days objectAtIndex:i]] forState:UIControlStateNormal];
        
//        if(i == 1)
//            [hour setTitle:[NSString stringWithFormat:@"%d hr", i] forState:UIControlStateNormal];
//        
//        else {
//            [hour setTitle:[NSString stringWithFormat:@"%d hrs", i] forState:UIControlStateNormal];
//        }
        
        [day setTag:i];
        xOrigin += day.frame.size.width + 12;
    }
    
    [dayScroll setContentSize:CGSizeMake(xOrigin, dayScroll.frame.size.height)];
    
    category = [[UIView alloc]initWithFrame:CGRectMake(0, pickerView.frame.size.height + pickerView.frame.origin.y + 8, mainView.frame.size.width, 40)];
    [category setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [mainView addSubview:category];
    
    categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, category.frame.size.width - 48, category.frame.size.height)];
    [categoryLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"DO NOT MATCH LIST"]];
    [categoryLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [categoryLabel setTextColor:[UIColor blackColor]];
    [category addSubview:categoryLabel];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(categoryLabel.frame.size.width + categoryLabel.frame.origin.x, 12, 21, 21)];
    [image setImage:[UIImage imageNamed:@"arrow-right"]];
    [category addSubview:image];
    
    UIButton *nextButton = [[UIButton alloc]initWithFrame:category.frame];
    [nextButton addTarget:self.preferenceDelegate action:@selector(onMatchListButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:nextButton];
    
    UIButton *saveButton = [[UIButton alloc]initWithFrame:CGRectMake(12, mainView.frame.size.height - 108, mainView.frame.size.width - 24, 48)];
    [saveButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
    [saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
    [saveButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [saveButton addTarget:self.preferenceDelegate action:@selector(onSaveButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:saveButton];
}

@end
