//
//  PhotosView.h
//  fitface
//
//  Created by LLDM 0037 on 2/19/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "SDWebImage/SDWebImageManager.h"

@protocol PhotosViewDelegate <UIScrollViewDelegate, UIActionSheetDelegate, UIGestureRecognizerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

-(void)onImageTap:(UIGestureRecognizer *)tapGestureRecognizer;

@end

@interface PhotosView : BaseView {
//    UIScrollView *scrollView;
//    int yOriginLeft;
//    int yOriginRight;
//    int xOrigin;
    int tag;
}

@property (nonatomic, weak) id <PhotosViewDelegate> photosDelegate;
@property (nonatomic, strong) UIScrollView *scrollView;
@property int yOriginLeft;
@property int yOriginRight;
@property int xOrigin;

-(void)photoList:(NSArray *)array;

@end
