//
//  HomeView.h
//  fitface
//
//  Created by Launch Labs on 2/10/16.
//  Copyright © 2016 Launch Labs. All rights reserved.
//

#import "BaseView.h"

@protocol HomeViewDelegate <UIGestureRecognizerDelegate>

-(IBAction)onMotivateButtonTap:(id)sender;
-(IBAction)onDatabaseQuestionTap:(id)sender;
-(IBAction)onProfileButtonTap:(id)sender;
-(IBAction)onTrainerButtonTap:(id)sender;
-(IBAction)onUpgradeButtonTap:(id)sender;
-(IBAction)onSuccessButtonTap:(id)sender;
-(IBAction)onPlaceButtonTap:(id)sender;
-(void)onSwitchButtonTap:(UIImageView *)switchButton;
-(IBAction)onOnTheGoTap:(id)sender;
-(void)onChoicesTap:(UITapGestureRecognizer *)gesture;
-(void)onBackgroundTap:(UIGestureRecognizer *)gesture;
-(IBAction)onMatchesButtonTap:(id)sender;
-(IBAction)onTipsButtonTap:(id)sender;
-(IBAction)onNextButtonTap:(id)sender;
-(void)onDontShowButtonTap:(UITapGestureRecognizer *)sender;
-(void)onTap;

@end

@interface HomeView : BaseView<BaseViewDelegate> {
    UIImageView *switchImage;
    UIView *onTheGoSwitch;
}

@property (nonatomic, weak) id<HomeViewDelegate> homeViewDelegate;
@property (nonatomic, strong) UIView *searchPopupBackground;
@property (nonatomic, strong) UIView *popupView;
@property BOOL isOn;

@end
