//
//  PlaceViewController.m
//  fitface
//
//  Created by LLDM 0037 on 5/4/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "PlaceViewController.h"
#import "HomeViewController.h"

@interface PlaceViewController ()

@end

@implementation PlaceViewController

-(void)loadView {
    placeView = [[PlaceView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [placeView setBaseViewDelegate:self];
    [placeView setPlaceDelegate:self];
    [placeView setupLayout];
    [self setView:placeView];
    
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationItem setTitle:@"Event 1"];
}

#pragma mark - SuccessStoryViewDelegate methods
-(void)onImageContainerTap:(id)sender {
    selectedButton = (UIButton *)sender;
    UIImageView *selectedContainer = (UIImageView *)[self.view viewWithTag:selectedButton.tag + 10];
    
    if(![selectedContainer.subviews.lastObject isHidden]) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Upload photo"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"Take a Photo/Video", @"Select from Camera Roll", nil];
        
        [actionSheet setTag:100];
        [actionSheet showInView:self.view];
    }
    
}

-(void)onImageContainerPress:(UILongPressGestureRecognizer *)gesture {
    selectedButton = (UIButton *)gesture.view;
    UIImageView *selectedContainer = (UIImageView *)[self.view viewWithTag:selectedButton.tag + 10];
    
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        NSLog(@"Long Press");
        if(selectedContainer.image != nil) {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Delete photo?"
                                                                     delegate:self
                                                            cancelButtonTitle:@"Cancel"
                                                       destructiveButtonTitle:nil
                                                            otherButtonTitles:@"Delete", nil];
            
            [actionSheet showInView:self.view];
        }
    }
}

-(void)onSubmitButtonTap:(id)sender {
    UIButton *button = (UIButton *)sender;
    if([button.titleLabel.text isEqualToString:@"SUBMIT"]) {
        [button setTitle:@"SUCCESSFUL" forState:UIControlStateNormal];
        [button setBackgroundColor:[BaseView colorWithHexString:@"D2EBD4"]];
        [button setTitleColor:[BaseView colorWithHexString:@"748074"] forState:UIControlStateNormal];
        
    }
    
}

-(void)onMainViewtap:(UITapGestureRecognizer *)gesture {
    [self.view endEditing:YES];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(actionSheet.tag == 100) {
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
        
    } else {
        switch (buttonIndex) {
            case 0: {
                UIImageView *selectedContainer = (UIImageView *)[self.view viewWithTag:selectedButton.tag + 10];
                [selectedContainer setImage:nil];
                [selectedContainer.subviews.lastObject setHidden:NO];
                
            } break;
                
            default:
                break;
        }
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

#pragma mark - Image picker delegate methods
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImageView *selectedContainer = (UIImageView *)[self.view viewWithTag:selectedButton.tag + 10];
    [selectedContainer setImage:[info objectForKey:UIImagePickerControllerOriginalImage]];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [selectedContainer.subviews.lastObject setHidden:YES];
    
    UIButton *submitButton = (UIButton *)[self.view viewWithTag:200];
    
    if(![submitButton.titleLabel.text isEqualToString:@"SUBMIT"]) {
        [submitButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
        [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [submitButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)onBackButtonTap:(id)sender {
    if (self.isFromHome) {
        [self.sidePanelController showRightPanelAnimated:YES];
        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController: [[HomeViewController alloc] init] ];
        [self.sidePanelController setCenterPanel:nil];
        [self.sidePanelController setCenterPanel:navController];
        [self.sidePanelController showCenterPanelAnimated:YES];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - UITextField delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    UIButton *submitButton = (UIButton *)[self.view viewWithTag:200];
    [submitButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitButton setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
}

@end
