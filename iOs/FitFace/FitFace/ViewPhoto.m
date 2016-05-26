//
//  ViewPhoto.m
//  fitface
//
//  Created by LLDM 0037 on 2/19/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "ViewPhoto.h"

@implementation ViewPhoto

-(void)setupLayout {
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [background setImage:[UIImage imageNamed:@"bg_photos"]];
    
    [self addSubview:background];
    
    self.photo = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.photo setContentMode:UIViewContentModeScaleAspectFit];
    
    [self addSubview:self.photo];
    
}

@end
