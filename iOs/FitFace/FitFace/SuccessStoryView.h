//
//  SuccessStoryView.h
//  fitface
//
//  Created by LLDM 0037 on 4/29/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol SuccessStoryViewDelegate <UIGestureRecognizerDelegate, UITextViewDelegate>

-(void)onImageContainerTap:(id)sender;
-(void)onSubmitButtonTap:(id)sender;
-(void)onImageContainerPress:(UILongPressGestureRecognizer *)gesture;
-(void)onMainViewtap:(UITapGestureRecognizer *)gesture;
-(void)onBackButtonTap:(id)sender;

@end

@interface SuccessStoryView : BaseView {
    UIScrollView *scrollView;
}

@property (nonatomic, weak)id <SuccessStoryViewDelegate> successStoryDelegate;

@end
