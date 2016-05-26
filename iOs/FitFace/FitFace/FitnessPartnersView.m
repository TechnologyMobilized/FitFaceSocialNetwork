//
//  FitnessPartnersView.m
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "FitnessPartnersView.h"

@implementation FitnessPartnersView

-(void)setupLayout {
    
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [self.scrollView setBackgroundColor:[UIColor whiteColor]];
    [self.scrollView setDelegate: self.fitnessPartnersDelegate];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [mainView addSubview:self.scrollView];
    
    self.yOrigin = 12;
    tag = 0;
}

-(void)fitnessPartnersList:(NSArray *)array {
    
    for(int i = 0; i < 10; i++) {
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(13, self.yOrigin, self.scrollView.frame.size.width - 26, 60)];
        [container setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
        [container setTag:tag];
        
        [self.scrollView addSubview:container];
        self.yOrigin = container.frame.size.height + container.frame.origin.y + 2;
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, container.frame.size.height)];
        [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [container addSubview:border];
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(border.frame.size.width + 10, 8, 44, 44)];
        //        [image setBackgroundColor:[UIColor lightGrayColor]];
        
        [image.layer setCornerRadius:image.frame.size.width/2];
        [image setContentMode:UIViewContentModeScaleAspectFill];
        [image setClipsToBounds:YES];
        [container addSubview:image];
        
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(image.frame.size.width + image.frame.origin.x + 8, 16, container.frame.size.width - 155, 14)];
        [name setText:[NSString stringWithFormat:@"Lionel Messi"]];
        [name setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
        [container addSubview:name];
        
        UILabel *info = [[UILabel alloc]initWithFrame:CGRectMake(name.frame.origin.x, name.frame.origin.y + name.frame.size.height + 6, name.frame.size.width, 10)];
        [info setText:[NSString stringWithFormat:@"34 Male"]];
        [info setTextColor:[BaseView colorWithHexString:@"7F8081"]];
        [info setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
        [container addSubview:info];
        
        UIButton *deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(container.frame.size.width - 40, 15, 31, 31)];
        [deleteButton setBackgroundImage:[UIImage imageNamed:@"trash"] forState:UIControlStateNormal];
        [deleteButton addTarget:self.fitnessPartnersDelegate action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [deleteButton setTag:tag];
        [container addSubview:deleteButton];
        
        UIButton *messageButton = [[UIButton alloc]initWithFrame:CGRectMake(container.frame.size.width - 80, 15, 31, 31)];
        [messageButton setBackgroundImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
        [messageButton addTarget:self.fitnessPartnersDelegate action:@selector(onMessageButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [messageButton setTag:tag];
        [container addSubview:messageButton];
        
        UIButton *profileButton = [[UIButton alloc]initWithFrame:CGRectMake(image.frame.origin.x, 0, info.frame.size.width + info.frame.origin.x - 10, container.frame.size.height)];
        [profileButton addTarget:self.fitnessPartnersDelegate action:@selector(onProfileButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [container addSubview:profileButton];
        
        tag += 1;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://e1.365dm.com/15/01/768x432/lionel-messi-barcelona-la-liga_3248555.jpg?20150115082643"]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [image setImage:[UIImage imageWithData:imageData]];
                
            });
            
        });
        
    }
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, self.yOrigin + 60)];
}

@end
