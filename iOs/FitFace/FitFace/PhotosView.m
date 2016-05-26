//
//  PhotosView.m
//  fitface
//
//  Created by LLDM 0037 on 2/19/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "PhotosView.h"

@implementation PhotosView
@synthesize scrollView, yOriginLeft, yOriginRight, xOrigin;

-(void)setupLayout {
    
    //view's background

    UIImageView *background = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [background setImage:[UIImage imageNamed:@"bg_photos"]];
    
    [self addSubview:background];
    
//    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, background.frame.size.width, background.frame.size.height)];
//    [scrollView setShowsVerticalScrollIndicator:NO];
//    [scrollView setDelegate: self.photosDelegate];
////    [scrollView setBackgroundColor:[UIColor brownColor]];
//    
//    [self addSubview:scrollView];
//    
//    yOriginLeft = 12;
//    yOriginRight = 12;
//    xOrigin = 16;
//    tag = 0;
}

-(void)photoList:(NSArray *)array {
//    NSData *imageData;
    NSLog(@"photolist");
//    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
//    
//    [scrollView setShowsVerticalScrollIndicator:NO];
//    [scrollView setDelegate: self.photosDelegate];
//    
//    [self addSubview:scrollView];
    
    
    
    for(int i = 0; i < 10; i++) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[array objectAtIndex:i]]];
            UIImage *img = [UIImage imageWithData:imageData];
            CGSize imageSize = img.size;
            int x;
            UIImageView *view;
            
//            NSLog(@"INDEX: %d", i);
            float ratio = ((scrollView.frame.size.width - 50)/2)/imageSize.width;
            
            if(i % 2 == 0) {
                
//                NSLog(@"INDEX -- : %d", i);
                x = 16;
                view = [[UIImageView alloc]initWithFrame:CGRectMake(x, yOriginLeft, (scrollView.frame.size.width - 50)/2, imageSize.height * ratio)];
                [view setBackgroundColor:[UIColor lightGrayColor]];
                [scrollView addSubview:view];
                
                [view setContentMode:UIViewContentModeScaleAspectFit];
//                [view setTag:tag];
//                tag += 1;
                
                yOriginLeft += imageSize.height * ratio + 16;
                
            } else {
                x = ((scrollView.frame.size.width - 50)/2) + 34;
                
                [view setContentMode:UIViewContentModeScaleAspectFit];
                view = [[UIImageView alloc]initWithFrame:CGRectMake(x, yOriginRight, (scrollView.frame.size.width - 50)/2, imageSize.height * ratio)];
                
                [view setBackgroundColor:[UIColor lightGrayColor]];
                [scrollView addSubview:view];
                
//                [view setTag:tag];
//                tag += 1;
                yOriginRight += imageSize.height * ratio + 16;
            }
            
            [view setUserInteractionEnabled:YES];
            [view setTag:i];
            
            
            UITapGestureRecognizer *photoTapped = [[UITapGestureRecognizer alloc]initWithTarget:self.photosDelegate action:@selector(onImageTap:)];
            [view addGestureRecognizer:photoTapped];
            
        
        [SDWebImageDownloader.sharedDownloader downloadImageWithURL:[NSURL URLWithString:[array objectAtIndex:i]]
                                                            options:0
                                                           progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                                               
                                                               
                                                           } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                                                               
                                                               if(image && finished){
                                                                   [view setImage:image];
                                                               }
                                                           }];
        
//            NSLog(@"IMAGE SIZE: %d", imageSize.height);
            
//
//            float ratio = view.frame.size.width/imageSize.width;
            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                // Update the UI
////                NSLog(@"IMAGE DATA: %@", imageData);
//                
//                [view setImage:[UIImage imageWithData:imageData]];
//                
//            });
            
//            NSLog(@"origin %d", yOriginLeft);
//            NSLog(@"origin -- %d", yOriginRight);
            
            [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, ((yOriginLeft < yOriginRight) ? yOriginLeft: yOriginRight) + 60)];
        });
        
    }
    
}



@end
