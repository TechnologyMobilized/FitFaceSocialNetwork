//
//  MotivateViewController.m
//  fitface
//
//  Created by LLDM 0037 on 4/1/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "MotivateViewController.h"

@interface MotivateViewController ()

@end

@implementation MotivateViewController

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
}

-(void)loadView {
    motivateView = [[MotivateView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [motivateView setBaseViewDelegate:self];
    [motivateView setMotivateDelegate:self];
    [motivateView setupLayout];
    [self setView:motivateView];
    
    UIButton *uploadButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    [uploadButton setBackgroundImage:[UIImage imageNamed:@"upload"] forState:UIControlStateNormal];
    [uploadButton addTarget:self action:@selector(onUploadButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:uploadButton];
    
    UIButton *menuButton = [[UIButton alloc]initWithFrame:CGRectMake(self.navigationController.navigationBar.frame.size.width - 30, 15, 18, 14)];
    [menuButton setImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(onMenuButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    
    fetchedImages = [[NSMutableArray alloc]init];
    photoArray = [NSMutableArray arrayWithObjects:@"http://www.mb71fitness.com/images/stories/mb71fitness1.jpg",
                  @"http://media.philly.com/images/pushups.jpg",
                  @"http://www.marieclaire.fr/data/photo/mw1000_c17/48/fitness.jpg",
                  @"http://greatist.com/sites/default/files/styles/big_share/public/Runner-on-road-810x420.jpg?itok=jbJH6DcF",
                  @"http://www.appleseednm.org/wp-content/uploads/2014/06/16.png",
                  @"http://www.mensweekly.net/wp-content/uploads/2015/03/ID-17050597-e1357210193776.jpg",
                  @"http://empowerfitnessnc.com/wp-content/uploads/2014/07/459935503.jpg",
                  @"http://clothes.imagestodownload.com/wp-content/uploads/2015/09/Fitness-Stock-Photos-balance.jpg",
                  @"https://sapsponsorships.com/media/1154/how-the-iphone-6-and-ios8-will-revolutionize-sports-and-fitness.jpg",
                  @"http://oxigen.com.au/penrith/images/gym-hero.png",
                  @"http://www.wellawareuk.com/wp-content/uploads/2015/10/girlstretching.jpg", nil];
    
    [self addHeaderTitle:@"Motivate"];
    
    for(int i = 0; i < [photoArray count]; i++) {
        NSLog(@"IN HERE");
        NSURL *imageURL = [[NSURL alloc]initWithString:[photoArray objectAtIndex:i]];
        SDWebImageDownloader *downloader = [SDWebImageDownloader sharedDownloader];
        [downloader downloadImageWithURL:imageURL
                                 options:0
                                progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                    // progression tracking code
                                }
                               completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                                   NSLog(@"FRAME --%@", NSStringFromCGSize(image.size));
                                   [fetchedImages addObject:image];
                                   NSLog(@"ARRAY -- %@", fetchedImages);
                                   if([fetchedImages count] == [photoArray count]) {
                                       [motivateView triggerCollectionView];
                                   }
                               }];
    }
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    //    NSURL *url = [[NSURL alloc]initWithString:@"http://www.mb71fitness.com/images/stories/mb71fitness1.jpg"];
    //    if (url == nil)
    //        return;
    //
    //    CGImageSourceRef imageSourceRef = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    //    if(imageSourceRef == NULL)
    //        return;
    //
    //    CFDictionaryRef props = CGImageSourceCopyPropertiesAtIndex(imageSourceRef, 0, NULL);
    //    CFRelease(imageSourceRef);
    //
    //    NSLog(@"%@", (__bridge NSDictionary *)props);
    size = 100;
    
}

- (void)addHeaderTitle:(NSString*)title{
    [self.navigationController.navigationBar.topItem setTitle:title];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:AVENIR_BOOK size:14] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}

-(IBAction)onUploadButtonTap:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Upload button clicked"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(IBAction)onMenuButtonTap:(id)sender {
    if([self.sidePanelController centerPanelHidden]){
        [self.sidePanelController showCenterPanelAnimated:YES];
    }
    else [self.sidePanelController showRightPanelAnimated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [photoArray count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    CGSize imageSize = ((UIImage *)[fetchedImages objectAtIndex:indexPath.row]).size;
    float ratio = (cell.frame.size.width)/imageSize.width;
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, ratio * imageSize.height)];
    [view setImage:(UIImage *)[fetchedImages objectAtIndex:indexPath.row]];
    
    [cell.contentView addSubview:view];
    //    cell.backgroundColor = [UIColor greenColor];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[photoArray objectAtIndex:indexPath.row]]];
//        UIImage *img = [UIImage imageWithData:imageData];
//        CGSize imageSize = img.size;
//        //        UIImageView *view;
//        
//        //            NSLog(@"INDEX: %d", i);
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // Update the UI
//            NSLog(@"IMAGE DATA: %@", imageData);
//            
//            float ratio = (cell.frame.size.width)/imageSize.width;
//            UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, ratio * imageSize.height)];
//            
//            [view setImage:[UIImage imageWithData:imageData]];
//            //            size = view.frame.size.height;
//            //            [cell  setFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, view.frame.size.height)];
//            //            [collectionView.collectionViewLayout invalidateLayout];
//            [cell addSubview:view];
//            
//        });
//        
//    });
    
    //    [cell setFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, 50)];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //    int size;
    //    NSLog(@"SIZE");
    //    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[photoArray objectAtIndex:indexPath.row]]];
    //    UIImage *img = [UIImage imageWithData:imageData];
    //    CGSize imageSize = img.size;
    //    float ratio = (collectionView.frame.size.width - 48)/2/imageSize.width;
    
//    NSURL *url = [[NSURL alloc]initWithString:[photoArray objectAtIndex:indexPath.row]];
//    
//    CGImageSourceRef imageSourceRef = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
//    
//    CFDictionaryRef props = CGImageSourceCopyPropertiesAtIndex(imageSourceRef, 0, NULL);
    
    CGSize imgSize = ((UIImage *)[fetchedImages objectAtIndex:indexPath.row]).size;
    float ratio = ((collectionView.frame.size.width - 48)/2)/imgSize.width;
    
//    NSLog(@"Width -- %f", [[(__bridge NSDictionary *)props objectForKey:@"PixelWidth"]floatValue]);
//    NSLog(@"Height -- %f", [[(__bridge NSDictionary *)props objectForKey:@"PixelHeight"]floatValue]);
//    NSLog(@"RATIO -- %f", ratio);
//    float height = imgSize.height;
//    
//    CFRelease(imageSourceRef);
//    CFRelease(props);
    return CGSizeMake((collectionView.frame.size.width - 48)/2, imgSize.height * ratio);
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//
//    return 16;
//}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    
//    return 0.0;
//}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(16, 16, 16, 16);
}

@end
