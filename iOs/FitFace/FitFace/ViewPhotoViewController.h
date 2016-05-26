//
//  ViewPhotoViewController.h
//  fitface
//
//  Created by LLDM 0037 on 2/19/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ViewPhoto.h"

@interface ViewPhotoViewController : BaseViewController <ViewPhotosDelegate> {
    ViewPhoto *viewPhotosView;
}

@property NSString *URL;
@property (nonatomic, strong) UIImage *selectedImage;

@end
