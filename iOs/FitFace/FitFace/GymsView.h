//
//  GymsView.h
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol GymsViewDelegate <UIScrollViewDelegate, UIActionSheetDelegate>

@end

@interface GymsView : BaseView {
    UIScrollView *scrollView;
    int yOrigin;
}

@property (nonatomic, weak) id <GymsViewDelegate> gymsDelegate;

-(void)gymsList:(NSArray *)gymsArray;

@end
