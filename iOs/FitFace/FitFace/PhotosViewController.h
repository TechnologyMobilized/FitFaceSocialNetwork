//
//  PhotosViewController.h
//  fitface
//
//  Created by LLDM 0037 on 2/19/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PhotosView.h"
#import "ViewPhotoViewController.h"

@interface PhotosViewController : BaseViewController <PhotosViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    PhotosView *photosView;
    NSMutableArray *photoArray;
    NSMutableArray *fetchedImages;
    CGRect frame;
    UICollectionViewCell *selectedImage;
    UICollectionView *itemsGrid;
}

@property BOOL isAddView;

@end
