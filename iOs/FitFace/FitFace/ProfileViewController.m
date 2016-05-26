//
//  ProfileViewController.m
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize isMyProfile;

- (void)loadView{
    profileView = [[ProfileView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [profileView setIsMyProfile:isMyProfile];
    
    [profileView setupLayout];
    [self setView:profileView];
    [self loadStaticListValues];
}

-(void)viewWillAppear:(BOOL)animated {
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            [btn setHidden:YES];
        }
    }
    
    self.navigationController.navigationBar.barTintColor = [BaseView colorWithHexString:THEME_COLOR];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    [self addRightPanel];
    [self addBackButton];
    [self addHeaderTitle:@""];
    [self.navigationItem setTitle:@"Andrew Rose"];
}

- (void)addBackButton{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(toggleLeftPanel) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)addRightPanel{
    UINavigationBar *bar = self.navigationController.navigationBar;
    
    UIButton *btnHome = [[UIButton alloc]initWithFrame:CGRectMake(bar.frame.size.width-30, 15, 18, 14)];
    [btnHome setImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    [btnHome addTarget:self action:@selector(toggleRightPanel) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:btnHome];
}

- (void)toggleRightPanel {
    if([self.sidePanelController centerPanelHidden]){
        [self.sidePanelController showCenterPanelAnimated:YES];
    }
    else [self.sidePanelController showRightPanelAnimated:YES];
}

- (void)toggleLeftPanel{
    if(self.fromFitnessScreen) {
        [self.navigationController popViewControllerAnimated:YES];
        
    } else {
        [self.sidePanelController showRightPanelAnimated:YES];
        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController: [[HomeViewController alloc] init] ];
        [self.sidePanelController setCenterPanel:nil];
        [self.sidePanelController setCenterPanel:navController];
        [self.sidePanelController showCenterPanelAnimated:YES];
    }
    
}

- (void)addHeaderTitle:(NSString*)title{
    [self.navigationController.navigationBar.topItem setTitle:title];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:AVENIR_BOOK size:14] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}

- (void)loadStaticListValues{
    NSArray* arrSports = [[NSArray alloc]initWithObjects:
                          [[Sport alloc]initWithSportId:@"" name:@"Basketball" image:[UIImage imageNamed:@"ic_basket"]],
                          [[Sport alloc]initWithSportId:@"" name:@"Soccer" image:[UIImage imageNamed:@"ic_soccer"]],
                          [[Sport alloc]initWithSportId:@"" name:@"Volleyball" image:[UIImage imageNamed:@"ic_volley"]],
                          [[Sport alloc]initWithSportId:@"" name:@"Bicycle" image:[UIImage imageNamed:@"ic_bicycle"]],
                          [[Sport alloc]initWithSportId:@"" name:@"Football" image:[UIImage imageNamed:@"ic_football"]],
                          [[Sport alloc]initWithSportId:@"" name:@"Wrestling" image:[UIImage imageNamed:@"ic_wrestling"]],
                          [[Sport alloc]initWithSportId:@"" name:@"Baseball" image:[UIImage imageNamed:@"ic_baseball"]],
                          nil];
    
    [profileView loadSports:arrSports];
    
    NSArray  *arrMemberships = [[NSArray alloc]initWithObjects:
                                [[Membership   alloc]initWithMembershipId:@"100" name:@"Test Gym" address:@"Houston" startDate:@"01/22/11" budsCount:4],
                                [[Membership   alloc]initWithMembershipId:@"102" name:@"Builder" address:@"Chicago" startDate:@"12/30/98" budsCount:47],
                                [[Membership   alloc]initWithMembershipId:@"143" name:@"Bell's Gym" address:@"Greece" startDate:@"05/15/07" budsCount:16],
                                [[Membership   alloc]initWithMembershipId:@"112" name:@"WorkAround" address:@"France" startDate:@"10/17/05" budsCount:104],
                                nil];
    
    [profileView loadMemberships:arrMemberships];
    
    NSArray  *arrOutdoorPlaces = [[NSArray alloc]initWithObjects:
                        [[OutdoorPlace alloc]initWithPlaceId:@"2212" placeName:@"Central Park" location:@"near Barker River, London" schedule:@"Basketball every Sat 10AM" startDate:@"12/12/14" budsCount:3],
                        [[OutdoorPlace alloc]initWithPlaceId:@"2212" placeName:@"Central Park" location:@"near Barker River, London" schedule:@"Basketball every Sat 10AM" startDate:@"12/12/14" budsCount:3],
                        [[OutdoorPlace alloc]initWithPlaceId:@"2212" placeName:@"Central Park" location:@"near Barker River, London" schedule:@"Basketball every Sat 10AM" startDate:@"12/12/14" budsCount:3],
                        [[OutdoorPlace alloc]initWithPlaceId:@"2212" placeName:@"Central Park" location:@"near Barker River, London" schedule:@"Basketball every Sat 10AM" startDate:@"12/12/14" budsCount:3],
                        nil];
    
    [profileView loadOutdoorPlaces:arrOutdoorPlaces];
    
    NSArray  *arrAchievements = [[NSArray alloc]initWithObjects:
                       
                       [[Achievement alloc]initWithAchievementId:@"112" title:@"Most Valuable Player" event:@"ABC Basketball League 2015"],
                       [[Achievement alloc]initWithAchievementId:@"112" title:@"Most Valuable Player" event:@"ABC Basketball League 2015"],
                       [[Achievement alloc]initWithAchievementId:@"112" title:@"Most Valuable Player" event:@"ABC Basketball League 2015"],
                        nil];
    
    [profileView loadAchievements:arrAchievements maxRow:2];
    
    if(isMyProfile){
        NSArray *arrPhotos = [[NSArray alloc]initWithObjects:
                             [UIImage imageNamed:@"dummy1.jpg"],
                             [UIImage imageNamed:@"dummy2.jpg"],
                              [UIImage imageNamed:@"dummy4.jpg"],
                              [UIImage imageNamed:@"dummy1.jpg"],
                              [UIImage imageNamed:@"dummy2.jpg"],
                              [UIImage imageNamed:@"dummy4.jpg"],
                              nil];
        
        [profileView loadPhotos:arrPhotos];
    }
}

