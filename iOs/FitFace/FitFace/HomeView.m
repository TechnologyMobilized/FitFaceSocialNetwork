//
//  HomeView.m
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "HomeView.h"

@implementation HomeView


-(void)setupLayout {
    [self setBackgroundColor:[BaseView colorWithHexString:@"ffffff"]];
    UIView *mainView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self addSubview:mainView];
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]initWithTarget:self.homeViewDelegate action:@selector(onTap)];
    [self addGestureRecognizer:tapped];
    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, 361)];
    [backgroundImage setImage:[UIImage imageNamed:@"banner_home"]];
    [mainView addSubview:backgroundImage];
    
    UIView *logoContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 70, mainView.frame.size.width, 182)];
    [mainView addSubview:logoContainer];
    
    UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 94, 94)];
    [logo setCenter:CGPointMake(logoContainer.frame.size.width/2, logo.center.y)];
    [logo setImage:[UIImage imageNamed:@"home_logo"]];
    [logoContainer addSubview:logo];
    
    UIImageView *fitfaceText = [[UIImageView alloc]initWithFrame:CGRectMake(103, logo.frame.size.height + logo.frame.origin.y + 10, 130, 35)];
    [fitfaceText setCenter:CGPointMake(logoContainer.frame.size.width/2, fitfaceText.center.y)];
    [fitfaceText setImage:[UIImage imageNamed:@"home_text"]];
    [logoContainer addSubview:fitfaceText];
    
    UIView *onTheGoLabel = [[UIView alloc]initWithFrame:CGRectMake(16, backgroundImage.frame.size.height - 130, mainView.frame.size.width - 32, 48)];
    [onTheGoLabel setBackgroundColor:[UIColor whiteColor]];
    [mainView addSubview:onTheGoLabel];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(105, 19, 76, 12)];
    [label setText:@"ON-THE-GO"];
    [label setFont:[UIFont fontWithName:AVENIR_HEAVY size:12]];
    [label setTextColor:[BaseView colorWithHexString:THEME_COLOR]];
    [label setTag:2];
    [onTheGoLabel addSubview:label];
    
    UIButton *onTheGoButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, onTheGoLabel.frame.size.width - 62, onTheGoLabel.frame.size.height)];
    [onTheGoButton addTarget:self.homeViewDelegate action:@selector(onOnTheGoTap:) forControlEvents:UIControlEventTouchUpInside];
    [onTheGoLabel addSubview:onTheGoButton];
    
    onTheGoSwitch = [[UIView alloc]initWithFrame:CGRectMake(onTheGoLabel.frame.size.width - 60, 10, 55, 30)];
    [onTheGoSwitch.layer setBorderColor:[BaseView colorWithHexString:@"C4D9FA"].CGColor];
    [onTheGoSwitch.layer setBorderWidth:1];
    [onTheGoSwitch.layer setCornerRadius:2];
    [onTheGoLabel addSubview:onTheGoSwitch];
    
    UIButton *switchButton = [[UIButton alloc]initWithFrame:onTheGoSwitch.frame];
    [switchButton addTarget:self action:@selector(didTapSwitchButton) forControlEvents:UIControlEventTouchUpInside];
    [onTheGoLabel addSubview:switchButton];
    
    UILabel *meetLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, onTheGoLabel.frame.size.height + onTheGoLabel.frame.origin.y, onTheGoLabel.frame.size.width, 24)];
    [meetLabel setText:@"People can now match with you"];
    [meetLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [meetLabel setTextColor:[UIColor whiteColor]];
    [meetLabel setTextAlignment:NSTextAlignmentRight];
    [meetLabel setTag:1];
    [mainView addSubview:meetLabel];
    
    self.isOn = [[[NSUserDefaults standardUserDefaults]objectForKey:@"switch"]integerValue];
    
    if(!self.isOn) {
        NSLog(@"OFF");
        switchImage = [[UIImageView alloc]initWithFrame:CGRectMake(4, 4, 23, 22)];
        [switchImage setImage:[UIImage imageNamed:@"switch_gray"]];
        [onTheGoSwitch addSubview:switchImage];
        [meetLabel setHidden:YES];
        [label setTextColor:[BaseView colorWithHexString:@"959595"]];
        
    } else {
        switchImage = [[UIImageView alloc]initWithFrame:CGRectMake(onTheGoSwitch.frame.size.width - 28, 4, 23, 22)];
        [switchImage setImage:[UIImage imageNamed:@"switch_blue"]];
        [onTheGoSwitch addSubview:switchImage];
        [meetLabel setHidden:NO];
        [label setTextColor:[BaseView colorWithHexString:THEME_COLOR]];
    }
    
    UIButton *tips = [[UIButton alloc]initWithFrame:CGRectMake(mainView.frame.size.width - 112, backgroundImage.frame.size.height - 22, 96, 12)];
    [tips setTitle:@"Tips to Get Started" forState:UIControlStateNormal];
    [tips setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[tips titleLabel]setFont: [UIFont fontWithName:AVENIR_BOOK size:10]];
    [tips addTarget:self.homeViewDelegate action:@selector(onTipsButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview: tips];
    
    UIButton *motivateButton = [[UIButton alloc]initWithFrame:CGRectMake(16, backgroundImage.frame.size.height + 16, mainView.frame.size.width - 32, 46)];
    [motivateButton setTitle:@"MOTIVATE" forState:UIControlStateNormal];
    [[motivateButton titleLabel]setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [motivateButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [motivateButton addTarget:self.homeViewDelegate action:@selector(onMotivateButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:motivateButton];
    
    UIButton *databaseButton = [[UIButton alloc]initWithFrame:CGRectMake(16, motivateButton.frame.origin.y + motivateButton.frame.size.height + 16, mainView.frame.size.width - 32, 46)];
    [databaseButton setTitle:@"DATABASE" forState:UIControlStateNormal];
    [[databaseButton titleLabel]setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [databaseButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [databaseButton addTarget:self.homeViewDelegate action:@selector(onDatabaseQuestionTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:databaseButton];
    
    UIButton *profileButton = [[UIButton alloc]initWithFrame:CGRectMake(16, databaseButton.frame.origin.y + databaseButton.frame.size.height + 16, mainView.frame.size.width - 32, 46)];
    [profileButton setTitle:@"MY PROFILE" forState:UIControlStateNormal];
    [[profileButton titleLabel]setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [profileButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [profileButton addTarget:self.homeViewDelegate action:@selector(onProfileButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:profileButton];
    
    self.popupView = [[UIView alloc]initWithFrame:CGRectMake(13, 55, 180, 136)];
    [self.popupView setBackgroundColor:[UIColor whiteColor]];
    [self.popupView setAlpha:0.9];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(13, 8, self.popupView.frame.size.width - 13, 26)];
    [label setText:@"Trainer App"];
    [label setTextColor:[BaseView colorWithHexString:@"178DF8"]];
    [label setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [self.popupView addSubview:label];
    
    UIButton *popupButton = [[UIButton alloc]initWithFrame:CGRectMake(0, label.frame.origin.y, self.popupView.frame.size.width, 26)];
    [popupButton addTarget:self.homeViewDelegate action:@selector(onTrainerButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.popupView addSubview:popupButton];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(13, popupButton.frame.origin.y + popupButton.frame.size.height + 4, self.popupView.frame.size.width - 13, 26)];
    [label setText:@"Upgrade"];
    [label setTextColor:[BaseView colorWithHexString:@"178DF8"]];
    [label setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [self.popupView addSubview:label];
    
    popupButton = [[UIButton alloc]initWithFrame:CGRectMake(0, label.frame.origin.y, self.popupView.frame.size.width, 26)];
    [popupButton addTarget:self.homeViewDelegate action:@selector(onUpgradeButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.popupView addSubview:popupButton];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(13, popupButton.frame.origin.y + popupButton.frame.size.height + 4, self.popupView.frame.size.width - 13, 26)];
    [label setText:@"Submit a Success Story"];
    [label setTextColor:[BaseView colorWithHexString:@"178DF8"]];
    [label setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [self.popupView addSubview:label];
    
    popupButton = [[UIButton alloc]initWithFrame:CGRectMake(0, label.frame.origin.y, self.popupView.frame.size.width, 26)];
    [popupButton addTarget:self.homeViewDelegate action:@selector(onSuccessButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.popupView addSubview:popupButton];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(13, popupButton.frame.origin.y + popupButton.frame.size.height + 4, self.popupView.frame.size.width - 13, 26)];
    [label setText:@"Submit Place Not Yet Listed"];
    [label setTextColor:[BaseView colorWithHexString:@"178DF8"]];
    [label setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [self.popupView addSubview:label];
    
    popupButton = [[UIButton alloc]initWithFrame:CGRectMake(0, label.frame.origin.y, self.popupView.frame.size.width, 26)];
    [popupButton addTarget:self.homeViewDelegate action:@selector(onPlaceButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.popupView addSubview:popupButton];

    [mainView addSubview:self.popupView];
    
    [self.popupView setHidden:YES];
    
    //On the go search popup
    self.searchPopupBackground = [[UIView alloc]initWithFrame:mainView.frame];
    [self.searchPopupBackground setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.6f]];
    [self.searchPopupBackground setTag:100];
    [self.searchPopupBackground setHidden:YES];
    [mainView addSubview:self.searchPopupBackground];
    
    UITapGestureRecognizer *backgroundTap = [[UITapGestureRecognizer alloc]initWithTarget:self.homeViewDelegate action:@selector(onBackgroundTap:)];
    [backgroundTap setDelegate:self.homeViewDelegate];
    [self.searchPopupBackground addGestureRecognizer:backgroundTap];
    
    UIView *searchPopup = [[UIView alloc]initWithFrame:CGRectMake(16, 104, mainView.frame.size.width - 32, 358)];
    [searchPopup setBackgroundColor:[UIColor whiteColor]];
    [self.searchPopupBackground addSubview:searchPopup];
    
    UILabel *popupLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, searchPopup.frame.size.width, 54)];
    [popupLabel setBackgroundColor:[BaseView colorWithHexString:@"F7F6F5"]];
    [popupLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"On-the-Go"]];
    [popupLabel setTextColor:[BaseView colorWithHexString:@"3C5FA1"]];
    [popupLabel setTextAlignment:NSTextAlignmentCenter];
    [popupLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:15]];
    [searchPopup addSubview:popupLabel];
    
    UILabel *searchLabel = [[UILabel alloc]initWithFrame:CGRectMake(48, popupLabel.frame.size.height + 18, searchPopup.frame.size.width - 96, 32)];
    [searchLabel setText:@"Search for someone who wants to work out with you!"];
    [searchLabel setNumberOfLines:2];
    [searchLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:11]];
    [searchLabel setTextColor:[UIColor blackColor]];
    [searchLabel setTextAlignment:NSTextAlignmentCenter];
    [searchPopup addSubview:searchLabel];
    
    UILabel *info = [[UILabel alloc]initWithFrame:CGRectMake(30, searchLabel.frame.size.height + searchLabel.frame.origin.y, searchPopup.frame.size.width - 60, 66)];
    [info setText:@"We help you match according to the gyms you attend, outdoor places, and any  other preferences that you set it to, in your on-the-go settings"];
    [info setTextColor:[BaseView colorWithHexString:@"585758"]];
    [info setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [info setNumberOfLines:0];
    [info setTextAlignment:NSTextAlignmentCenter];
    [searchPopup addSubview:info];
    
    UITapGestureRecognizer *viewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self.homeViewDelegate action:@selector(onChoicesTap:)];
    
    UIView *sameSexButton = [[UIView alloc]initWithFrame:CGRectMake(20, info.frame.size.height + info.frame.origin.y + 20, 24, 24)];
    [sameSexButton.layer setCornerRadius:2.0];
    [sameSexButton.layer setBorderColor:[BaseView colorWithHexString:THEME_COLOR].CGColor];
    [sameSexButton.layer setBorderWidth:1];
    [sameSexButton addGestureRecognizer:viewTapped];
    [searchPopup addSubview:sameSexButton];
    
    UIView *selection = [[UIView alloc]initWithFrame:CGRectMake(4, 4, sameSexButton.frame.size.width - 8, sameSexButton.frame.size.height - 8)];
    [selection setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [selection.layer setCornerRadius:2.0];
    [selection setHidden:YES];
    [sameSexButton addSubview:selection];
    
    UILabel *sameSexLabel = [[UILabel alloc]initWithFrame:CGRectMake(sameSexButton.frame.size.width + sameSexButton.frame.origin.x + 10, sameSexButton.frame.origin.y, searchLabel.frame.size.width, sameSexButton.frame.size.height)];
    [sameSexLabel setText:@"Match with same sex only"];
    [sameSexLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [sameSexLabel setTextColor:[BaseView colorWithHexString:@"585758"]];
    [searchPopup addSubview:sameSexLabel];
    
    viewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self.homeViewDelegate action:@selector(onChoicesTap:)];
    
    UIView *gymsButton = [[UIView alloc]initWithFrame:CGRectMake(20, sameSexButton.frame.size.height + sameSexButton.frame.origin.y + 14, 24, 24)];
    [gymsButton.layer setCornerRadius:2.0];
    [gymsButton.layer setBorderColor:[BaseView colorWithHexString:THEME_COLOR].CGColor];
    [gymsButton.layer setBorderWidth:1];
    [gymsButton addGestureRecognizer:viewTapped];
    [searchPopup addSubview:gymsButton];
    
    selection = [[UIView alloc]initWithFrame:CGRectMake(4, 4, gymsButton.frame.size.width - 8, gymsButton.frame.size.height - 8)];
    [selection setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [selection.layer setCornerRadius:2.0];
    [selection setHidden:YES];
    [gymsButton addSubview:selection];
    
    UILabel *gymsLabel = [[UILabel alloc]initWithFrame:CGRectMake(gymsButton.frame.size.width + gymsButton.frame.origin.x + 10, gymsButton.frame.origin.y, searchLabel.frame.size.width, gymsButton.frame.size.height)];
    [gymsLabel setText:@"Match by gyms"];
    [gymsLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [gymsLabel setTextColor:[BaseView colorWithHexString:@"585758"]];
    [searchPopup addSubview:gymsLabel];
    
    viewTapped = [[UITapGestureRecognizer alloc]initWithTarget:self.homeViewDelegate action:@selector(onChoicesTap:)];
    
    UIView *preferencesButton = [[UIView alloc]initWithFrame:CGRectMake(20, gymsButton.frame.size.height + gymsButton.frame.origin.y + 14, 24, 24)];
    [preferencesButton.layer setCornerRadius:2.0];
    [preferencesButton.layer setBorderColor:[BaseView colorWithHexString:THEME_COLOR].CGColor];
    [preferencesButton.layer setBorderWidth:1];
    [preferencesButton addGestureRecognizer:viewTapped];
    [searchPopup addSubview:preferencesButton];
    
    selection = [[UIView alloc]initWithFrame:CGRectMake(4, 4, gymsButton.frame.size.width - 8, gymsButton.frame.size.height - 8)];
    [selection setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [selection.layer setCornerRadius:2.0];
    [selection setHidden:YES];
    [preferencesButton addSubview:selection];
    
    UILabel *preferencesLabel = [[UILabel alloc]initWithFrame:CGRectMake(preferencesButton.frame.size.width + preferencesButton.frame.origin.x + 10, preferencesButton.frame.origin.y, searchLabel.frame.size.width, preferencesButton.frame.size.height)];
    [preferencesLabel setText:@"Match according to my set preferences"];
    [preferencesLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [preferencesLabel setTextColor:[BaseView colorWithHexString:@"585758"]];
    [searchPopup addSubview:preferencesLabel];
    
    UIButton *checkMatches = [[UIButton alloc]initWithFrame:CGRectMake(0, searchPopup.frame.size.height - 46, searchPopup.frame.size.width, 46)];
    [checkMatches setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [checkMatches setTitle:@"CHECK MY MATCHES" forState:UIControlStateNormal];
    [checkMatches.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [checkMatches addTarget:self.homeViewDelegate action:@selector(onMatchesButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [searchPopup addSubview:checkMatches];
    
    
    //TIPS
    UIView *tipsContainer = [[UIView alloc]initWithFrame:mainView.frame];
    [tipsContainer setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
    [tipsContainer setTag:10];
    [tipsContainer setAlpha:0];
    [mainView addSubview:tipsContainer];
    
    UIView *firstTip = [[UIView alloc]initWithFrame:CGRectMake(9, databaseButton.frame.origin.y - 132, mainView.frame.size.width - 18, 102)];
    [firstTip setBackgroundColor:[BaseView colorWithHexString:@"E2E6EB"]];
    [firstTip setTag:11];
    [tipsContainer addSubview:firstTip];
    
    UILabel *firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 16, firstTip.frame.size.width, 12)];
    [firstLabel setText:@"FIRST THING FIRST"];
    [firstLabel setTextColor:[BaseView colorWithHexString:@"348FF9"]];
    [firstLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [firstLabel setTextAlignment:NSTextAlignmentCenter];
    [firstTip addSubview:firstLabel];
    
    UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(16, firstLabel.frame.size.height + firstLabel.frame.origin.y + 8, firstTip.frame.size.width - 32, 54)];
    NSString *textContent = @"Go to your database and update the gyms and outdoor places you attend. This will help you match with others by the basics.";
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:2];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:textContent];
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [textContent length])];
    [content setAttributedText:attrString];
    
    [content setTextColor:[BaseView colorWithHexString:@"5B5D5F"]];
    [content setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [content setNumberOfLines:0];
    [content setTextAlignment:NSTextAlignmentCenter];
    [firstTip addSubview:content];
    
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(0, firstTip.frame.size.height + firstTip.frame.origin.y + 4, 15, 22)];
    [arrow setImage:[UIImage imageNamed:@"arrow"]];
    [arrow setCenter:CGPointMake(tipsContainer.frame.size.width/2, arrow.center.y)];
    [arrow setTag:9];
    [tipsContainer addSubview:arrow];
    
    UILabel *databaseView = [[UILabel alloc]initWithFrame:databaseButton.frame];
    [databaseView setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [databaseView setText:@"DATABASE"];
    [databaseView setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [databaseView setTextAlignment:NSTextAlignmentCenter];
    [databaseView setTextColor:[UIColor whiteColor]];
    [databaseView setTag:12];
    [tipsContainer addSubview:databaseView];
    
    UIView *settingsContainer = [[UIView alloc]initWithFrame:CGRectMake(10, 60, tipsContainer.frame.size.width - 20, 62)];
    [settingsContainer setBackgroundColor:[BaseView colorWithHexString:@"E2E6EB"]];
    [settingsContainer setTag:13];
    [settingsContainer setAlpha:0];
    [tipsContainer addSubview:settingsContainer];
    
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 14, settingsContainer.frame.size.width, 12)];
    [text setText:@"YOUR SETTINGS ARE IMPORTANT"];
    [text setTextColor:[BaseView colorWithHexString:@"348FF9"]];
    [text setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [text setTextAlignment:NSTextAlignmentCenter];
    [settingsContainer addSubview:text];
    
    content = [[UILabel alloc]initWithFrame:CGRectMake(12, text.frame.size.height + text.frame.origin.y + 10, settingsContainer.frame.size.width - 24, 14)];
    [content setText:@"Personalize your account to find better matches."];
    [content setTextColor:[BaseView colorWithHexString:@"5B5D5F"]];
    [content setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [content setNumberOfLines:0];
    [content setTextAlignment:NSTextAlignmentCenter];
    [settingsContainer addSubview:content];
    
    UIView *matchContainer = [[UIView alloc]initWithFrame:CGRectMake(10, 100, tipsContainer.frame.size.width - 20, 100)];
    [matchContainer setBackgroundColor:[BaseView colorWithHexString:@"E2E6EB"]];
    [matchContainer setTag:14];
    [matchContainer setAlpha:0];
    [tipsContainer addSubview:matchContainer];
    
    UILabel *labelText = [[UILabel alloc]initWithFrame:CGRectMake(0, 14, matchContainer.frame.size.width, 12)];
    [labelText setText:@"ON-THE-GO"];
    [labelText setTextColor:[BaseView colorWithHexString:@"348FF9"]];
    [labelText setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [labelText setTextAlignment:NSTextAlignmentCenter];
    [matchContainer addSubview:labelText];
    
    content = [[UILabel alloc]initWithFrame:CGRectMake(10, labelText.frame.size.height + labelText.frame.origin.y + 10, matchContainer.frame.size.width - 20, 58)];
    textContent = @"Here, you will match with people around the area according to your workout places and other preferences that you set it to.";
    style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:1];
    attrString = [[NSMutableAttributedString alloc]initWithString:textContent];
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [textContent length])];
    [content setAttributedText:attrString];
    
    [content setTextColor:[BaseView colorWithHexString:@"5B5D5F"]];
    [content setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
    [content setNumberOfLines:0];
    [content setTextAlignment:NSTextAlignmentCenter];
    [matchContainer addSubview:content];
    
    UIView *onthegoContainer = [[UIView alloc]initWithFrame:onTheGoLabel.frame];
    [onthegoContainer setBackgroundColor:[UIColor whiteColor]];
    [onthegoContainer setTag:15];
    [onthegoContainer setAlpha:0];
    [tipsContainer addSubview:onthegoContainer];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(105, 19, 76, 12)];
    [label setText:@"ON-THE-GO"];
    [label setFont:[UIFont fontWithName:AVENIR_HEAVY size:12]];
    [label setTextColor:[BaseView colorWithHexString:THEME_COLOR]];
    [label setTag:2];
    [onthegoContainer addSubview:label];
    
    UIView *matchSwitch = [[UIView alloc]initWithFrame:CGRectMake(onTheGoLabel.frame.size.width - 60, 10, 55, 30)];
    [matchSwitch.layer setBorderColor:[BaseView colorWithHexString:@"C4D9FA"].CGColor];
    [matchSwitch.layer setBorderWidth:1];
    [matchSwitch.layer setCornerRadius:2];
    [onthegoContainer addSubview:matchSwitch];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(onTheGoSwitch.frame.size.width - 28, 4, 23, 22)];
    [image setImage:[UIImage imageNamed:@"switch_blue"]];
    [matchSwitch addSubview:image];
    
    UIView *toggleContainer = [[UIView alloc]initWithFrame:CGRectMake(10, tipsContainer.frame.size.height - 260, tipsContainer.frame.size.width - 20, 122)];
    [toggleContainer setBackgroundColor:[BaseView colorWithHexString:@"E2E6EB"]];
    [toggleContainer setTag:16];
    [toggleContainer setAlpha:0];
    [tipsContainer addSubview:toggleContainer];
    
    labelText = [[UILabel alloc]initWithFrame:CGRectMake(0, 14, toggleContainer.frame.size.width, 12)];
    [labelText setText:@"ON/OFF TOGGLE"];
    [labelText setTextColor:[BaseView colorWithHexString:@"348FF9"]];
    [labelText setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [labelText setTextAlignment:NSTextAlignmentCenter];
    [toggleContainer addSubview:labelText];
    
    content = [[UILabel alloc]initWithFrame:CGRectMake(10, labelText.frame.size.height + labelText.frame.origin.y, toggleContainer.frame.size.width - 20, 82)];
    textContent = @"When this is OFF, no one will be able to match with you, but you can still match with others. When it is ON, anyone can match with you and vice-versa.";
    style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:1];
    attrString = [[NSMutableAttributedString alloc]initWithString:textContent];
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [textContent length])];
    [content setAttributedText:attrString];
    [content setTextColor:[BaseView colorWithHexString:@"5B5D5F"]];
    [content setFont:[UIFont fontWithName:AVENIR_BOOK size:13]];
    [content setNumberOfLines:0];
    [content setTextAlignment:NSTextAlignmentCenter];
    [toggleContainer addSubview:content];
    
    UIView *checkbox = [[UIView alloc]initWithFrame:CGRectMake(12, tipsContainer.frame.size.height - 35, 20, 20)];
    [checkbox.layer setBorderColor:[BaseView colorWithHexString:@"DADADA"].CGColor];
    [checkbox.layer setBorderWidth:1.5];
    [tipsContainer addSubview:checkbox];
    
    UITapGestureRecognizer *tappedView = [[UITapGestureRecognizer alloc]initWithTarget:self.homeViewDelegate action:@selector(onDontShowButtonTap:)];
    [checkbox addGestureRecognizer:tappedView];
    
    UIView *selectionIndicator = [[UIView alloc]initWithFrame:CGRectMake(4, 4, 12, 12)];
    [selectionIndicator setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [selectionIndicator setHidden:YES];
    [checkbox addSubview:selectionIndicator];
    
    UILabel *checkboxLabel = [[UILabel alloc]initWithFrame:CGRectMake(checkbox.frame.size.width + checkbox.frame.origin.x + 6, checkbox.frame.origin.y, 120, 20)];
    [checkboxLabel setText:@"Don't show this again"];
    [checkboxLabel setTextColor:[BaseView colorWithHexString:@"DADADA"]];
    [checkboxLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:11]];
    [tipsContainer addSubview:checkboxLabel];
    
    UIButton *nextButton = [[UIButton alloc]initWithFrame:CGRectMake(tipsContainer.frame.size.width - 48, checkbox.frame.origin.y, 44, checkbox.frame.size.height)];
    [nextButton setTitle:@"NEXT" forState:UIControlStateNormal];
    [nextButton.titleLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:10]];
    [nextButton addTarget:self.homeViewDelegate action:@selector(onNextButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setTag:17]; 
    [tipsContainer addSubview:nextButton];
    
    int xPos = mainView.frame.size.width - 82;
    for(int i = 0; i < 4; i++) {
        UIView *circle = [[UIView alloc]initWithFrame:CGRectMake(xPos, nextButton.frame.origin.y + nextButton.frame.size.height/3, 6, 6)];
        
        if(i == 0) {
            [circle setBackgroundColor:[UIColor whiteColor]];
        } else {
            
        }
        
        [circle.layer setBorderColor:[UIColor whiteColor].CGColor];
        [circle.layer setBorderWidth:1.0];
        [circle.layer setCornerRadius:circle.frame.size.height/2];
        [circle setTag:20 + i];
        [tipsContainer addSubview:circle];
        xPos += 8.5;
    }
    
}

-(void)didTapSwitchButton {
    NSLog(@"DID TAP SWITCH BUTTON");
    [self.homeViewDelegate onSwitchButtonTap:switchImage];
}

@end
