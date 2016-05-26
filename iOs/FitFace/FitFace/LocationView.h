//
//  LocationView.h
//  fitface
//
//  Created by LLDM 0037 on 3/3/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@protocol LocationViewDelegate <UIScrollViewDelegate, UIActionSheetDelegate, UITextFieldDelegate>

-(IBAction)onButtonTap:(id)sender;
-(void)textFieldDidChange:(UITextField *)field;

@end

@interface LocationView : BaseView {
    int yOrigin;
    int tag;
    int scrollHeight;
    UIView *border;
}

@property (nonatomic, weak) id <LocationViewDelegate> locationDelegate;
@property (nonatomic, strong) UIScrollView *scrollView;

-(void)searchList:(NSArray *)list;

@end
