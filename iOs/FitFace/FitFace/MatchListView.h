//
//  MatchListView.h
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol MatchListViewDelegate <UIScrollViewDelegate, UIActionSheetDelegate>

-(IBAction)onRemoveButtonTap:(id)sender;

@end

@interface MatchListView : BaseView {
    UIScrollView *scrollView;
    int yOrigin;
    int tag;
}

@property (nonatomic, weak) id <MatchListViewDelegate> matchListDelegate;

-(void)matchList:(NSArray *)array;

@end
