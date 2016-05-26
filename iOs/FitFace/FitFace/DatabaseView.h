//
//  DatabaseView.h
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol DatabaseViewDelegate <UIScrollViewDelegate>

-(IBAction)onGymsButtonTap:(id)sender;
-(IBAction)onOutdoorsButtonTap:(id)sender;
-(IBAction)onTypesOfWorkoutButtonTap:(id)sender;
-(IBAction)onSportsButtonTap:(id)sender;
-(IBAction)onEventsButtonTap:(id)sender;
-(IBAction)onFitnessPartnersButtonTap:(id)sender;
-(IBAction)onCheckinButtonTap:(id)sender;
-(IBAction)onRoutinesButtonTap:(id)sender;
-(IBAction)onDietButtonTap:(id)sender;
-(IBAction)onPlaylistButtonTap:(id)sender;
-(IBAction)onOthersButtonTap:(id)sender;

@end

@interface DatabaseView : BaseView {
    UIScrollView *scrollView;
    UIView *placesContainer;
    UIView *workoutContainer;
    UIView *communityContainer;
    UIView *upgradeContainer;
//    UIView *othersContainer;
    UIImageView *placesArrow;
    UIImageView *workoutArrow;
    UIImageView *communityArrow;
    UIImageView *upgradeArrow;
}

@property (nonatomic, weak) id <DatabaseViewDelegate> databaseDelegate;
@property (nonatomic, strong) UIImageView *connectionImage;
@property (nonatomic, strong) UILabel *connectionText;
@end
