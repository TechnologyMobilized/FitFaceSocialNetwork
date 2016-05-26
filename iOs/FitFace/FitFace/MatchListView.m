//
//  MatchListView.m
//  fitface
//
//  Created by LLDM 0037 on 3/11/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "MatchListView.h"

@implementation MatchListView

-(void)setupLayout {
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mainView];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [scrollView setDelegate:self.matchListDelegate];
    [mainView addSubview:scrollView];
    
    yOrigin = 12;
    
}

-(void)matchList:(NSArray *)matchListArray {
    
    for(int i = 0; i < 10; i++) {
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(12, yOrigin, scrollView.frame.size.width - 24, 60)];
        [container setBackgroundColor:[BaseView colorWithHexString:@"F6F6F6"]];
        [scrollView addSubview:container];
        
        yOrigin = container.frame.size.height + container.frame.origin.y + 2;
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, container.frame.size.height)];
        [border setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [container addSubview:border];
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(border.frame.size.width + 10, 8, 44, 44)];
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
        
        UIButton *removeButton = [[UIButton alloc]initWithFrame:CGRectMake(container.frame.size.width - 90, 15, 76, container.frame.size.height - 28)];
        [removeButton.layer setBorderColor:[BaseView colorWithHexString:@"C4DCFC"].CGColor];
        [removeButton setTitle:@"REMOVE" forState:UIControlStateNormal];
        [removeButton setTitleColor:[BaseView colorWithHexString:THEME_COLOR] forState:UIControlStateNormal];
        [removeButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
        [removeButton.layer setBorderWidth:1.0];
        [removeButton.layer setCornerRadius:2.0];
        [removeButton setTag:tag];
        [removeButton addTarget:self.matchListDelegate action:@selector(onRemoveButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        
        [container addSubview:removeButton];
        
        tag += 1;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://e1.365dm.com/15/01/768x432/lionel-messi-barcelona-la-liga_3248555.jpg?20150115082643"]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [image setImage:[UIImage imageWithData:imageData]];
                
            });
            
        });
        
    }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin + 60)];
}

@end
