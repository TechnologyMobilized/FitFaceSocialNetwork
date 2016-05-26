//
//  ProfileViewController.h
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "BaseViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "HomeViewController.h"
#import "ProfileView.h"
#import "AchievementsViewController.h"
#import "PhotosViewController.h"
#import "BasicInfoViewController.h"
#import "FitnessPartnersView.h"
#import "ConversationViewController.h"
#import "MessagesViewController.h"
#import "ViewPhotoViewController.h"
#import "FitnessInformationViewController.h"
#import "AddAchievementViewController.h"

@interface ProfileViewController : BaseViewController<ProfileViewDelegate>{
    ProfileView *profileView;
    JASidePanelController *jaSidePanelController;
}

@property (nonatomic) BOOL isMyProfile;
@property (nonatomic) BOOL fromFitnessScreen;

@end
