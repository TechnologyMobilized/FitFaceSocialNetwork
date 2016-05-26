
//
//  ViewPhotoViewController.m
//  fitface
//
//  Created by LLDM 0037 on 2/19/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "ViewPhotoViewController.h"

@interface ViewPhotoViewController ()

@end

@implementation ViewPhotoViewController


-(void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];

    NSLog(@"SUBVIEWS: %@", self.navigationController.navigationBar.subviews);
}

-(void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)loadView {
    viewPhotosView = [[ViewPhoto alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [viewPhotosView setBaseViewDelegate:self];
    [viewPhotosView setPhotosDelegate:self];
    [viewPhotosView setupLayout];
    [self setView:viewPhotosView];
    
    NSLog(@"SUB: %@", [self.view subviews]);
    
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"ic_dismiss"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(onCloseButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    
    UIButton *deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(self.navigationController.navigationBar.frame.size.width - 30, 15, 18, 14)];
    [deleteButton setImage:[UIImage imageNamed:@"trash_menu"] forState:UIControlStateNormal];
    
    [deleteButton addTarget:self action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:deleteButton];
//    [self useImage:self.URL];
    
    [viewPhotosView.photo setImage:self.selectedImage];
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"requestDidFinish" object:nil];
}

-(IBAction)onCloseButtonTap:(id)sender {
    NSLog(@"PRESENTING VIEW: %@", self.presentingViewController);
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onDeleteButtonTap:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Delete photo?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Delete", nil];
    
    [actionSheet showInView:self.view];
}

-(void)useImage:(NSString *)URL {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL]];
        UIImage *img = [UIImage imageWithData:imageData];
        [viewPhotosView.photo setImage:img];
        
    });
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"requestDidFinish" object:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } break;
            
        default:
            break;
    }
}

@end