#pragma PROFILE VIEW DELEGATE
- (void)tabClicked:(id)sender{
    UIButton *btn  = (UIButton*)sender  ;
    
    switch (btn.tag) {
        case 0: {
            
            NSLog(@"TAB0");
            
            if([profileView isMyProfile]) {
                BasicInfoViewController *basicInfo = [[BasicInfoViewController alloc]init];
                [self.navigationController pushViewController:basicInfo animated:YES];
                
            } else {
                
                UILabel *label = (UILabel *)[self.view viewWithTag:11];
                UIActionSheet *actionSheet;
                
                if([label.text isEqualToString:@"ADD"]) {
                    actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                         delegate:self
                                                                cancelButtonTitle:@"Cancel"
                                                           destructiveButtonTitle:nil
                                                                otherButtonTitles:@"Add User", nil];
                    
                } else {
                    actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:nil
                                                     otherButtonTitles:@"Delete User", nil];
                }
                
                [actionSheet showInView:self.view];
                [actionSheet setTag:1];
                
            }

            break;
        }
            
        case 1: {
            NSLog(@"TAB1");
            if([profileView isMyProfile]) {
                MessagesViewController *messagesView = [[MessagesViewController alloc]init];
                [self.navigationController pushViewController:messagesView animated:YES];
                
            } else {
                ConversationViewController *conversationView = [[ConversationViewController alloc]init];
                [self.navigationController pushViewController:conversationView animated:YES];
                
            }
            
        }
            break;
            
        case 2: {
            NSLog(@"TAB2");
            if(![profileView isMyProfile]) {
                UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                         delegate:self
                                                                cancelButtonTitle:@"Cancel"
                                                           destructiveButtonTitle:nil
                                                                otherButtonTitles:@"Block User", @"Report To Admin", nil];
                
                [actionSheet showInView:self.view];
            }
        }
            break;
            
            
        default:
            break;
    }
}


- (IBAction)addPhotoDidClick:(id)sender{
    
    PhotosViewController *photos = [[PhotosViewController alloc]init];
    [photos setIsAddView:YES];
    [self.navigationController pushViewController:photos animated:YES];
    
    NSLog(@"add photo");
}

