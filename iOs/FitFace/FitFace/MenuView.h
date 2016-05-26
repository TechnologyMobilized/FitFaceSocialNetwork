//
//  MenuView.h
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "BaseView.h"

@protocol MenuViewDelegate;
@interface MenuView : BaseView<BaseViewDelegate>{
    
}
@property(nonatomic, strong) id<MenuViewDelegate> menuViewDelegate;
@property (nonatomic, strong) UIButton *btnUserImage;
@property (nonatomic, strong) UIButton *btnLogout;
@property (nonatomic, strong) UIButton *btnSettings;

//menu items
@property (nonatomic, strong) UIButton *btnHome;
@property (nonatomic, strong) UIButton *btnMeet;
@property (nonatomic, strong) UIButton *btnMsgs;
@property (nonatomic, strong) UIButton *btnAbout;


- (void)setMeetNowCount:(int)count;
- (void)setSelectedMenu:(UIButton*)btnSelectedMenu;

@end

@protocol MenuViewDelegate <NSObject>
- (void)closeMenuDidClicked;
- (void)profileDidClicked;
//menu targets
- (IBAction)menuHomeClicked:(id)sender;
- (IBAction)menuMeetClicked:(id)sender;
- (IBAction)menuMsgsClicked:(id)sender;
- (IBAction)menuAboutClicked:(id)sender;

- (void)logoutDidClicked;
- (void)settingsDidClicked;
@end