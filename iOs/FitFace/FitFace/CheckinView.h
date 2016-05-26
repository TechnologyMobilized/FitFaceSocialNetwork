//
//  CheckinView.h
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol CheckinViewDelegate <UIScrollViewDelegate, UIActionSheetDelegate>

-(IBAction)onButtonTap:(id)sender;
-(IBAction)onProfileButtonTap:(id)sender;
@end

@interface CheckinView : BaseView {
    UIScrollView *scrollView;
    int yOrigin;
    int tag;
}

@property (nonatomic, weak) id <CheckinViewDelegate> checkinDelegate;

-(void)checkinList:(NSArray *)array;

@end
