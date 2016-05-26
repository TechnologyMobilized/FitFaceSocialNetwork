//
//  MotivateViewController.h
//  fitface
//
//  Created by LLDM 0037 on 4/1/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MotivateView.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import <ImageIO/ImageIO.h>
#import "UIImageView+WebCache.h"

@interface MotivateViewController : BaseViewController <MotivateViewDelegate> {
    MotivateView *motivateView;
    NSArray *photoArray;
    NSMutableArray *fetchedImages;
    int size;
}

@end
