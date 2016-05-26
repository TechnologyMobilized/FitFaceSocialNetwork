
//
//  ProfileView.m
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "ProfileView.h"

@implementation ProfileView
@synthesize profileViewDelegate,isMyProfile;

- (void)setupLayout{
    
    currentSportPage = 0;
    numSportsPages = 0;
    
    UIView *mainView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    
    NSArray *arrImages = [[NSArray alloc]init];
    NSArray *arrTitles = [[NSArray alloc]init];
    
    if(isMyProfile){
        arrImages =  [NSArray arrayWithObjects:[UIImage imageNamed:@"ic_pencil"],[UIImage imageNamed:@"ic_message_box"],[UIImage imageNamed:@"ic_list"], nil];
        arrTitles = [NSArray arrayWithObjects:@"EDIT",@"MESSAGES",@"MORE", nil];
    }
    else{
        arrImages =  [NSArray arrayWithObjects:[UIImage imageNamed:@"ic_add"],[UIImage imageNamed:@"ic_message"],[UIImage imageNamed:@"ic_list"], nil];
        arrTitles = [NSArray arrayWithObjects:@"ADD",@"MESSAGE",@"MORE", nil];

    }
    
    //main scrollview
   scrMainScroll = [[UIScrollView alloc]initWithFrame:mainView.frame];
    [scrMainScroll setBackgroundColor:[UIColor whiteColor]];
    [scrMainScroll setShowsVerticalScrollIndicator:NO];
    [scrMainScroll setDelegate:self];
    [mainView addSubview:scrMainScroll];
    
    //add the overlay bar
    viewFadingTabBar = [self createTabBar:mainView tabImages:arrImages tabTitles:arrTitles];
    [viewFadingTabBar setAlpha:0];
    [mainView addSubview:viewFadingTabBar];
    
    
    /*
     *
     * populate scrollview
     *
     */
    
    ///HEADER SECTION
    UIView *viewHeaderSection = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, 220)];
    [viewHeaderSection setBackgroundColor:[UIColor blueColor]];
    [scrMainScroll addSubview:viewHeaderSection];
    
    ///user image
    UIImageView *ivUserImage = [[UIImageView alloc]initWithFrame:viewHeaderSection.frame];
    [ivUserImage setImage:[UIImage imageNamed:@"dummy3.jpg"]];
    [ivUserImage setContentMode:UIViewContentModeScaleAspectFill];
    [ivUserImage setClipsToBounds:YES];
    [viewHeaderSection addSubview:ivUserImage];
    
    ///user basic info
    UIView *viewBasicInfoBar = [[UIView alloc ]initWithFrame:CGRectMake(0, viewHeaderSection.frame.size.height - 38, viewHeaderSection.frame.size.width, 38)];
    [viewBasicInfoBar setBackgroundColor:[UIColor lightTextColor]];
    [viewHeaderSection addSubview:viewBasicInfoBar];
    
    //location label
    UILabel *lblLocation = [[UILabel alloc]init];
    [lblLocation setAttributedText:[BaseView setCharacterSpacingWithString:@"Peoria, IL"] ];
    [lblLocation setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [lblLocation sizeToFit];
    [lblLocation setFrame:CGRectMake(12, 13, lblLocation.frame.size.width, lblLocation.frame.size.height)];
    [viewBasicInfoBar addSubview:lblLocation];
    
    //age and gender
    
    UILabel *lblAgeGender = [[UILabel alloc]init];
    [lblAgeGender setAttributedText:[BaseView setCharacterSpacingWithString:@"23 Male"]];
    [lblAgeGender setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [lblAgeGender sizeToFit];
    [lblAgeGender setFrame:CGRectMake(viewBasicInfoBar.frame.size.width - lblAgeGender.frame.size.width-12, 13, lblAgeGender.frame.size.width, lblAgeGender.frame.size.height)];
    [viewBasicInfoBar addSubview:lblAgeGender];
    
    
    ///
    /// USER TABS
    ///
    viewScrollTabs = [self createTabBar:scrMainScroll tabImages:arrImages tabTitles:arrTitles];
    [viewScrollTabs setFrame:CGRectMake(0, viewHeaderSection.frame.origin.y + viewHeaderSection.frame.size.height, viewScrollTabs.frame.size.width, viewScrollTabs.frame.size.height)];
    [scrMainScroll addSubview:viewScrollTabs];
    
    ///
    ///User status bar
    ///
    UIView *viewUserStatusBar = [[UIView alloc]initWithFrame:CGRectMake(0, viewScrollTabs.frame.origin.y + viewScrollTabs.frame.size.height, scrMainScroll.frame.size.width, 64)];
//    [viewUserStatusBar setBackgroundColor:[UIColor greenColor]];
    [scrMainScroll addSubview:viewUserStatusBar];
    
    //fitness partners
    UIView *viewPartnersContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewUserStatusBar.frame.size.width/2, viewUserStatusBar.frame.size.height)];
    [viewUserStatusBar addSubview:viewPartnersContainer];
    
    UILabel *lblPartnersCount = [[UILabel alloc]initWithFrame:CGRectMake(0, 19, viewPartnersContainer.frame.size.width, 16)];
    [lblPartnersCount setText:@"23"];
    [lblPartnersCount setTextColor:[UIColor blackColor]];
    [lblPartnersCount setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [lblPartnersCount setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *lblPartners = [[UILabel alloc]initWithFrame:CGRectMake(0, lblPartnersCount.frame.origin.y + lblPartnersCount.frame.size.height +7, viewPartnersContainer.frame.size.width, 9)];
    [lblPartners setAttributedText:[BaseView setCharacterSpacingWithString:@"Fitness Partners"]];
    [lblPartners setTextColor:[BaseView colorWithHexString:@"989998"]];
    [lblPartners setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [lblPartners setTextAlignment:NSTextAlignmentCenter];
    [viewPartnersContainer addSubview:lblPartnersCount];
    [viewPartnersContainer addSubview:lblPartners];
    
    UIButton *partnersButton = [[UIButton alloc]initWithFrame:viewPartnersContainer.frame];
    [partnersButton addTarget:profileViewDelegate action:@selector(showFitnessPartners:) forControlEvents:UIControlEventTouchUpInside];
    
    [viewUserStatusBar addSubview:partnersButton];
    
    //MemberStatus
    UIView *viewMemberStatusContainer = [[UIView alloc]initWithFrame:CGRectMake(viewPartnersContainer.frame.origin.x + viewPartnersContainer .frame.size.width, 0, viewUserStatusBar.frame.size.width/2, viewUserStatusBar.frame.size.height)];
    [viewUserStatusBar addSubview:viewMemberStatusContainer];
    
    UIImageView *ivSmiley = [[UIImageView alloc]initWithFrame:CGRectMake(0, 16, 16, 16)];
    [ivSmiley setImage:[UIImage imageNamed:@"ic_smiley"]];
    [ivSmiley setCenter:CGPointMake(viewMemberStatusContainer.frame.size.width/2, ivSmiley.center.y)];
    [ivSmiley setContentMode:UIViewContentModeScaleAspectFill];
    
    UILabel *lblMemberStatus = [[UILabel alloc]initWithFrame:CGRectMake(0, ivSmiley.frame.origin.y + ivSmiley.frame.size.height +10, viewMemberStatusContainer.frame.size.width, 9)];
    [lblMemberStatus setAttributedText:[BaseView setCharacterSpacingWithString:@"Member Status"]];
    [lblMemberStatus setTextColor:[BaseView colorWithHexString:@"989998"]];
    [lblMemberStatus setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [lblMemberStatus setTextAlignment:NSTextAlignmentCenter];
    [viewMemberStatusContainer addSubview:ivSmiley];
    [viewMemberStatusContainer addSubview:lblMemberStatus];
    
    UIButton *statusButton = [[UIButton alloc]initWithFrame:viewMemberStatusContainer.frame];
    [statusButton addTarget:profileViewDelegate action:@selector(showMemberStatus:) forControlEvents:UIControlEventTouchUpInside];
    
    [viewUserStatusBar addSubview:statusButton];
    
    if(isMyProfile){
        //photos
        viewPhotosHeader= [[UIView alloc]initWithFrame:CGRectMake(0, viewUserStatusBar.frame.origin.y + viewUserStatusBar.frame.size.height, scrMainScroll.frame.size.width, 38)];
        [viewPhotosHeader setBackgroundColor:[BaseView colorWithHexString:@"E8F3FE"]];
        
        [scrMainScroll addSubview:viewPhotosHeader];
        
        UILabel *lblPhotos = [[UILabel alloc]initWithFrame:CGRectMake(19, 15, viewPhotosHeader.frame.size.width-(19*2) -40, 9)];
        [lblPhotos setText:@"PHOTOS"];
        [lblPhotos setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
        [viewPhotosHeader addSubview:lblPhotos];
        
        UIView *viewNavContainer = [[UIView alloc]initWithFrame:CGRectMake(lblPhotos.frame.origin.x + lblPhotos.frame.size.width, 10, 48, 20)];
        [viewPhotosHeader addSubview:viewNavContainer];
        
        UIButton *addPhotosButton = [[UIButton alloc]initWithFrame:CGRectMake(viewPhotosHeader.frame.size.width - 33, 0, 20, 20)];
        [addPhotosButton setCenter:CGPointMake(addPhotosButton.center.x, viewPhotosHeader.frame.size.height/2)];
        [addPhotosButton addTarget:self.profileViewDelegate action:@selector(addPhotoDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [addPhotosButton setImage:[UIImage imageNamed:@"ic_plus"] forState:UIControlStateNormal];
        [viewPhotosHeader addSubview:addPhotosButton];
        
        scrPhotosContainer = [[UIScrollView alloc]initWithFrame:CGRectMake(0, viewPhotosHeader.frame.origin.y+ viewPhotosHeader.frame.size.height, scrMainScroll.frame.size.width, 100)];
        
        [scrPhotosContainer setBackgroundColor:[UIColor whiteColor]];
        [scrPhotosContainer setShowsVerticalScrollIndicator:NO];
        [scrPhotosContainer setShowsHorizontalScrollIndicator:NO];
        
        [scrMainScroll addSubview:scrPhotosContainer];
    }
    
    /**
     *
     *  MEMBERSHIP
     *
     */
    
    ///HEADER
    
    UIView  *viewMembershipHeader = [[UIView alloc]initWithFrame:CGRectMake(0, viewUserStatusBar.frame.origin.y + viewUserStatusBar.frame.size.height, scrMainScroll.frame.size.width, 38)];
    
    if(isMyProfile){
        [viewMembershipHeader setFrame:CGRectMake(0, scrPhotosContainer.frame.origin.y + scrPhotosContainer.frame.size.height, scrMainScroll.frame.size.width, 38)];
    }
    
    [viewMembershipHeader setBackgroundColor:[BaseView colorWithHexString:@"E8F3FE"]];
    
    [scrMainScroll addSubview:viewMembershipHeader];
    
    //label
    UILabel *lblMembership = [[UILabel alloc]initWithFrame:CGRectMake(19, 15, viewMembershipHeader.frame.size.width-19, 9)];
    [lblMembership setText:@"MEMBERSHIPS"];
    [lblMembership setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
    [viewMembershipHeader addSubview:lblMembership];
    
    UIButton *addMembershipButton = [[UIButton alloc]initWithFrame:CGRectMake(viewMembershipHeader.frame.size.width - 33, 0, 20, 20)];
    [addMembershipButton setCenter:CGPointMake(addMembershipButton.center.x, viewMembershipHeader.frame.size.height/2)];
    [addMembershipButton addTarget:self.profileViewDelegate action:@selector(onMembershipButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [addMembershipButton setImage:[UIImage imageNamed:@"ic_plus"] forState:UIControlStateNormal];
//    [viewMembershipHeader addSubview:addMembershipButton];
    
   viewMembershipsContainer = [[UIView alloc]initWithFrame:CGRectMake(0, viewMembershipHeader.frame.origin.y + viewMembershipHeader.frame.size.height, scrMainScroll.frame.size.width, 20)];
//    [viewMembershipsContainer.layer setBorderWidth:1];
    [scrMainScroll addSubview:viewMembershipsContainer];
    

    
    //SPORTS
    
    viewSportsHeader = [[UIView alloc]initWithFrame:CGRectMake(0, viewMembershipsContainer.frame.origin.y + viewMembershipsContainer.frame.size.height, scrMainScroll.frame.size.width, 38)];
    [viewSportsHeader setBackgroundColor:[BaseView colorWithHexString:@"E8F3FE"]];
    
    [scrMainScroll addSubview:viewSportsHeader];
    
    
    UILabel *lblSports = [[UILabel alloc]initWithFrame:CGRectMake(19, 15, viewSportsHeader.frame.size.width-(19*2) -40, 9)];
    [lblSports setText:@"SPORTS"];
    [lblSports setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
    [viewSportsHeader addSubview:lblSports];
    
    
    //next and back buttons
    UIView *viewNavContainer = [[UIView alloc]initWithFrame:CGRectMake(lblSports.frame.origin.x + lblSports.frame.size.width, 10, 48, 20)];
    [viewSportsHeader addSubview:viewNavContainer];
    
    //add
    UIButton *addSportsButton = [[UIButton alloc]initWithFrame:CGRectMake(viewNavContainer.frame.size.width - 20, 0, 20, 20)];
    [addSportsButton addTarget:self.profileViewDelegate action:@selector(onAddSportsButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [addSportsButton setImage:[UIImage imageNamed:@"ic_plus"] forState:UIControlStateNormal];
//    [viewNavContainer addSubview:addSportsButton];
//    [self toggleSportNavigators];
    
    scrSportsContainer = [[UIScrollView alloc]initWithFrame:CGRectMake(0, viewSportsHeader.frame.origin.y+ viewSportsHeader.frame.size.height, scrMainScroll.frame.size.width, 140)];
    
    [scrSportsContainer setBackgroundColor:[UIColor whiteColor]];
    [scrSportsContainer setShowsVerticalScrollIndicator:NO];
    [scrSportsContainer setShowsHorizontalScrollIndicator:NO];
    [scrSportsContainer setScrollEnabled:YES];
    
    [scrMainScroll addSubview:scrSportsContainer];
    
    
    //outdoor places
    
    //header
    viewOutdoorHeader= [[UIView alloc]initWithFrame:CGRectMake(0, scrSportsContainer.frame.size.height + scrSportsContainer.frame.origin.y, scrMainScroll.frame.size.width, 38)];
    [viewOutdoorHeader setBackgroundColor:[BaseView colorWithHexString:@"E8F3FE"]];
    [scrMainScroll addSubview:viewOutdoorHeader ];
    
    UILabel *lblOutdoor = [[UILabel alloc]initWithFrame:CGRectMake(19, 15, viewSportsHeader.frame.size.width-19, 9)];
    [lblOutdoor setText:@"OUTDOOR PLACES"];
    [lblOutdoor setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
    [viewOutdoorHeader addSubview:lblOutdoor];
    
    UIButton *addOutdoorButton = [[UIButton alloc]initWithFrame:CGRectMake(viewOutdoorHeader.frame.size.width - 33, 0, 20, 20)];
    [addOutdoorButton setCenter:CGPointMake(addOutdoorButton.center.x, viewOutdoorHeader.frame.size.height/2)];
    [addOutdoorButton addTarget:self.profileViewDelegate action:@selector(onAddSportsButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [addOutdoorButton setImage:[UIImage imageNamed:@"ic_plus"] forState:UIControlStateNormal];
//    [viewOutdoorHeader addSubview:addOutdoorButton];
    
    viewOutdoorContainer = [[UIView alloc]initWithFrame:CGRectMake(0, viewOutdoorHeader.frame.size.height + viewOutdoorHeader.frame.origin.y, scrMainScroll.frame.size.width, 20)];
    [scrMainScroll addSubview:viewOutdoorContainer];
    
    
//    [self loadOutdoorPlaces:nil];
    
    
    //outdoor places
    
    //header
    viewAchievementsHeader= [[UIView alloc]initWithFrame:CGRectMake(0, viewOutdoorContainer.frame.size.height + viewOutdoorContainer.frame.origin.y, scrMainScroll.frame.size.width, 38)];
    [viewAchievementsHeader setBackgroundColor:[BaseView colorWithHexString:@"E8F3FE"]];
    [scrMainScroll addSubview:viewAchievementsHeader ];
    
    UIButton *addAchievementsButton = [[UIButton alloc]initWithFrame:CGRectMake(viewAchievementsHeader.frame.size.width - 33, 0, 20, 20)];
    [addAchievementsButton setCenter:CGPointMake(addOutdoorButton.center.x, viewOutdoorHeader.frame.size.height/2)];
    [addAchievementsButton addTarget:self.profileViewDelegate action:@selector(onAchievementsButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [addAchievementsButton setImage:[UIImage imageNamed:@"ic_plus"] forState:UIControlStateNormal];
    
    UILabel *lblAchievements = [[UILabel alloc]initWithFrame:CGRectMake(19, 15, viewAchievementsHeader.frame.size.width-19, 9)];
    [lblAchievements setText:@"ACHIEVEMENTS"];
    [lblAchievements setFont:[UIFont fontWithName:AVENIR_HEAVY size:9]];
    [viewAchievementsHeader addSubview:lblAchievements];
    
    
    viewAchievementsContainer = [[UIView alloc]initWithFrame:CGRectMake(0, viewAchievementsHeader.frame.size.height + viewAchievementsHeader.frame.origin.y, scrMainScroll.frame.size.width, 20)];
    [scrMainScroll addSubview:viewAchievementsContainer];
    
    
    ///show more
    viewShowMore = [[UIView alloc]initWithFrame:CGRectMake(12, viewAchievementsContainer.frame.origin.y + viewAchievementsContainer.frame.size.height, scrMainScroll.frame.size.width-26, 42)];
    [viewShowMore setBackgroundColor:[BaseView colorWithHexString:@"3C94F9"]];
    
    
    UILabel *lblShowMore = [[UILabel alloc]initWithFrame:CGRectMake(18, 0, viewShowMore.frame.size.width-36, 42)];
    [lblShowMore setTextColor:[BaseView colorWithHexString:@"ffffff"]];
    [lblShowMore setAttributedText:[BaseView setCharacterSpacingWithString:@"SHOW MORE"]];
    [lblShowMore setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
    [viewShowMore addSubview:lblShowMore];
    
    UIImageView *ivShowMore = [[UIImageView alloc]initWithFrame:CGRectMake(viewShowMore.frame.size.width - 32, 10, 20, 20)];
    [ivShowMore setImage:[UIImage imageNamed:@"ic_arrow_right_white"]];
    [viewShowMore addSubview:ivShowMore];
    
    
    btnShowMoreOverlay = [[UIButton alloc]initWithFrame:lblShowMore.frame];
    [btnShowMoreOverlay addTarget:profileViewDelegate action:@selector(showMoreAchievements:) forControlEvents:UIControlEventTouchUpInside];
    
    //
    // MAIN SCROLLVIEW SHOULD BE ADJUSTED EACH TIME A NEW SECTION IS ADDED (this case,scrSportsContainer) and should always be executed at the
    // end of this method.
    //
    
    [scrMainScroll setContentSize:CGSizeMake(scrMainScroll.frame.size.width,viewAchievementsContainer.frame.origin.y + viewAchievementsContainer.frame.size.height)];
    
    if(isMyProfile) {
        [viewMembershipHeader addSubview:addMembershipButton];
        [viewNavContainer addSubview:addSportsButton];
        [viewOutdoorHeader addSubview:addOutdoorButton];
        [viewAchievementsHeader addSubview:addAchievementsButton];
        [scrMainScroll addSubview:viewShowMore];
        [scrMainScroll addSubview:btnShowMoreOverlay];
        [scrMainScroll setContentSize:CGSizeMake(scrMainScroll.frame.size.width,viewShowMore.frame.origin.y + viewShowMore.frame.size.height +45)];
        
    }
    NSLog(@"IS MY PROFILE -- %d", isMyProfile);
}


/**
 *
 *  HELPER FUNCTIONS
 *
 */
- (UIView*)createTabBar:(UIView*)container tabImages:(NSArray*)imgs tabTitles:(NSArray*)titles{
    UIView *viewTabsContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, container.frame.size.width, 40)];
    [viewTabsContainer setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
    
    int tabWidth = (viewTabsContainer.frame.size.width - 2) /3; //2 is total width of the separators
    int tabHeight = viewTabsContainer.frame.size.height;
    
    //add tab
    UIView *viewTab1Container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tabWidth, tabHeight)];
    [viewTabsContainer addSubview:viewTab1Container];
    
    //1st separator
    UIView *viewSeparatorOne = [[UIView alloc]initWithFrame:CGRectMake(viewTab1Container.frame.size.width+ viewTab1Container.frame.origin.x, 10, 1, tabHeight-20)];
    [viewSeparatorOne setBackgroundColor:[UIColor lightGrayColor]];
    [viewTabsContainer addSubview:viewSeparatorOne];
    
    //message tab
    UIView *viewTab2Container = [[UIView alloc]initWithFrame:CGRectMake(viewSeparatorOne.frame.origin.x+viewSeparatorOne.frame.size.width, 0, tabWidth, tabHeight)];
    [viewTabsContainer addSubview:viewTab2Container];
    
    //2nd separator
    UIView *viewSeparatorTwo = [[UIView alloc]initWithFrame:CGRectMake(viewTab2Container.frame.size.width+ viewTab2Container.frame.origin.x, 10, 1, tabHeight-20)];
    [viewSeparatorTwo setBackgroundColor:[UIColor lightGrayColor]];
    [viewTabsContainer addSubview:viewSeparatorTwo];
    
    //more tab
    UIView *viewTab3Container = [[UIView alloc]initWithFrame:CGRectMake(viewSeparatorTwo.frame.origin.x+viewSeparatorTwo.frame.size.width, 0, tabWidth, tabHeight)];
    [viewTabsContainer addSubview:viewTab3Container];
    
    
    /*
     * TAB CONTENTS
     */
    
    
    //create tab1 contents
    
    UIImageView *ivTab1Icon = [[UIImageView alloc]initWithImage:[imgs objectAtIndex:0]];
    [ivTab1Icon setFrame:CGRectMake(0, 0, 16, 16)];
    [ivTab1Icon setTag:10];
    [ivTab1Icon setContentMode:UIViewContentModeScaleAspectFit];
    
    UILabel *lblTab1Title = [[UILabel alloc] init];
    [lblTab1Title setAttributedText:[BaseView setCharacterSpacingWithString:[titles objectAtIndex:0]]];
    [lblTab1Title setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
    [lblTab1Title setTextColor:[BaseView colorWithHexString:@"1D4F90"]];
    [lblTab1Title sizeToFit];
    [lblTab1Title setTag:11];
    [lblTab1Title setFrame:CGRectMake(ivTab1Icon.frame.origin.x + ivTab1Icon.frame.size.width + 8, lblTab1Title.frame.origin.y+3, lblTab1Title.frame.size.width, lblTab1Title.frame.size.height)];
    
    UIView *viewTab1ContentsContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, lblTab1Title.frame.origin.x + lblTab1Title.frame.size.width, 16)];
    [viewTab1ContentsContainer addSubview:ivTab1Icon];
    [viewTab1ContentsContainer addSubview:lblTab1Title];
    [viewTab1ContentsContainer setCenter:CGPointMake(viewTab1Container.frame.size.width/2, viewTab1Container.frame.size.height/2)];
    
    [viewTab1Container addSubview:viewTab1ContentsContainer];
    
    //create tab2 contents
    
    UIImageView *ivTab2Icon = [[UIImageView alloc]initWithImage:[imgs objectAtIndex:1]];
    [ivTab2Icon setFrame:CGRectMake(0, 0, 16, 16)];
//    [ivTab2Icon setContentMode:UIViewContentModeScaleAspectFill];
    
    UILabel *lblTab2Title = [[UILabel alloc] init];
    [lblTab2Title setAttributedText:[BaseView setCharacterSpacingWithString:[titles objectAtIndex:1]]];
    [lblTab2Title setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
    [lblTab2Title setTextColor:[BaseView colorWithHexString:@"1D4F90"]];
    [lblTab2Title sizeToFit];
    [lblTab2Title setFrame:CGRectMake(ivTab2Icon.frame.origin.x + ivTab2Icon.frame.size.width + 8, lblTab2Title.frame.origin.y+3, lblTab2Title.frame.size.width, lblTab2Title.frame.size.height)];
    
    UIView *viewTab2ContentsContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, lblTab2Title.frame.origin.x + lblTab2Title.frame.size.width, 16)];
    [viewTab2ContentsContainer addSubview:ivTab2Icon];
    [viewTab2ContentsContainer addSubview:lblTab2Title];
    
    [viewTab2ContentsContainer setCenter:CGPointMake(viewTab2Container.frame.size.width/2, viewTab2Container.frame.size.height/2)];
    
    [viewTab2Container addSubview:viewTab2ContentsContainer];
    
    
    //create tab3 contents
    
    UIImageView *ivTab3Icon = [[UIImageView alloc]initWithImage:[imgs objectAtIndex:2]];
    [ivTab3Icon setFrame:CGRectMake(0, 0, 16, 16)];
    [ivTab3Icon setContentMode:UIViewContentModeScaleAspectFit];
    
    UILabel *lblTab3Title = [[UILabel alloc] init];
    [lblTab3Title setAttributedText:[BaseView setCharacterSpacingWithString:[titles objectAtIndex:2]]];
    [lblTab3Title setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
    [lblTab3Title setTextColor:[BaseView colorWithHexString:@"1D4F90"]];
    [lblTab3Title sizeToFit];
    [lblTab3Title setFrame:CGRectMake(ivTab3Icon.frame.origin.x + ivTab3Icon.frame.size.width + 8, lblTab3Title.frame.origin.y+3, lblTab3Title.frame.size.width, lblTab3Title.frame.size.height)];
    
    UIView *viewTab3ContentsContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, lblTab3Title.frame.origin.x + lblTab3Title.frame.size.width, 16)];
    [viewTab3ContentsContainer addSubview:ivTab3Icon];
    [viewTab3ContentsContainer addSubview:lblTab3Title];
    
    [viewTab3ContentsContainer setCenter:CGPointMake(viewTab3Container.frame.size.width/2, viewTab3Container.frame.size.height/2)];
    
    [viewTab3Container addSubview:viewTab3ContentsContainer];
    
    
    ///create the overlay buttons;
    
    UIButton *btnTab1Overlay = [[UIButton alloc]initWithFrame:viewTab1Container.frame];
    [btnTab1Overlay setTag:0];
    [btnTab1Overlay addTarget:profileViewDelegate action:@selector(tabClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewTabsContainer addSubview:btnTab1Overlay];
    
    UIButton *btnTab2Overlay = [[UIButton alloc]initWithFrame:viewTab2Container.frame];
    [btnTab2Overlay setTag:1];
    [btnTab2Overlay addTarget:profileViewDelegate action:@selector(tabClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewTabsContainer addSubview:btnTab2Overlay];
    
    UIButton *btnTab3Overlay = [[UIButton alloc]initWithFrame:viewTab3Container.frame];
    [btnTab3Overlay setTag:2];
    [btnTab3Overlay addTarget:profileViewDelegate action:@selector(tabClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewTabsContainer addSubview:btnTab3Overlay];
    
    return viewTabsContainer;

}


- (void)loadPhotos:(NSArray*)arrPhotos{
    
    
    
    int x= 0,xOrigin =12,gap =12;
    for(;x<[arrPhotos count];x++){
       xOrigin = [self createViewForPhoto:[arrPhotos objectAtIndex:x] xOrigin:xOrigin index:x];
        xOrigin += gap;
    }
    

    [scrPhotosContainer setContentSize:CGSizeMake(xOrigin ,scrPhotosContainer.frame.size.height)];
    
    
    //refresh all layout;
//    [self refreshViewRelation];
}
- (int)createViewForPhoto:(UIImage*)image xOrigin:(int)xOrigin index:(int)index{
    
    UIImageView *ivPhoto = [[UIImageView alloc]initWithFrame:CGRectMake(xOrigin, 12, 77, 77)];
    [scrPhotosContainer addSubview:ivPhoto];
    [ivPhoto setTag:500 + index];
    [ivPhoto setImage:image];
    
    [ivPhoto setContentMode:UIViewContentModeScaleAspectFill];
    [ivPhoto setClipsToBounds:YES];
    
    UIButton *btnPhotoOverlay = [[UIButton alloc]initWithFrame:ivPhoto.frame];
    [btnPhotoOverlay addTarget:profileViewDelegate action:@selector(photoItemDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnPhotoOverlay setTag:index];
    [scrPhotosContainer addSubview:btnPhotoOverlay];
    
    return ivPhoto.frame.size.width + ivPhoto.frame.origin.x;
}


- (void)loadMemberships:(NSArray *)arrMemberships{
    
    int yOrigin = 13;
    int gap =2;
    
    for(int x= 0;x<[arrMemberships count];x++){
        Membership *m = [arrMemberships objectAtIndex:x];
        if(x>0)yOrigin  = yOrigin+gap;
        
        yOrigin = [self createViewForMembership:m startsAtYOrigin:yOrigin withIndex:x];
    }
    
    yOrigin = yOrigin +13;
    [viewMembershipsContainer setFrame:CGRectMake(viewMembershipsContainer.frame.origin.x, viewMembershipsContainer.frame.origin.y, viewMembershipsContainer.frame.size.width, yOrigin)];
    
    
    //refresh all layout;
    [self refreshViewRelation];
}
- (int)createViewForMembership: (Membership *)m startsAtYOrigin:(int)yOrigin withIndex: (int)index{
    
    UIView *viewRowContainer = [[UIView alloc]initWithFrame:CGRectMake(13, yOrigin, viewMembershipsContainer.frame.size.width - 26, 55)];
    [viewRowContainer setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
    UIView *viewBlueBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 3, viewRowContainer.frame.size.height)];
    [viewBlueBar setBackgroundColor:[BaseView colorWithHexString:@"4094FA"]];
    [viewRowContainer addSubview:viewBlueBar];
    
    
    UILabel *lblMembershipName = [[UILabel alloc]initWithFrame:CGRectMake(viewBlueBar.frame.size.width + 11, 13, viewRowContainer.frame.size.width-100-11, 12)];
    [lblMembershipName setText:[m membershipName]];
    [lblMembershipName setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [viewRowContainer addSubview:lblMembershipName];
//    [lblMembershipName.layer setBorderWidth:1];
    
    UIView *viewLocation = [[UIView alloc]initWithFrame:CGRectMake(viewBlueBar.frame.size.width +11, lblMembershipName.frame.size.height+lblMembershipName.frame.origin.y +7, lblMembershipName.frame.size.width, 10)];
    [viewRowContainer addSubview:viewLocation];
    
    //icon
    UIImageView *ivLocation = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 8, 11)];
    [ivLocation setImage:[UIImage imageNamed:@"ic_map_pin"]];
    
    [viewLocation addSubview:ivLocation];
    
    UILabel *lblLocation = [[UILabel alloc]initWithFrame:CGRectMake(ivLocation.frame.origin.x + ivLocation.frame.size.width +7, 1, viewLocation.frame.size.width - ivLocation.frame.size.width, 10)];
    [lblLocation setText:[m membershipAddress]];
    [lblLocation setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
    [lblLocation setTextColor:[BaseView colorWithHexString:@"9B9B9B"]];
    [viewLocation addSubview:lblLocation];
    
    
    //start date
    
    //create attributed string
    NSString *strStartDate = [NSString stringWithFormat:@"SINCE %@",[m membershipStartDate]];
    NSMutableAttributedString *attrStartDate = [[NSMutableAttributedString alloc]initWithString:strStartDate];
    [attrStartDate addAttribute:NSForegroundColorAttributeName value:[BaseView colorWithHexString:@"000000"] range:NSMakeRange(5, strStartDate.length-5)];
    [attrStartDate addAttribute:NSForegroundColorAttributeName value:[BaseView colorWithHexString:@"9B9B9B"] range:NSMakeRange(0, 5)];
    
    
    UILabel *lblStartDate = [[UILabel alloc]initWithFrame:CGRectMake(lblMembershipName.frame.origin.x + lblMembershipName.frame.size.width, 13, viewRowContainer.frame.size.width - lblMembershipName.frame.size.width - 11-13, 9)];
    [lblStartDate setAttributedText:attrStartDate];
    [lblStartDate setFont:[UIFont  fontWithName:AVENIR_BOOK size:7]];
    [lblStartDate setTextAlignment:NSTextAlignmentRight];
    
    [viewRowContainer addSubview:lblStartDate];
//
    
    //workout buds
    
    //create attributed string
    NSString *strWorkoutBuds = [NSString stringWithFormat:@"WORKOUT BUDS %ld",[m membershipWorkoutBuds]];
    NSMutableAttributedString *attrWorkoutBuds = [[NSMutableAttributedString alloc]initWithString:strWorkoutBuds];
    [attrWorkoutBuds addAttribute:NSForegroundColorAttributeName value:[BaseView colorWithHexString:@"000000"] range:NSMakeRange(14, strWorkoutBuds.length-14)];
    [attrWorkoutBuds addAttribute:NSForegroundColorAttributeName value:[BaseView colorWithHexString:@"9B9B9B"] range:NSMakeRange(0, 13)];
    
    UILabel *lblWorkOutBuds = [[UILabel alloc]initWithFrame:CGRectMake(lblLocation.frame.origin.x + lblLocation.frame.size.width, lblStartDate.frame.origin.y + lblStartDate.frame.size.height + 4, viewRowContainer.frame.size.width - lblLocation.frame.size.width-11-13, 9)];
    [lblWorkOutBuds setAttributedText:attrWorkoutBuds];
    [lblWorkOutBuds setFont:[UIFont  fontWithName:AVENIR_BOOK size:7]];
    
    [lblWorkOutBuds setTextAlignment:NSTextAlignmentRight];
    [viewRowContainer addSubview:lblWorkOutBuds];
    
    
    [viewMembershipsContainer addSubview: viewRowContainer];
    
    
    //OVERLAY BUTTON
    UIButton *btnItemOverlay = [[UIButton alloc]initWithFrame:viewRowContainer.frame];
    [btnItemOverlay addTarget:profileViewDelegate action:@selector(membershipItemDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnItemOverlay setTag:index];
    
    
    
    [viewMembershipsContainer addSubview:btnItemOverlay];
    
    NSLog(@"%f-%f",btnItemOverlay.frame.origin.x,btnItemOverlay.frame.origin.y);
    
    return yOrigin + viewRowContainer.frame.size.height;
}


- (void)loadSports:(NSArray*)arrSports{
    
    int xOrigin = 0;
    for (int x = 0 ; x < [arrSports count]; x++) {
        xOrigin =[self createViewForSport:[arrSports objectAtIndex:x] startsAtXOrigin:xOrigin + 11 withIndex:x toView:scrSportsContainer];
    }
    [scrSportsContainer setContentSize:CGSizeMake(xOrigin + 11,scrSportsContainer.frame.size.height)];
    
    //refresh all layout;
    [self refreshViewRelation];
    
}

- (int)createViewForSport: (Sport*)sport startsAtXOrigin:(int)xOrigin withIndex:(int)index toView:(UIView*)view{
    
    UIView *viewSportContainer = [[UIView alloc]initWithFrame:CGRectMake(xOrigin, 12, 90, 115)];
    [viewSportContainer setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
    
    [viewSportContainer setTag:index];
    
    [view addSubview:viewSportContainer];
    
    //add shadow
    viewSportContainer.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    viewSportContainer.layer.shadowOffset = CGSizeMake(1, 1);
    viewSportContainer.layer.shadowOpacity = 1;
    viewSportContainer.layer.shadowRadius = 1.0;
    
    UIView *viewSportImageContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
    [viewSportContainer addSubview:viewSportImageContainer];
    
    //add sport image
    UIImageView *ivSportImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 42, 42)];
    [ivSportImage setCenter:viewSportImageContainer.center];
    [ivSportImage setImage:sport.sportImage];
    
    [viewSportImageContainer addSubview:ivSportImage];
    
    UILabel *lblSportName = [[UILabel alloc]initWithFrame:CGRectMake(0, viewSportImageContainer.frame.origin.y+viewSportImageContainer.frame.size.height, viewSportContainer.frame.size.width, 25)];
    [lblSportName setText:sport.sportName];
    [lblSportName setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [lblSportName setTextAlignment:NSTextAlignmentCenter];
    [lblSportName setBackgroundColor:[BaseView colorWithHexString:@"ffffff"]];
    [viewSportContainer addSubview:lblSportName];
    
    
    UIButton *btnOverlay = [[UIButton alloc]initWithFrame:viewSportContainer.frame];
    [btnOverlay addTarget:profileViewDelegate action:@selector(sportItemDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnOverlay setTag:index];
    [view addSubview:btnOverlay];
    
    
    return xOrigin + viewSportContainer.frame.size.width;
}

// OUTDOOR PLACES
- (void)loadOutdoorPlaces:(NSArray*)arrOutdoorPlaces{
    
   
    int yOrigin = 13;
    int gap =2;
    
    for(int x= 0;x<[arrOutdoorPlaces count];x++){
        OutdoorPlace *place= [arrOutdoorPlaces objectAtIndex:x];
        if(x>0)yOrigin  = yOrigin+gap;
        
        yOrigin = [self createViewForOutdoorPlace:place startsAtYOrigin:yOrigin withIndex:x];
    }
    NSLog(@"OUTDOOR PLACES: %lu",(unsigned long)[arrOutdoorPlaces count]);
    
    yOrigin = yOrigin +13;
    [viewOutdoorContainer setFrame:CGRectMake(viewOutdoorContainer.frame.origin.x, viewOutdoorContainer.frame.origin.y, viewOutdoorContainer.frame.size.width, yOrigin)];
    
    //refresh all layout;
    [self refreshViewRelation];
}

- (int)createViewForOutdoorPlace:(OutdoorPlace*) place startsAtYOrigin:(int)yOrigin withIndex:(int)index{
    UIView *viewRowContainer = [[UIView alloc]initWithFrame:CGRectMake(13, yOrigin, viewOutdoorContainer.frame.size.width - 26, 72)];
    [viewRowContainer setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
    UIView *viewBlueBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 3, viewRowContainer.frame.size.height)];
    [viewBlueBar setBackgroundColor:[BaseView colorWithHexString:@"4094FA"]];
    [viewRowContainer addSubview:viewBlueBar];
    
    
    UILabel *lblPlaceName = [[UILabel alloc]initWithFrame:CGRectMake(viewBlueBar.frame.size.width + 11, 13, viewRowContainer.frame.size.width-100-11, 12)];
    
    [lblPlaceName setText:[place outdoorPlaceName]];
    [lblPlaceName setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
    [viewRowContainer addSubview:lblPlaceName];
    
    // location
    UIView *viewLocation = [[UIView alloc]initWithFrame:CGRectMake(viewBlueBar.frame.size.width +9, lblPlaceName.frame.size.height+lblPlaceName.frame.origin.y +7, lblPlaceName.frame.size.width, 10)];
    [viewRowContainer addSubview:viewLocation];
    
    //icon
    UIImageView *ivLocation = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 8, 11)];
    [ivLocation setImage:[UIImage imageNamed:@"ic_map_pin"]];
    
    [viewLocation addSubview:ivLocation];
    
    UILabel *lblLocation = [[UILabel alloc]initWithFrame:CGRectMake(ivLocation.frame.origin.x + ivLocation.frame.size.width +7, 1, viewLocation.frame.size.width - ivLocation.frame.size.width, 10)];
    [lblLocation setText:[place outdoorPlaceLocation]];
    [lblLocation setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
    [lblLocation setTextColor:[BaseView colorWithHexString:@"9B9B9B"]];
    [viewLocation addSubview:lblLocation];
    
    
    // location
    UIView *viewSchedule = [[UIView alloc]initWithFrame:CGRectMake(viewBlueBar.frame.size.width +8, viewLocation.frame.size.height+viewLocation.frame.origin.y +7, lblPlaceName.frame.size.width, 10)];
    [viewRowContainer addSubview:viewSchedule];
    
    //icon
    UIImageView *ivTime = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 11, 11)];
    [ivTime setImage:[UIImage imageNamed:@"ic_time"]];
    
    [viewSchedule addSubview:ivTime];
    
    UILabel *lblSchedule = [[UILabel alloc]initWithFrame:CGRectMake(ivTime.frame.origin.x + ivTime.frame.size.width +5, 1, viewSchedule.frame.size.width - ivTime.frame.size.width, 10)];
    [lblSchedule setText:[place outdoorPlaceSportSchedule]];
    [lblSchedule setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
    [lblSchedule setTextColor:[BaseView colorWithHexString:@"9B9B9B"]];
    [viewSchedule addSubview:lblSchedule];
    
    
    //start date
    
    //create attributed string
    NSString *strStartDate = [NSString stringWithFormat:@"SINCE %@",[place outdoorPlaceStartDate]];
    NSMutableAttributedString *attrStartDate = [[NSMutableAttributedString alloc]initWithString:strStartDate];
    [attrStartDate addAttribute:NSForegroundColorAttributeName value:[BaseView colorWithHexString:@"000000"] range:NSMakeRange(5, strStartDate.length-5)];
    [attrStartDate addAttribute:NSForegroundColorAttributeName value:[BaseView colorWithHexString:@"9B9B9B"] range:NSMakeRange(0, 5)];
    
    
    UILabel *lblStartDate = [[UILabel alloc]initWithFrame:CGRectMake(lblPlaceName.frame.origin.x + lblPlaceName.frame.size.width, 12, viewRowContainer.frame.size.width - lblPlaceName.frame.size.width - 11-13, 9)];
    [lblStartDate setAttributedText:attrStartDate];
    [lblStartDate setFont:[UIFont  fontWithName:AVENIR_BOOK size:7]];
    [lblStartDate setTextAlignment:NSTextAlignmentRight];
    
    [viewRowContainer addSubview:lblStartDate];
    
    
    //workout buds
    
    //create attributed string
    NSString *strWorkoutBuds = [NSString stringWithFormat:@"WORKOUT BUDS %d",[place outdoorPlaceBudsCount]];
    NSMutableAttributedString *attrWorkoutBuds = [[NSMutableAttributedString alloc]initWithString:strWorkoutBuds];
    [attrWorkoutBuds addAttribute:NSForegroundColorAttributeName value:[BaseView colorWithHexString:@"000000"] range:NSMakeRange(14, strWorkoutBuds.length-14)];
    [attrWorkoutBuds addAttribute:NSForegroundColorAttributeName value:[BaseView colorWithHexString:@"9B9B9B"] range:NSMakeRange(0, 13)];
    
    UILabel *lblWorkOutBuds = [[UILabel alloc]initWithFrame:CGRectMake(lblLocation.frame.origin.x + lblLocation.frame.size.width, lblStartDate.frame.origin.y + lblStartDate.frame.size.height + 5, viewRowContainer.frame.size.width - lblLocation.frame.size.width-11-13, 9)];
    [lblWorkOutBuds setAttributedText:attrWorkoutBuds];
    [lblWorkOutBuds setFont:[UIFont  fontWithName:AVENIR_BOOK size:7]];
    //    [lblWorkOutBuds setTextColor:[BaseView colorWithHexString:@"9B9B9B"]];
    [lblWorkOutBuds setTextAlignment:NSTextAlignmentRight];
    [viewRowContainer addSubview:lblWorkOutBuds];
    
    
    [viewOutdoorContainer addSubview: viewRowContainer];
    
    UIButton *btnItemOverlay = [[UIButton alloc]initWithFrame:viewRowContainer.frame];
    [btnItemOverlay addTarget:profileViewDelegate action:@selector(outdoorPlaceDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnItemOverlay setTag:index];
    
    [viewOutdoorContainer addSubview:btnItemOverlay];
    
    return yOrigin + viewRowContainer.frame.size.height;
}


//achievements
- (void)loadAchievements:(NSArray*)arrAchievements maxRow:(int)maxRow{
    
   
    
    int yOrigin = 0;
    
    for(int x= 0;x<maxRow;x++){
        Achievement *achievement= [arrAchievements objectAtIndex:x];
        
        yOrigin = [self createViewForAchievement:achievement startsAtYOrigin:yOrigin withIndex:x];
    }
    
    yOrigin = yOrigin +13;
    [viewAchievementsContainer setFrame:CGRectMake(0, viewAchievementsHeader.frame.size.height + viewAchievementsHeader.frame.origin.y, scrMainScroll.frame.size.width, yOrigin)];
    
    
    if([arrAchievements count]>maxRow){
        [viewShowMore setAlpha:1];
        [btnShowMoreOverlay setAlpha:1];
    }
    else{
        [viewShowMore setAlpha:0];
        [btnShowMoreOverlay setAlpha:0];
    }
    
    //refresh all layout;
    [self refreshViewRelation];
    
    
}

- (int)createViewForAchievement:(Achievement*)achievement  startsAtYOrigin:(int)yOrigin withIndex:(int)index{
    
    UIView *viewRowContainer = [[UIView alloc]initWithFrame:CGRectMake(12, yOrigin, viewOutdoorContainer.frame.size.width - 26, 60)];
    [viewRowContainer setBackgroundColor:[BaseView colorWithHexString:@"ffffff"]];
//    [viewRowContainer.layer setBorderWidth:0.3];
    
    
    UIView *viewAchievementTitleContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 15, viewRowContainer.frame.size.width, 12)];
    [viewRowContainer addSubview:viewAchievementTitleContainer];
    
    //icon
    
    UIImageView *ivIcon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 12, 12)];
    [ivIcon setImage:[UIImage imageNamed:@"ic_ribbon"]];
    
    [viewAchievementTitleContainer addSubview:ivIcon];
    
    UILabel *lblAchievementTitle = [[UILabel alloc]initWithFrame:CGRectMake(ivIcon.frame.origin.x + ivIcon.frame.size.width  + 8, 0, viewAchievementTitleContainer.frame.size.width - (ivIcon.frame.origin.x + ivIcon.frame.size.width  + 8), 11)];
    [lblAchievementTitle setText:[achievement achievementTitle]];
    [lblAchievementTitle setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
    [lblAchievementTitle setTextColor:[BaseView colorWithHexString:@"000000"]];
    [viewAchievementTitleContainer addSubview:lblAchievementTitle];
    
    
    UILabel *lblEvent = [[UILabel alloc]initWithFrame:CGRectMake(20, viewAchievementTitleContainer.frame.size.height + viewAchievementTitleContainer.frame.origin.y + 5, viewAchievementTitleContainer.frame.size.width - viewAchievementTitleContainer.frame.origin.x, 9 )];
    [lblEvent setFont:[UIFont fontWithName:AVENIR_BOOK size:8]];
    [lblEvent setText:[achievement achievementEvent]];
    [lblEvent setTextColor:[BaseView colorWithHexString:@"A1A1A1"]];
    [viewRowContainer addSubview:lblEvent];
    
    
    UIView *viewSeparator = [[UIView alloc]initWithFrame:CGRectMake(0, viewRowContainer.frame.size.height  -1, viewRowContainer.frame.size.width, 1)];
    [viewSeparator setBackgroundColor:[BaseView colorWithHexString:@"DEDFDE"]];
    [viewRowContainer addSubview:viewSeparator];
    
    [viewAchievementsContainer addSubview:viewRowContainer];
    
    //OVERLAY BUTTON
    UIButton *btnItemOverlay = [[UIButton alloc]initWithFrame:viewRowContainer.frame];
    [btnItemOverlay addTarget:profileViewDelegate action:@selector(achievementDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnItemOverlay setTag:index];
    [viewAchievementsContainer addSubview:btnItemOverlay];
    
    return viewRowContainer.frame.origin.y + viewRowContainer.frame.size.height ;
}

//this will adjsut all sections whenever there are items added on any list.
- (void) refreshViewRelation{
    [viewMembershipsContainer setFrame:CGRectMake(0, viewMembershipsContainer.frame.origin.y ,viewMembershipsContainer.frame.size.width, viewMembershipsContainer.frame.size.height)];
    
    [viewSportsHeader setFrame:CGRectMake(0, viewMembershipsContainer.frame.origin.y + viewMembershipsContainer.frame.size.height, scrMainScroll.frame.size.width, 38)];
    
    [scrSportsContainer setFrame:CGRectMake(0, viewSportsHeader.frame.origin.y+ viewSportsHeader.frame.size.height, scrMainScroll.frame.size.width, 140)];
    
    [viewOutdoorHeader setFrame:CGRectMake(0, scrSportsContainer.frame.size.height + scrSportsContainer.frame.origin.y, scrMainScroll.frame.size.width, 38)];
    [viewOutdoorContainer  setFrame:CGRectMake(0, viewOutdoorHeader.frame.size.height + viewOutdoorHeader.frame.origin.y, scrMainScroll.frame.size.width, viewOutdoorContainer.frame.size.height)];
    
    [viewAchievementsHeader setFrame:CGRectMake(0, viewOutdoorContainer.frame.size.height + viewOutdoorContainer.frame.origin.y, scrMainScroll.frame.size.width, 38)];
    
    [viewAchievementsContainer setFrame:CGRectMake(0, viewAchievementsHeader.frame.size.height + viewAchievementsHeader.frame.origin.y, scrMainScroll.frame.size.width, viewAchievementsContainer.frame.size.height)];
    
    [viewShowMore setFrame:CGRectMake(viewShowMore.frame.origin.x, viewAchievementsContainer.frame.origin.y + viewAchievementsContainer.frame.size.height, viewShowMore.frame.size.width, 42)];
    
    [btnShowMoreOverlay setFrame:viewShowMore.frame];
    
    if(viewShowMore.alpha == 1){
        [scrMainScroll setContentSize:CGSizeMake(scrMainScroll.frame.size.width,viewShowMore.frame.origin.y + viewShowMore.frame.size.height +58)];
    }
    else
        [scrMainScroll setContentSize:CGSizeMake(scrMainScroll.frame.size.width,viewAchievementsContainer.frame.origin.y + viewAchievementsContainer.frame.size.height +45)];
    
    
}

# pragma ScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if([scrollView isEqual:scrMainScroll]){
        
        //hide or show the tab bar
        if([scrMainScroll contentOffset].y >= viewScrollTabs.frame.origin.y){
            [viewFadingTabBar setAlpha:1];
            
        } else if([scrMainScroll contentOffset].y <= viewScrollTabs.frame.origin.y){
            [viewFadingTabBar setAlpha:0];
        }
    }
}
@end
