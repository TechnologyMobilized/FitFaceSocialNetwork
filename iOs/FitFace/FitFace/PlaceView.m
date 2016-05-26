//
//  PlaceView.m
//  fitface
//
//  Created by LLDM 0037 on 5/4/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "PlaceView.h"

@implementation PlaceView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, 102)];
    [background setImage:[UIImage imageNamed:@"header"]];
    [background setClipsToBounds:YES];
    [mainView addSubview:background];
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(12, 26, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self.placeDelegate action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:backButton];
    
    UILabel *screenLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 46, mainView.frame.size.width, 54)];
    [screenLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"Submit a Place"]];
    [screenLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:18]];
    [screenLabel setTextAlignment:NSTextAlignmentCenter];
    [screenLabel setTextColor:[UIColor whiteColor]];
    [mainView addSubview:screenLabel];
    
    UILabel *successLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, background.frame.size.height + background.frame.origin.y + 20, mainView.frame.size.width - 24, 10)];
    [successLabel setText:@"NAME OF PLACE"];
    [successLabel setTextColor:[BaseView colorWithHexString:THEME_COLOR]];
    [successLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [mainView addSubview:successLabel];
    
    UITextField *placeField = [[UITextField alloc]initWithFrame:CGRectMake(16, successLabel.frame.size.height + successLabel.frame.origin.y + 12, mainView.frame.size.width - 48, 32)];
    [placeField setPlaceholder:@"Write here..."];
    [placeField setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [placeField setDelegate:self.placeDelegate];
    [placeField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [placeField setReturnKeyType:UIReturnKeyDone];
    [mainView addSubview:placeField];
    
    UIImageView *locationIcon = [[UIImageView alloc]initWithFrame:CGRectMake(placeField.frame.origin.x + placeField.frame.size.width, placeField.frame.origin.y + 10, 16, 16)];
    [locationIcon setImage:[UIImage imageNamed:@"location_icon"]];
//    [locationIcon setBackgroundColor:[UIColor blackColor]];
    [mainView addSubview:locationIcon];
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(12, placeField.frame.size.height + placeField.frame.origin.y, mainView.frame.size.width - 24, 1)];
    [border setBackgroundColor:[BaseView colorWithHexString:SEPARATOR_COLOR]];
    [mainView addSubview:border];
    
    UILabel *uploadText = [[UILabel alloc]initWithFrame:CGRectMake(12, border.frame.size.height + border.frame.origin.y + 20, mainView.frame.size.width - 24, 10)];
    [uploadText setText:@"UPLOAD PHOTOS"];
    [uploadText setTextColor:[BaseView colorWithHexString:THEME_COLOR]];
    [uploadText setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [mainView addSubview:uploadText];
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, uploadText.frame.size.height + uploadText.frame.origin.y, mainView.frame.size.width, 120)];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [mainView addSubview:scrollView];
    
    int xPos = 12;
    for(int i = 0; i < 5; i++) {
        UIImageView *imageContainer = [[UIImageView alloc]initWithFrame:CGRectMake(xPos, 10, 98, 96)];
        [imageContainer.layer setBorderColor:[BaseView colorWithHexString:SEPARATOR_COLOR].CGColor];
        [imageContainer.layer setBorderWidth:1.0];
        [imageContainer.layer setCornerRadius:2.0];
        [imageContainer setContentMode:UIViewContentModeScaleAspectFill];
        [imageContainer setTag:10 + i];
        [imageContainer setClipsToBounds:YES];
        [scrollView addSubview:imageContainer];
        
        UIImageView *addIcon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 14, 14)];
        [addIcon setImage:[UIImage imageNamed:@"ic_add"]];
        [addIcon setCenter:CGPointMake(imageContainer.frame.size.width/2, imageContainer.frame.size.height/2)];
        [imageContainer addSubview:addIcon];
        
        UIButton *selectButton = [[UIButton alloc]initWithFrame:imageContainer.frame];
        [selectButton addTarget:self.placeDelegate action:@selector(onImageContainerTap:) forControlEvents:UIControlEventTouchUpInside];
        [selectButton setTag:i];
        [scrollView addSubview:selectButton];
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self.placeDelegate action:@selector(onImageContainerPress:)];
        [selectButton addGestureRecognizer:longPress];
        
        xPos += imageContainer.frame.size.width + 12;
    }
    
    [scrollView setContentSize:CGSizeMake(xPos, scrollView.frame.size.height)];
    
    UIButton *submitButton = [[UIButton alloc]initWithFrame:CGRectMake(12, mainView.frame.size.height - 68, mainView.frame.size.width - 24, 48)];
    [submitButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [submitButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [submitButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [submitButton setTag:200];
    [submitButton addTarget:self.placeDelegate action:@selector(onSubmitButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:submitButton];
    
    UITapGestureRecognizer *mainViewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self.placeDelegate action:@selector(onMainViewtap:)];
    [mainView addGestureRecognizer:mainViewTapped];
}

@end
