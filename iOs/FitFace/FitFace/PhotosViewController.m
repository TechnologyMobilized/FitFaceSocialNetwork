//
//  PhotosViewController.m
//  fitface
//
//  Created by LLDM 0037 on 2/19/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "PhotosViewController.h"

@interface PhotosViewController ()

@end

@implementation PhotosViewController

-(void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        if([view isKindOfClass:[UIButton class]]) {
            [view setHidden:YES];
        }
    }
    
    [self.navigationItem setTitle:@"Photos"];
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"plus-menu"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(onAddButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
    
    UIButton *btnHome = [[UIButton alloc]initWithFrame:CGRectMake(self.navigationController.navigationBar.frame.size.width - 30, 15, 18, 14)];
    [btnHome setImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    
    [btnHome addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnHome];
    
//    [[self.navigationController.navigationBar.subviews objectAtIndex:2] setHidden:YES];
//    [[self.navigationController.navigationBar.subviews objectAtIndex:1] setHidden:YES];
    
    NSLog(@"SUBVIEWS: %@", self.navigationController.navigationBar.subviews);
    
}

-(void)viewDidDisappear:(BOOL)animated {
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            
            if(![btn isHidden]) {
                [btn removeFromSuperview];
                
            } else {
                [btn setHidden:NO];
            }
        }
    }
}

-(void)loadView {
    
    photosView = [[PhotosView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [photosView setBaseViewDelegate:self];
    [photosView setPhotosDelegate:self];
    [photosView setupLayout];
    [self setView:photosView];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
//    [self.navigationItem setTitle:@"Photos"];
//    
//    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
//    [addBtn setBackgroundImage:[UIImage imageNamed:@"plus-menu"] forState:UIControlStateNormal];
//    [addBtn addTarget:self action:@selector(onAddButtonTap:) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
//    
//    UIButton *btnHome = [[UIButton alloc]initWithFrame:CGRectMake(self.navigationController.navigationBar.frame.size.width - 30, 15, 18, 14)];
//    [btnHome setImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
//    
//    [btnHome addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnHome];
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if(self.isAddView) {
        [self showActionSheet];
    }
    
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
    
//    [photosView photoList:photoArray];
    
    fetchedImages = [[NSMutableArray alloc]init];
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
//                                       [motivateView triggerCollectionView];
                                       UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
                                       itemsGrid = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44) collectionViewLayout:layout];
                                       [itemsGrid setDataSource:self];
                                       [itemsGrid setDelegate:self];
                                       
                                       [itemsGrid registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
                                       [itemsGrid setBackgroundColor:[UIColor clearColor]];
                                       
                                       [self.view addSubview:itemsGrid];
                                   }
                               }];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(imageRemove)
                                                 name:@"requestDidFinish"
                                               object:nil];
}

-(void)showActionSheet {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Submit a Motivation"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Take a Photo/Video", @"Select from Camera Roll", nil];
    
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            [self takePhotoFromGallery:NO];
        } break;
            
        case 1: {
            [self takePhotoFromGallery:YES];
            
        } break;
            
        default:
            break;
    }
}

-(void)takePhotoFromGallery: (BOOL) isFromGallery {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    if(isFromGallery){
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    } else {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    imagePickerController.editing = YES;
    imagePickerController.delegate = self;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

-(void)imageRemove {
    NSLog(@"number of subviews %d", (int)[[photosView scrollView].subviews count]);
//    for(int i = (int)selectedImage.tag; i < [[photosView scrollView].subviews count] - selectedImage.tag; i++) {
//        UIImageView *image = (UIImageView *) [photosView.scrollView.subviews objectAtIndex:i];
//        [image removeFromSuperview];
//    }
//    CGRect newView;
//    
//    for(UIView *view in [photosView scrollView].subviews) {
//        if(view.frame.origin.y >= selectedImage.frame.origin.y) {
//            [view removeFromSuperview];
////            newView = view.frame;
////            view.frame = selectedImage.frame;
////            selectedImage.frame = newView;
//        }
//    }
    NSArray *selectedItemsIndexPaths = [[NSArray alloc]initWithObjects:[itemsGrid indexPathForCell:selectedImage], nil];
    NSLog(@"PAAATHS --  %@", selectedItemsIndexPaths);
    
    [photoArray removeObjectAtIndex:selectedImage.tag];
    [itemsGrid deleteItemsAtIndexPaths:selectedItemsIndexPaths];
//    
//    [photoArray removeObjectAtIndex:selectedImage.tag];
//    [photosView setYOriginLeft:12];
//    [photosView setYOriginRight:12];
//    
////    [[photosView scrollView]removeFromSuperview];
////    [photosView setScrollView:nil];
//    [[photosView scrollView].subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    [photosView setXOrigin:16];
//    [photosView photoList:photoArray];
    
}

-(IBAction)onAddButtonTap: (id)sender {
    [self showActionSheet];
    NSLog(@"ADD BUTTON");
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)onImageTap:(UIGestureRecognizer *)tapGestureRecognizer {
    selectedImage = (UICollectionViewCell *)tapGestureRecognizer.view;
    
    ViewPhotoViewController *viewPhoto = [[ViewPhotoViewController alloc]init];
    [viewPhoto setSelectedImage:(UIImage *)[fetchedImages objectAtIndex:selectedImage.tag]];;
    
    frame = selectedImage.frame;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewPhoto];
    [self presentViewController:navigationController animated:YES completion:nil];
    
//    NSLog(@"image background tag %d --- %d", (int)img.tag, (img.tag %10 ));
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"here");
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    
    if (bottomEdge >= scrollView.contentSize.height) {
        [photosView photoList:photoArray];
    }
}

#pragma mark - Image picker delegate methods
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    self.avatar.image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    
//    avatarbase64 = [self encodeToBase64String:self.avatar.image];
//    [self dismissViewControllerAnimated:YES completion:^{
//        [self.avatar setImage:self.avatar.image];
//        
//    }];
//    
//    didChangeAvatar = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"IMAGE PICKER: %@", self.navigationController.navigationBar.subviews);
    [self.navigationItem setTitle:@"Photos"];
    [[self.navigationController.navigationBar.subviews objectAtIndex:2] setHidden:YES];
    [[self.navigationController.navigationBar.subviews objectAtIndex:1] setHidden:YES];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [photoArray count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    CGSize imageSize = ((UIImage *)[fetchedImages objectAtIndex:indexPath.row]).size;
    float ratio = (cell.frame.size.width)/imageSize.width;
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, ratio * imageSize.height)];
    [view setImage:(UIImage *)[fetchedImages objectAtIndex:indexPath.row]];
    
    UITapGestureRecognizer *photoTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onImageTap:)];
    [cell setTag:indexPath.row];
    [cell addGestureRecognizer:photoTapped];
    [cell setSelected:YES];
    
    [cell.contentView addSubview:view];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize imgSize = ((UIImage *)[fetchedImages objectAtIndex:indexPath.row]).size;
    float ratio = ((collectionView.frame.size.width - 48)/2)/imgSize.width;
    return CGSizeMake((collectionView.frame.size.width - 48)/2, imgSize.height * ratio);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(16, 16, 16, 16);
}


@end
