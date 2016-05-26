//
//  MotivateView.m
//  fitface
//
//  Created by LLDM 0037 on 4/1/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "MotivateView.h"

@implementation MotivateView

-(void)setupLayout {
    mainView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self addSubview:mainView];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:mainView.frame];
    [background setImage:[UIImage imageNamed:@"bg_photos"]];
    
    [mainView addSubview:background];
    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    itemsGrid = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 44, mainView.frame.size.width, mainView.frame.size.height - 44) collectionViewLayout:layout];
//    [itemsGrid setDataSource:self.motivateDelegate];
//    [itemsGrid setDelegate:self.motivateDelegate];
//    
//    [itemsGrid registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
//    [itemsGrid setBackgroundColor:[UIColor clearColor]];
//    
//    [mainView addSubview:itemsGrid];

}

-(void)triggerCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    itemsGrid = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 44, mainView.frame.size.width, mainView.frame.size.height - 44) collectionViewLayout:layout];
    [itemsGrid setDataSource:self.motivateDelegate];
    [itemsGrid setDelegate:self.motivateDelegate];

    [itemsGrid registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [itemsGrid setBackgroundColor:[UIColor clearColor]];

    [mainView addSubview:itemsGrid];
}

@end
