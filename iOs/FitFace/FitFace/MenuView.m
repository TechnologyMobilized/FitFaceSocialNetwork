//
//  MenuView.m
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView
@synthesize menuViewDelegate,btnUserImage,btnLogout,btnSettings;
//menu
@synthesize btnHome,btnMeet,btnMsgs,btnAbout;

- (void)setupLayout{
 
    
    [self setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
    
    UIView *mainView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self addSubview:mainView];
    
//    UIButton *btnProfile = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [btnProfile setTitle:@"Profile" forState:UIControlStateNormal];
//    [mainView addSubview:btnProfile];
    UIImageView *ivBackground = [[UIImageView alloc]initWithFrame:mainView.frame];
    [ivBackground setImage:[UIImage imageNamed:@"bg_menu"]];
    [mainView addSubview:ivBackground];
    
    //
    // TOP BAR
    //
    UIView *viewTopBar = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainView.frame.size.width, 60)];
//    [viewTopBar setBackgroundColor:[UIColor redColor]];
    [mainView addSubview:viewTopBar];
    
    //close button
    UIButton *btnClose = [[UIButton alloc]initWithFrame:CGRectMake(10, 6, 20, 20)];
    [btnClose addTarget:menuViewDelegate action:@selector(closeMenuDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [btnClose setImage:[UIImage imageNamed:@"ic_dismiss"] forState:UIControlStateNormal];
    [viewTopBar addSubview:btnClose];
    
    
    //USER IMAGE
    
    btnUserImage = [[UIButton alloc]initWithFrame:CGRectMake(viewTopBar.frame.size.width-63, 0, 43, 43)];
    [btnUserImage addTarget:menuViewDelegate action:@selector(profileDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [btnUserImage setImage:[UIImage imageNamed:@"ic_default_profile"] forState:UIControlStateNormal];
    [btnUserImage setClipsToBounds:YES];
//    [btnUserImage setContentMode:UIViewContentModeScaleAspectFit];
    [btnUserImage.imageView setContentMode:UIViewContentModeScaleAspectFill];
    [btnUserImage.layer setCornerRadius:btnUserImage.frame.size.width/2];
    [viewTopBar addSubview:btnUserImage];
    
    UILabel *lblMyProfile = [[UILabel alloc]initWithFrame:CGRectMake(btnUserImage.frame.origin.x-10, btnUserImage.frame.size.height + btnUserImage.frame.origin.y+6, btnUserImage.frame.size.width +20 , 10)];
    [lblMyProfile setAttributedText:[BaseView setCharacterSpacingWithString:@"MY PROFILE"]];
    [lblMyProfile setFont:[UIFont fontWithName:AVENIR_BOOK size:8]];
    [lblMyProfile setTextColor:[UIColor whiteColor]];
    [lblMyProfile setTextAlignment:NSTextAlignmentCenter];
//    [lblMyProfile.layer setBorderWidth:1];
    [viewTopBar addSubview:lblMyProfile];
    
    
    /**
     *
     * Bottom Bar
     *
     */
    
    UIView *viewBottomBar = [[UIView alloc]initWithFrame:CGRectMake(0, mainView.frame.size.height - 70, mainView.frame.size.width, 50)];
//    [viewBottomBar setBackgroundColor:[UIColor redColor]];
    [mainView addSubview:viewBottomBar];
    
    //
    //LOGOUT
    //
    
    UIView *viewLogoutContainer = [[UIView alloc]initWithFrame:CGRectMake(40, 5, 50, 40)];
    [viewBottomBar addSubview:viewLogoutContainer];
    
    UIImageView *ivLogout = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
    [ivLogout setImage:[UIImage imageNamed:@"ic_logout"]];
    [ivLogout setCenter:CGPointMake(viewLogoutContainer.frame.size.width/2, ivLogout.center.y)];
    [viewLogoutContainer addSubview:ivLogout];
    
    UILabel *lblLogout = [[UILabel alloc]initWithFrame:CGRectMake(0, ivLogout.frame.origin.y + ivLogout.frame.size.height+5, viewLogoutContainer.frame.size.width, 20)];
    
    
    [lblLogout setAttributedText:[BaseView setCharacterSpacingWithString:@"LOG OUT"]];
    
    [lblLogout setFont:[UIFont fontWithName:AVENIR_BOOK size:8]];
    [lblLogout setTextColor:[UIColor whiteColor]];
    [lblLogout setTextAlignment:NSTextAlignmentCenter];
    [viewLogoutContainer addSubview:lblLogout];
    
    btnLogout = [[UIButton alloc]initWithFrame:viewLogoutContainer.frame];
    [btnLogout addTarget:menuViewDelegate action:@selector(logoutDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [viewBottomBar addSubview:btnLogout];
    
    //
    //SETTINGS
    //
    
    UIView *viewSettingsContainer = [[UIView alloc]initWithFrame:CGRectMake(viewBottomBar.frame.size.width - (viewLogoutContainer.frame.origin.x + viewLogoutContainer.frame.size.width), viewLogoutContainer.frame.origin.y, viewLogoutContainer.frame.size.width, viewLogoutContainer.frame.size.height)];
    [viewBottomBar addSubview:viewSettingsContainer];
    
    UIImageView *ivSettings = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
    [ivSettings setImage:[UIImage imageNamed:@"ic_settings"]];
    [ivSettings setCenter:CGPointMake(viewSettingsContainer.frame.size.width/2, ivSettings.center.y)];
    [viewSettingsContainer addSubview:ivSettings];
    
    UILabel *lblSettings = [[UILabel alloc]initWithFrame:CGRectMake(0, ivSettings.frame.origin.y + ivSettings.frame.size.height +5, viewSettingsContainer.frame.size.width, 20)];
    
    
    
    [lblSettings setAttributedText:[BaseView setCharacterSpacingWithString:@"SETTINGS"]];
    
    [lblSettings setFont:[UIFont fontWithName:AVENIR_BOOK size:8]];
    [lblSettings setTextColor:[UIColor whiteColor]];
    [lblSettings setTextAlignment:NSTextAlignmentCenter];
    [viewSettingsContainer addSubview:lblSettings];
    
    btnSettings = [[UIButton alloc]initWithFrame:viewSettingsContainer.frame];
    [btnSettings addTarget:menuViewDelegate action:@selector(settingsDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [viewBottomBar addSubview:btnSettings];
    
    /**
     *
     *END OF BOTTOM BAR
     *
     */
    
    //menu
    UIScrollView *svMenuList = [[UIScrollView alloc]initWithFrame:CGRectMake(0, viewTopBar.frame.origin.y+ viewTopBar.frame.size.height, mainView.frame.size.width, mainView.frame.size.height - (viewTopBar.frame.origin.y + viewTopBar.frame.size.height + (mainView.frame.size.height - viewBottomBar.frame.origin.y)))];
//    [svMenuList setBackgroundColor:[UIColor orangeColor]];
    [mainView addSubview:svMenuList];
    
    ///
    /// ADD MENU ITEMS
    ///
    
    UIView *viewMenuContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 50, svMenuList.frame.size.width, 40 *4  + (20*3))];
//    [viewMenuContainer setCenter:CGPointMake(svMenuList.frame.size.width/2, svMenuList.frame.size.height/2)];
//    [viewMenuContainer setBackgroundColor:[UIColor redColor]];
    [svMenuList addSubview:viewMenuContainer];
    
    btnHome = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, viewMenuContainer.frame.size.width, 40)];
    [btnHome addTarget:menuViewDelegate action:@selector(menuHomeClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnHome setTitle:@"Home" forState:UIControlStateNormal];
    [btnHome setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btnHome setTitleColor:[BaseView colorWithHexString:MENU_TEXT_COLOR] forState:UIControlStateNormal];
    [btnHome.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [btnHome.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:16]];
    [btnHome setSelected:YES];
    [viewMenuContainer addSubview:btnHome];
    
    btnMeet = [[UIButton alloc]initWithFrame:CGRectMake(0, btnHome.frame.size.height + btnHome.frame.origin.y+20, viewMenuContainer.frame.size.width, 40)];
    [btnMeet addTarget:menuViewDelegate action:@selector(menuMeetClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnMeet setTitle:@"Meet Now" forState:UIControlStateNormal];
    [btnMeet setTitleColor:[BaseView colorWithHexString:MENU_TEXT_COLOR] forState:UIControlStateNormal];
    [btnMeet setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btnMeet.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [btnMeet.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:16]];
    [btnMeet setSelected:NO];
    [viewMenuContainer addSubview:btnMeet];
    
    btnMsgs = [[UIButton alloc]initWithFrame:CGRectMake(0, btnMeet.frame.size.height + btnMeet.frame.origin.y +20, viewMenuContainer.frame.size.width, 40)];
    [btnMsgs addTarget:menuViewDelegate action:@selector(menuMsgsClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnMsgs setTitle:@"Messages" forState:UIControlStateNormal];
    [btnMsgs setTitleColor:[BaseView colorWithHexString:MENU_TEXT_COLOR] forState:UIControlStateNormal];
    [btnMsgs setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btnMsgs.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [btnMsgs.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:16]];
    [btnMsgs setSelected:NO];
    [viewMenuContainer addSubview:btnMsgs];
    
    btnAbout = [[UIButton alloc]initWithFrame:CGRectMake(0, btnMsgs.frame.size.height + btnMsgs.frame.origin.y+20, viewMenuContainer.frame.size.width, 40)];
    [btnAbout addTarget:menuViewDelegate action:@selector(menuAboutClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnAbout setTitle:@"About Us" forState:UIControlStateNormal];
    [btnAbout setTitleColor:[BaseView colorWithHexString:MENU_TEXT_COLOR] forState:UIControlStateNormal];
    [btnAbout setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btnAbout.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [btnAbout.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:16]];
    [btnAbout setSelected:NO];
    [viewMenuContainer addSubview:btnAbout];
//    [self setMeetNowCount:2];
}
- (void)setMeetNowCount:(int)count{
    if(count<=0){
        [btnMeet setTitle:@"Meet Now" forState:UIControlStateNormal];
        return;
    }
    
    NSString *title =[NSString stringWithFormat:@"Meet Now %d",count];
    int len = 0;
    if(count< 10){
        len = 1;
    }
    else if(count<100){
        len = 2;
    }
    else if(count<1000){
        len = 3;
    }
    else if(count>=1000){
        title =@"Meet Now 999+";
        len = 4;
    }
        
    if([btnMeet isSelected]){
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc]initWithString:title attributes:nil];
        [attrTitle setAttributes:@{NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10],NSBaselineOffsetAttributeName:@10,NSForegroundColorAttributeName:[UIColor whiteColor]} range:NSMakeRange(9, len)];
        
        [btnMeet setAttributedTitle:attrTitle forState:UIControlStateNormal];
    }
    else{
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc]initWithString:title attributes:nil];
        [attrTitle setAttributes:@{NSFontAttributeName:[UIFont fontWithName:AVENIR_BOOK size:10],NSBaselineOffsetAttributeName:@10,NSForegroundColorAttributeName:[BaseView colorWithHexString:MENU_TEXT_COLOR]} range:NSMakeRange(9, len)];
        
        [btnMeet setAttributedTitle:attrTitle forState:UIControlStateNormal];
    }
}
- (void)setSelectedMenu:(UIButton*)btnSelectedMenu{
//    [btnHome setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
//    [btnMeet setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
//    [btnMsgs setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
//    [btnAbout setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
//    
//    [btnSelectedMenu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btnHome setSelected:NO];
    [btnMeet setSelected:NO];
    [btnMsgs setSelected:NO];
    [btnAbout setSelected:NO];
    
    [btnSelectedMenu setSelected:YES];
}

@end
