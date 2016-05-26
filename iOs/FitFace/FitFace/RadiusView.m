//
//  RadiusView.m
//  fitface
//
//  Created by LLDM 0037 on 4/22/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "RadiusView.h"

@implementation RadiusView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height - 124)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:scrollView];
    
    yOrigin = 12;
    
    NSMutableDictionary *selectionInfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"selectionInfo"];
    
    if(selectionInfo == nil) {
        selectedIndex = 0;
        selectedLabel = @"None";
        [selectionInfo setValue:[NSNumber numberWithInt:selectedIndex] forKey:@"selectedIndex"];
        [selectionInfo setValue:selectedLabel forKey:@"selectedLabel"];
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:selectionInfo forKey:@"selectionInfo"];
        [userDefault synchronize];
        
    } else {
        selectedIndex = (int)[[selectionInfo objectForKey:@"selectedIndex"]integerValue];
        selectedLabel = [selectionInfo objectForKey:@"selectedLabel"];
    }
    
    NSLog(@"SELECTION INFO -- %@", selectionInfo);
    
    [self createRadius];
    
    UIButton *updateButton = [[UIButton alloc]initWithFrame:CGRectMake(12, mainView.frame.size.height - 108, mainView.frame.size.width - 24, 48)];
    [updateButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
    [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
    [updateButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [updateButton addTarget:self.radiusDelegate action:@selector(onUpdateButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [updateButton setTag:100];
    [mainView addSubview:updateButton];
}

-(void)createRadius {
    for(int i = 0; i <= 10; i++) {
        UIView *radiusEntry = [[UIView alloc]initWithFrame:CGRectMake(12, yOrigin, [[UIScreen mainScreen]bounds].size.width - 24, 42)];
        [radiusEntry setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
        [radiusEntry setTag:i];
        [scrollView addSubview:radiusEntry];
        
        UITapGestureRecognizer *entryTap = [[UITapGestureRecognizer alloc]initWithTarget:self.radiusDelegate action:@selector(onRadiusEntryTap:)];
        [radiusEntry addGestureRecognizer:entryTap];
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, radiusEntry.frame.size.height)];
        [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [radiusEntry addSubview:border];
        
        UILabel *milesLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, 0, radiusEntry.frame.size.width - 60, radiusEntry.frame.size.height)];
        [milesLabel setTextColor:[BaseView colorWithHexString:@"797979"]];
        [milesLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
        [milesLabel setTag:20];
        [radiusEntry addSubview:milesLabel];
        
        if(i == 0) {
            [milesLabel setText:@"None"];
        } else {
            [milesLabel setText:[NSString stringWithFormat:@"%d miles",(5 * i)]];
        }
        
        UIView *selectionContainer = [[UIView alloc]initWithFrame:CGRectMake(radiusEntry.frame.size.width - 30, 12, 18, 18)];
        [selectionContainer.layer setCornerRadius:selectionContainer.frame.size.height/2];
        [selectionContainer setBackgroundColor:[BaseView colorWithHexString:@"FFFEFF"]];
        [selectionContainer setTag:30];
        [radiusEntry addSubview:selectionContainer];
        
        UIImageView *selectionIcon = [[UIImageView alloc]initWithFrame:CGRectMake(.5, .5, 17, 17)];
        [selectionIcon setImage:[UIImage imageNamed:@"check"]];
        [selectionContainer addSubview:selectionIcon];
        [selectionIcon setTag:40];
        
        if(selectedIndex == i) {
            [selectionIcon setHidden:NO];
            self.currentlySelected = radiusEntry;
        } else {
            [selectionIcon setHidden:YES];
        }
        
        yOrigin += radiusEntry.frame.size.height + 2;
    }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin + 10)];
}

@end
