//
//  MatchesFoundViewController.h
//  fitface
//
//  Created by LLDM 0037 on 4/7/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MatchesFound.h"
#import "SDWebImage/SDWebImageManager.h"
#import "RequestViewController.h"
#import "SendMessageViewController.h"

@interface MatchesFoundViewController : BaseViewController <MatchesFoundViewDelegate> {
    MatchesFound *matchesFoundView;
    NSMutableArray *dataArray;
    NSMutableArray *reasonsArray;
    UIScrollView *scrollView;
    UIButton *closeButton;
    int yOrigin;
}

@end
