//
//  FitnessPartnersView.h
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol FitnessPartnersViewDelegate <UIScrollViewDelegate, UIActionSheetDelegate>

-(IBAction)onDeleteButtonTap:(id)sender;
-(IBAction)onMessageButtonTap:(id)sender;
-(IBAction)onProfileButtonTap:(id)sender;

@end

@interface FitnessPartnersView : BaseView {
    int tag;
}

@property (nonatomic, weak) id <FitnessPartnersViewDelegate> fitnessPartnersDelegate;
@property (nonatomic, strong) UIScrollView *scrollView;
@property int yOrigin;

-(void)fitnessPartnersList:(NSArray *)array;

@end
