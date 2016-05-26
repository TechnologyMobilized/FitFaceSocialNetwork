//
//  OutdoorPlaces.h
//  fitface
//
//  Created by LLDM 0037 on 2/26/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol OutdoorPlacesViewDelegate <UIScrollViewDelegate, UIActionSheetDelegate>

@end

@interface OutdoorPlaces : BaseView {
    UIScrollView *scrollView;
    int yOrigin;
    int tag;
}

@property(nonatomic, weak) id <OutdoorPlacesViewDelegate> outdoorPlacesDelegate;

-(void)outdoorPlacesList:(NSArray *)gymsArray;

@end
