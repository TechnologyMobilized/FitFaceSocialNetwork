//
//  SecurityViewController.h
//  fitface
//
//  Created by LLDM 0037 on 3/16/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SecurityView.h"

@interface SecurityViewController : BaseViewController<SecurityViewDelegate> {
    SecurityView *securityView;
}

@end