- (IBAction)morePhotosDidClick:(id)sender{
    
    PhotosViewController *photos = [[PhotosViewController alloc]init];
    [self.navigationController pushViewController:photos animated:YES];
    
    NSLog(@"more photos");
    
}

- (IBAction)photoItemDidClick:(id)sender{
    
    UIButton *btn = (UIButton*)sender;
    
    NSLog(@"PHOTO: %ld",(long)btn.tag);
    
    ViewPhotoViewController *viewPhoto = [[ViewPhotoViewController alloc]init];
    [viewPhoto setSelectedImage:((UIImageView *)[self.view viewWithTag:500 + btn.tag]).image];
    
//    frame = ((UIImageView *)[self.view viewWithTag:500]).frame;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewPhoto];
    [self presentViewController:navigationController animated:YES completion:nil];
}

-(void)membershipItemDidClick:(id)sender{
    UIButton *btn = (UIButton*)sender;
    
    NSLog(@"MEMBERSHIP: %ld",(long)btn.tag);
}

-(void)sportItemDidClick:(id)sender{
    UIButton *btn = (UIButton*)sender;
    
    NSLog(@"SPORT: %ld",(long)btn.tag);
}

- (IBAction)outdoorPlaceDidClick:(id)sender{
    UIButton *btn = (UIButton*)sender;
    
    NSLog(@"OUTDOOR PLACE: %ld",(long)btn.tag);
}

- (IBAction)achievementDidClick:(id)sender{
    UIButton *btn = (UIButton*)sender;
    
    NSLog(@"ACHIEVEMENT: %ld",(long)btn.tag);
}

- (IBAction)showMoreAchievements:(id)sender{
    AchievementsViewController *nextView = [[AchievementsViewController alloc]init];
    [nextView setIsMyProfile:isMyProfile];
    [self.navigationController pushViewController:nextView animated:YES];
    
    NSLog(@"SHOW MORE ACHIEVEMENTS");
}

-(IBAction)showFitnessPartners:(id)sender {
    FitnessPartnersViewController *fitnessPartner = [[FitnessPartnersViewController alloc]init];
    [self.navigationController pushViewController:fitnessPartner animated:YES];
}

-(IBAction)showMemberStatus:(id)sender {
    NSLog(@"STATUS BUTTON CLICKED");
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(actionSheet.tag == 1) {
        if(buttonIndex == 0) {
            NSLog(@"ZERO");
            
            UILabel *label = (UILabel *)[self.view viewWithTag:11];
            if([label.text isEqualToString:@"ADD"]) {
                UIImageView *icon = (UIImageView *)[self.view viewWithTag:10];
                [icon setImage:[UIImage imageNamed:@"delete"]];
                
                [label setText:@"DELETE"];
                [label sizeToFit];
                
            } else {
                
                UIImageView *icon = (UIImageView *)[self.view viewWithTag:10];
                [icon setImage:[UIImage imageNamed:@"ic_add"]];
                
                [label setText:@"ADD"];
                [label sizeToFit];
            }
            
        }
    }
}

- (IBAction)onAddSportsButtonTap:(id)sender {
    NSLog(@"TAP");
    FitnessInformationViewController *fitnessInfo = [[FitnessInformationViewController alloc]init];
    [self.navigationController pushViewController:fitnessInfo animated:YES];
}

- (IBAction)onMembershipButtonTap:(id)sender {
    FitnessInformationViewController *fitnessInfo = [[FitnessInformationViewController alloc]init];
    [self.navigationController pushViewController:fitnessInfo animated:YES];
}

- (IBAction)onOutdoorButtonTap:(id)sender {
    FitnessInformationViewController *fitnessInfo = [[FitnessInformationViewController alloc]init];
    [self.navigationController pushViewController:fitnessInfo animated:YES];
}

- (IBAction)onAchievementsButtonTap:(id)sender {
//    AddAchievementViewController *nextView = [[AddAchievementViewController alloc]init];
////    [nextView setIsMyProfile:isMyProfile];
//    [self.navigationController pushViewController:nextView animated:YES];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:[[AddAchievementViewController alloc]init]];
    [self presentViewController:navController animated:YES completion:nil];
    
}

@end
