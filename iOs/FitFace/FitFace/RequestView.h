//
//  RequestView.h
//  fitface
//
//  Created by LLDM 0037 on 4/20/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol RequestViewDelegate <UIGestureRecognizerDelegate>

-(void)onWhereChoiceTap:(UITapGestureRecognizer *)tap;
-(void)onWhatChoiceTap:(UITapGestureRecognizer *)tap;
-(IBAction)onSendButtonTap:(id)sender;

@end

@interface RequestView : BaseView {
    UIView *popupContainer;
    int yOrigin;
    UIScrollView *scrollView;
}

@property (nonatomic, weak)id <RequestViewDelegate> requestDelegate;
//@property (nonatomic, strong) UIScrollView *scrollView;
//@property int yOrigin;

-(void)addWhereChoices:(NSArray *)whereChoicesArray;
-(void)addWhatChoices:(NSArray *)whatChoicesArray;

@end
