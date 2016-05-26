//
//  DatabaseView.m
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "DatabaseView.h"

@implementation DatabaseView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setDelegate:self.databaseDelegate];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:scrollView];
    
    // ----------------- PLACES -------------
    
    
    placesContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 12, mainView.frame.size.width, 144)];
    //    [placesContainer setBackgroundColor:[BaseView colorWithHexString:@"F6F6C7"]];
    [scrollView addSubview:placesContainer];
    
    UIView *placesView = [[UIView alloc]initWithFrame:CGRectMake(0, 12, mainView.frame.size.width, 38)];
    [placesView setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [placesContainer addSubview:placesView];
    
    placesArrow = [[UIImageView alloc]initWithFrame:CGRectMake(placesView.frame.size.width - 46, 9, 21, 21)];
    [placesArrow setImage:[UIImage imageNamed:@"arrow-up"]];
    [placesView addSubview:placesArrow];
    
    UILabel *placesLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, placesView.frame.size.width - placesArrow.frame.size.width, placesView.frame.size.height)];
    [placesLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"PLACES"]];
    [placesLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
    [placesView addSubview:placesLabel];
    
    UIButton *placesButton = [[UIButton alloc]initWithFrame:CGRectMake(0, placesView.frame.origin.y, placesView.frame.size.width, placesView.frame.size.height)];
    [placesButton addTarget:self action:@selector(onPlacesButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [placesContainer addSubview:placesButton];
    
    UIView *gyms = [[UIView alloc] initWithFrame:CGRectMake(13, placesView.frame.size.height + placesView.frame.origin.y +  12, scrollView.frame.size.width - 26, 40)];
    [gyms setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [placesContainer addSubview:gyms];
    
    UIView *viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, gyms.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [gyms addSubview:viewBorder];
    
    UIImageView *buttonRight = [[UIImageView alloc]initWithFrame:CGRectMake(gyms.frame.size.width - 33, 12, 21, 21)];
    [buttonRight setImage:[UIImage imageNamed:@"arrow-right"]];
    [gyms addSubview:buttonRight];
    
    //gyms button
    UIButton *nextButton = [[UIButton alloc]initWithFrame:gyms.frame];
    [nextButton addTarget:self.databaseDelegate action:@selector(onGymsButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [placesContainer addSubview:nextButton];
    
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 9, 0, gyms.frame.size.width - (buttonRight.frame.size.width + 13), gyms.frame.size.height)];
    [text setText:@"Gyms"];
//    [text setTextColor:[BaseView colorWithHexString:@"7F8081"]];
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [gyms addSubview:text];
    
    UIView *outdoors = [[UIView alloc] initWithFrame:CGRectMake(13, gyms.frame.size.height + gyms.frame.origin.y + 2, scrollView.frame.size.width - 26, 40)];
    [outdoors setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [placesContainer addSubview:outdoors];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, gyms.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [outdoors addSubview:viewBorder];
    
    buttonRight = [[UIImageView alloc]initWithFrame:CGRectMake(outdoors.frame.size.width - 33, 12, 21, 21)];
    [buttonRight setImage:[UIImage imageNamed:@"arrow-right"]];
    [outdoors addSubview:buttonRight];
    
    //outdoor button
    nextButton = [[UIButton alloc]initWithFrame:outdoors.frame];
    [nextButton addTarget:self.databaseDelegate action:@selector(onOutdoorsButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [placesContainer addSubview:nextButton];
    
    text = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 9, 0, gyms.frame.size.width - (buttonRight.frame.size.width + 13), gyms.frame.size.height)];
    [text setText:@"Outdoors"];
//    [text setTextColor:[BaseView colorWithHexString:@"7F8081"]];
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [outdoors addSubview:text];
    
//    ----------------- WORKOUT -------------
    
    //workout buttons
    
    workoutContainer = [[UIView alloc]initWithFrame:CGRectMake(0, placesContainer.frame.size.height + placesContainer.frame.origin.y + 20, mainView.frame.size.width, 144)];
    //    [workoutContainer setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [scrollView addSubview:workoutContainer];
    [workoutContainer setClipsToBounds:YES];
    
    UIView *workout = [[UIView alloc]initWithFrame:CGRectMake(0, 12, mainView.frame.size.width, 38)];
    [workout setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [workoutContainer addSubview:workout];
    
    workoutArrow = [[UIImageView alloc]initWithFrame:CGRectMake(workout.frame.size.width - 46, 9, 21, 21)];
    [workoutArrow setImage:[UIImage imageNamed:@"arrow-up"]];
    [workout addSubview:workoutArrow];
    
    UILabel *workoutLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, workout.frame.size.width - workoutArrow.frame.size.width, workout.frame.size.height)];
    [workoutLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"WORKOUT"]];
    [workoutLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
    [workout addSubview:workoutLabel];
    
    UIButton *workoutButton = [[UIButton alloc]initWithFrame: workout.frame];
    [workoutButton addTarget:self action:@selector(onWorkoutButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [workoutContainer addSubview:workoutButton];
    
    UIView *types = [[UIView alloc] initWithFrame:CGRectMake(13, workout.frame.size.height + workout.frame.origin.y + 12, scrollView.frame.size.width - 26, 40)];
    [types setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [workoutContainer addSubview:types];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, types.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [types addSubview:viewBorder];
    
    buttonRight = [[UIImageView alloc]initWithFrame:CGRectMake(types.frame.size.width - 33, 12, 21, 21)];
    [buttonRight setImage:[UIImage imageNamed:@"arrow-right"]];
    [types addSubview:buttonRight];

    //types of workout button
    nextButton = [[UIButton alloc]initWithFrame:types.frame];
    [nextButton addTarget:self.databaseDelegate action:@selector(onTypesOfWorkoutButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [workoutContainer addSubview:nextButton];
    
    text = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 9, 0, types.frame.size.width - (buttonRight.frame.size.width + 13), types.frame.size.height)];
    [text setText:@"Types of Workout"];
//    [text setTextColor:[BaseView colorWithHexString:@"7F8081"]];
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [types addSubview:text];
    
    //sports
    
    UIView *sports = [[UIView alloc] initWithFrame:CGRectMake(13, types.frame.size.height + types.frame.origin.y + 2, scrollView.frame.size.width - 26, 40)];
    [sports setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [workoutContainer addSubview:sports];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, sports.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [sports addSubview:viewBorder];
    
    buttonRight = [[UIImageView alloc]initWithFrame:CGRectMake(sports.frame.size.width - 33, 12, 21, 21)];
    [buttonRight setImage:[UIImage imageNamed:@"arrow-right"]];
    [sports addSubview:buttonRight];
    
    //sports button
    nextButton = [[UIButton alloc]initWithFrame:sports.frame];
    [nextButton addTarget:self.databaseDelegate action:@selector(onSportsButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [workoutContainer addSubview:nextButton];
    
    text = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 9, 0, sports.frame.size.width - (buttonRight.frame.size.width + 13), sports.frame.size.height)];
    [text setText:@"Sports"];
//    [text setTextColor:[BaseView colorWithHexString:@"7F8081"]];
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [sports addSubview:text];

//    // ----------------- COMMUNITY -------------
    
    //community buttons
    
    communityContainer = [[UIView alloc]initWithFrame:CGRectMake(0, workoutContainer.frame.size.height + workoutContainer.frame.origin.y + 20, mainView.frame.size.width, 186)];
    //    [workoutContainer setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [communityContainer setClipsToBounds:YES];
    [scrollView addSubview:communityContainer];
    
    UIView *community = [[UIView alloc]initWithFrame:CGRectMake(0, 12, mainView.frame.size.width, 38)];
    [community setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [communityContainer addSubview:community];
    
    communityArrow = [[UIImageView alloc]initWithFrame:CGRectMake(community.frame.size.width - 46, 9, 21, 21)];
    [communityArrow setImage:[UIImage imageNamed:@"arrow-up"]];
    [community addSubview:communityArrow];
    
    UILabel *communityLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, community.frame.size.width - communityArrow.frame.size.width, community.frame.size.height)];
    [communityLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"COMMUNITY"]];
    [communityLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
    [community addSubview:communityLabel];
    
    UIButton *communityButton = [[UIButton alloc]initWithFrame: community.frame];
    [communityButton addTarget:self action:@selector(onCommunityButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [communityContainer addSubview:communityButton];
    
    UIView *events = [[UIView alloc] initWithFrame:CGRectMake(13, community.frame.size.height + community.frame.origin.y + 12, scrollView.frame.size.width - 26, 40)];
    [events setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [communityContainer addSubview:events];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, events.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [events addSubview:viewBorder];
    
    buttonRight = [[UIImageView alloc]initWithFrame:CGRectMake(events.frame.size.width - 33, 12, 21, 21)];
    [buttonRight setImage:[UIImage imageNamed:@"arrow-right"]];
    [events addSubview:buttonRight];
    
    //events button
    nextButton = [[UIButton alloc]initWithFrame:events.frame];
    [nextButton addTarget:self.databaseDelegate action:@selector(onEventsButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [communityContainer addSubview:nextButton];
    
    text = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 9, 0, events.frame.size.width - (buttonRight.frame.size.width + 13), events.frame.size.height)];
    [text setText:@"Events"];
//    [text setTextColor:[BaseView colorWithHexString:@"7F8081"]];
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [events addSubview:text];
    
    //Fitness Partners
    
    UIView *partners = [[UIView alloc] initWithFrame:CGRectMake(13, events.frame.size.height + events.frame.origin.y + 2, scrollView.frame.size.width - 26, 40)];
    [partners setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [communityContainer addSubview:partners];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, partners.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [partners addSubview:viewBorder];
    
    buttonRight = [[UIImageView alloc]initWithFrame:CGRectMake(partners.frame.size.width - 33, 12, 21, 21)];
    [buttonRight setImage:[UIImage imageNamed:@"arrow-right"]];
    [partners addSubview:buttonRight];
    
    //partners button
    nextButton = [[UIButton alloc]initWithFrame:partners.frame];
    [nextButton addTarget:self.databaseDelegate action:@selector(onFitnessPartnersButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [communityContainer addSubview:nextButton];
    
    text = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 9, 0, partners.frame.size.width - (buttonRight.frame.size.width + 13), partners.frame.size.height)];
    [text setText:@"Fitness Partners"];
//    [text setTextColor:[BaseView colorWithHexString:@"7F8081"]];
    
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [partners addSubview:text];
    
    //Check-in
    
    UIView *checkin = [[UIView alloc] initWithFrame:CGRectMake(13, partners.frame.size.height + partners.frame.origin.y + 2, scrollView.frame.size.width - 26, 40)];
    [checkin setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [communityContainer addSubview:checkin];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, checkin.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [checkin addSubview:viewBorder];
    
    buttonRight = [[UIImageView alloc]initWithFrame:CGRectMake(checkin.frame.size.width - 33, 12, 21, 21)];
    [buttonRight setImage:[UIImage imageNamed:@"arrow-right"]];
    [checkin addSubview:buttonRight];
    
    //checkin button
    nextButton = [[UIButton alloc]initWithFrame:checkin.frame];
    [nextButton addTarget:self.databaseDelegate action:@selector(onCheckinButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [communityContainer addSubview:nextButton];
    
    text = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 9, 0, checkin.frame.size.width - (buttonRight.frame.size.width + 13), checkin.frame.size.height)];
    [text setText:@"Check-in"];
//    [text setTextColor:[BaseView colorWithHexString:@"7F8081"]];
    
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [checkin addSubview:text];
    
//    // ----------------- UPGRADE -------------
    
    //community buttons
    
    upgradeContainer = [[UIView alloc]initWithFrame:CGRectMake(0, communityContainer.frame.size.height + communityContainer.frame.origin.y + 20, mainView.frame.size.width, 186)];
    //    [upgradeContainer setBackgroundColor:[BaseView colorWithHexString:@"F6F6C7"]];
    [upgradeContainer setClipsToBounds:YES];
    [scrollView addSubview:upgradeContainer];
    
    UIView *upgrade = [[UIView alloc]initWithFrame:CGRectMake(0, 12, mainView.frame.size.width, 38)];
    [upgrade setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    [upgradeContainer addSubview:upgrade];
    
    upgradeArrow = [[UIImageView alloc]initWithFrame:CGRectMake(upgrade.frame.size.width - 46, 9, 21, 21)];
    [upgradeArrow setImage:[UIImage imageNamed:@"arrow-up"]];
    [upgrade addSubview:upgradeArrow];
    
    UILabel *upgradeLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, upgrade.frame.size.width - upgradeArrow.frame.size.width, upgrade.frame.size.height)];
    [upgradeLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"UPGRADE"]];
    [upgradeLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
    [upgrade addSubview:upgradeLabel];
    
    UIButton *upgradeButton = [[UIButton alloc]initWithFrame: upgrade.frame];
    [upgradeButton addTarget:self action:@selector(onUpgradeButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [upgradeContainer addSubview:upgradeButton];
    
    UIView *routines = [[UIView alloc] initWithFrame:CGRectMake(13, upgrade.frame.size.height + upgrade.frame.origin.y + 12, scrollView.frame.size.width - 26, 40)];
    [routines setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [upgradeContainer addSubview:routines];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, routines.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [routines addSubview:viewBorder];
    
    buttonRight = [[UIImageView alloc]initWithFrame:CGRectMake(routines.frame.size.width - 33, 12, 21, 21)];
    [buttonRight setImage:[UIImage imageNamed:@"arrow-right"]];
    [routines addSubview:buttonRight];
    
    //routines button
    nextButton = [[UIButton alloc]initWithFrame:routines.frame];
    [nextButton addTarget:self.databaseDelegate action:@selector(onRoutinesButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [upgradeContainer addSubview:nextButton];
    
    text = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 9, 0, routines.frame.size.width - (buttonRight.frame.size.width + 13), routines.frame.size.height)];
    [text setText:@"Routines"];
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [routines addSubview:text];
    
    //Diets
    
    UIView *diets = [[UIView alloc] initWithFrame:CGRectMake(13, routines.frame.size.height + routines.frame.origin.y + 2, scrollView.frame.size.width - 26, 40)];
    [diets setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [upgradeContainer addSubview:diets];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, diets.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [diets addSubview:viewBorder];
    
    buttonRight = [[UIImageView alloc]initWithFrame:CGRectMake(diets.frame.size.width - 33, 12, 21, 21)];
    [buttonRight setImage:[UIImage imageNamed:@"arrow-right"]];
    [diets addSubview:buttonRight];
    
    //diets button
    nextButton = [[UIButton alloc]initWithFrame:partners.frame];
    [nextButton addTarget:self.databaseDelegate action:@selector(onDietButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [upgradeContainer addSubview:nextButton];
    
    text = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 9, 0, diets.frame.size.width - (buttonRight.frame.size.width + 13), diets.frame.size.height)];
    [text setText:@"Diets"];
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [diets addSubview:text];
    
    //Workout Playlist
    UIView *playlist = [[UIView alloc] initWithFrame:CGRectMake(13, diets.frame.size.height + diets.frame.origin.y + 2, scrollView.frame.size.width - 26, 40)];
    [playlist setBackgroundColor:[BaseView colorWithHexString:@"F6F6F7"]];
    [upgradeContainer addSubview:playlist];
    
    viewBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, playlist.frame.size.height)];
    [viewBorder setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    [playlist addSubview:viewBorder];
    
    self.connectionImage = [[UIImageView alloc]initWithFrame:CGRectMake(checkin.frame.size.width - 33, 10, 21, 21)];
    [self.connectionImage setImage:[UIImage imageNamed:@"spotify-gray"]];
    [playlist addSubview:self.connectionImage];
    
    self.connectionText = [[UILabel alloc]initWithFrame:CGRectMake(playlist.frame.size.width - 112, 0, 76, playlist.frame.size.height)];
    [self.connectionText setText:@"NOT CONNECTED"];
    [self.connectionText setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
    [self.connectionText setTextColor:[BaseView colorWithHexString:@"878787"]];
    [self.connectionText setTextAlignment:NSTextAlignmentRight];
    [playlist addSubview:self.connectionText];
    
    text = [[UILabel alloc]initWithFrame:CGRectMake(viewBorder.frame.size.width + 9, 0, playlist.frame.size.width - (self.connectionImage.frame.size.width + 13), playlist.frame.size.height)];
    [text setText:@"Workout Playlist"];
//    [text setTextColor:[BaseView colorWithHexString:@"7F8081"]];
    
    [text setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [playlist addSubview:text];
    
    //Workout Playlist button
    nextButton = [[UIButton alloc]initWithFrame:playlist.frame];
//    [nextButton addTarget:self.databaseDelegate action:@selector(onPlaylistButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [upgradeContainer addSubview:nextButton];
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, upgradeContainer.frame.origin.y + upgradeContainer.frame.size.height + 60)];
}

-(IBAction)onPlacesButtonTap:(id)sender {
    NSLog(@"PLACES BUTTON TAPPED");
    UIButton *button = (UIButton *)sender;
    
    if(!button.selected) {
        
        [self collapseView:placesContainer];
        [placesArrow setImage:[UIImage imageNamed:@"arrow-down"]];
        [button setSelected:YES];
        
    } else {
        
        [self revealView:placesContainer withHeight: 144];
        [placesArrow setImage:[UIImage imageNamed:@"arrow-up"]];
        [button setSelected:NO];
    }
    
}

-(IBAction)onWorkoutButtonTap:(id)sender {
    NSLog(@"WORKOUT BUTTON TAPPED");
    UIButton *button = (UIButton *)sender;
    
    if(!button.selected) {
        
        [self collapseView:workoutContainer];
        [workoutArrow setImage:[UIImage imageNamed:@"arrow-down"]];
        [button setSelected:YES];
        
    } else {
        
        [self revealView:workoutContainer withHeight: 144];
        [workoutArrow setImage:[UIImage imageNamed:@"arrow-up"]];
        [button setSelected:NO];
    }
}

-(IBAction)onCommunityButtonTap:(id)sender {
    NSLog(@"COMMUNITY BUTTON TAPPED");
    UIButton *button = (UIButton *)sender;
    
    if(!button.selected) {
        
        [self collapseView:communityContainer];
        [communityArrow setImage:[UIImage imageNamed:@"arrow-down"]];
        [button setSelected:YES];
        
    } else {
        
        [self revealView:communityContainer withHeight: 186];
        [communityArrow setImage:[UIImage imageNamed:@"arrow-up"]];
        [button setSelected:NO];
    }
    
}

-(IBAction)onUpgradeButtonTap:(id)sender {
    NSLog(@"UPGRADE BUTTON TAPPED");
    UIButton *button = (UIButton *)sender;
    
    if(!button.selected) {
        
        [self collapseView:upgradeContainer];
        [upgradeArrow setImage:[UIImage imageNamed:@"arrow-down"]];
        [button setSelected:YES];
        
    } else {
        
        [self revealView:upgradeContainer withHeight: 186];
        [upgradeArrow setImage:[UIImage imageNamed:@"arrow-up"]];
        [button setSelected:NO];
    }
    
}

-(void)collapseView:(UIView *)viewContainer {
    [UIView animateWithDuration:0.25f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [viewContainer setFrame:CGRectMake(viewContainer.frame.origin.x, viewContainer.frame.origin.y, viewContainer.frame.size.width, 50)];
        
        [placesContainer setClipsToBounds:YES];
        CGRect frame = viewContainer.frame;
        
        for(UIView *view in scrollView.subviews) {
            if(view.frame.origin.y > viewContainer.frame.origin.y) {
                [view setFrame:CGRectMake(view.frame.origin.x, frame.origin.y + frame.size.height + 12, view.frame.size.width, view.frame.size.height)];
                frame = view.frame;
            }
        }
        
    } completion:^(BOOL finished) {
        [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, upgradeContainer.frame.origin.y + upgradeContainer.frame.size.height + 60)];
        
    }];
}

-(void)revealView:(UIView *)viewContainer withHeight:(int)height {
    [UIView animateWithDuration:0.25f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [viewContainer setFrame:CGRectMake(viewContainer.frame.origin.x, viewContainer.frame.origin.y, viewContainer.frame.size.width, height)];
        
        [placesContainer setClipsToBounds:YES];
        CGRect frame = viewContainer.frame;
        
        for(UIView *view in scrollView.subviews) {
            if(view.frame.origin.y > viewContainer.frame.origin.y) {
                [view setFrame:CGRectMake(view.frame.origin.x, frame.origin.y + frame.size.height + 12, view.frame.size.width, view.frame.size.height)];
                frame = view.frame;
            }
        }
        
    } completion:^(BOOL finished) {
        [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, upgradeContainer.frame.origin.y + upgradeContainer.frame.size.height + 60)];
        
    }];
}

@end
