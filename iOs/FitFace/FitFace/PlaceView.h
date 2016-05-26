//
//  PlaceView.h
//  fitface
//
//  Created by LLDM 0037 on 5/4/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol PlaceViewDelegate <UIGestureRecognizerDelegate, UITextFieldDelegate>

-(void)onImageContainerTap:(id)sender;
-(void)onSubmitButtonTap:(id)sender;
-(void)onImageContainerPress:(UILongPressGestureRecognizer *)gesture;
-(void)onMainViewtap:(UITapGestureRecognizer *)gesture;
-(void)onBackButtonTap:(id)sender;

@end

@interface PlaceView : BaseView {
    UIScrollView *scrollView;
}

@property (nonatomic, weak)id <PlaceViewDelegate> placeDelegate;

@end
