//
//  ViewPhoto.h
//  fitface
//
//  Created by LLDM 0037 on 2/19/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol ViewPhotosDelegate <UIActionSheetDelegate>

@end

@interface ViewPhoto : BaseView

@property (nonatomic, weak) id <ViewPhotosDelegate> photosDelegate;
@property (nonatomic, strong) UIImageView *photo;

@end
