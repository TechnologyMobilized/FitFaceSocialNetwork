//
//  MotivateView.h
//  fitface
//
//  Created by LLDM 0037 on 4/1/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol MotivateViewDelegate <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@interface MotivateView : BaseView {
    UICollectionView *itemsGrid;
    UIView *mainView;
}

@property (nonatomic, weak)id <MotivateViewDelegate> motivateDelegate;

-(void)triggerCollectionView;

@end
