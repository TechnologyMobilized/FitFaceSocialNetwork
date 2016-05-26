//
//  ProfileView.h
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "BaseView.h"
#import "Membership.h"
#import "Sport.h"
#import "OutdoorPlace.h"
#import "Achievement.h"

@protocol ProfileViewDelegate;

@interface ProfileView : BaseView<BaseViewDelegate,UIScrollViewDelegate>{
    UIScrollView *scrMainScroll;
    
    UIView *viewFadingTabBar;
    UIView *viewScrollTabs;
    
    UIView *viewPhotosHeader;
    UIView *viewPhotosContainer;
    UIButton *btnPhotosAdd;
    UIButton *btnPhotosNext;
    UIScrollView *scrPhotosContainer;
    
    
    UIView *viewMembershipsContainer;
    UIScrollView *scrSportsContainer;
    
    UIView *viewSportsHeader;
    
    UIView *viewOutdoorHeader;
    UIView *viewOutdoorContainer;
    
    UIView *viewAchievementsHeader;
    UIView *viewAchievementsContainer;
    UIView *viewShowMore;
    UIButton *btnShowMoreOverlay;
    
    
    int numSportsPages ;
    int currentSportPage;
}

@property (nonatomic, strong)id<ProfileViewDelegate> profileViewDelegate;
@property (nonatomic) BOOL isMyProfile;

- (void)loadPhotos:(NSArray*)arrPhotos;
- (void)loadMemberships: (NSArray*)arrMemberships;
- (void)loadSports:(NSArray*)arrSports;
- (void)loadOutdoorPlaces:(NSArray*)arrOutdoorPlaces;
- (void)loadAchievements:(NSArray*)arrAchievements maxRow:(int)maxRow;

@end

@protocol ProfileViewDelegate <NSObject, UIActionSheetDelegate>
- (IBAction)tabClicked: (id)sender;
- (IBAction)addPhotoDidClick:(id)sender;
- (IBAction)morePhotosDidClick:(id)sender;
- (IBAction)photoItemDidClick:(id)sender;
- (IBAction)membershipItemDidClick:(id)sender;
- (IBAction)sportItemDidClick:(id)sender;
- (IBAction)outdoorPlaceDidClick:(id)sender;
- (IBAction)achievementDidClick:(id)sender;
- (IBAction)showMoreAchievements:(id)sender;
- (IBAction)showFitnessPartners:(id)sender;
- (IBAction)showMemberStatus:(id)sender;
- (IBAction)onMembershipButtonTap:(id)sender;
- (IBAction)onAddSportsButtonTap:(id)sender;
- (IBAction)onOutdoorButtonTap:(id)sender;
- (IBAction)onAchievementsButtonTap:(id)sender;

@end