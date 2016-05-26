//
//  MeetNowNotifViewController.m
//  fitface
//
//  Created by LLDM 0037 on 4/8/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "MeetNowNotifViewController.h"

@interface MeetNowNotifViewController ()

@end

@implementation MeetNowNotifViewController

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 18, 14)];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(onMenuButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
}

-(void)loadView {
    dataArray = [NSMutableArray arrayWithObjects:@"http://www.mb71fitness.com/images/stories/mb71fitness1.jpg",
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
    
    reasonsArray = [NSMutableArray arrayWithObjects:@"Goes to the same gyms and outdoors", @"Plays football", nil];
    
    meetNowView = [[MeetNowNotifView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [meetNowView setBaseViewDelegate:self];
    [meetNowView setMeetNowNotifDelegate:self];
    [meetNowView setupLayout];
    [self setView:meetNowView];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self addHeaderTitle:@"Meet Now"];
    
}

- (void)addHeaderTitle:(NSString*)title{
    [self.navigationController.navigationBar.topItem setTitle:title];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:AVENIR_BOOK size:14] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}

-(IBAction)onMenuButtonTap:(id)sender {
    NSLog(@"PRESENTING VIEW: %@", self.presentingViewController);
    if([self.sidePanelController centerPanelHidden]){
        [self.sidePanelController showCenterPanelAnimated:YES];
    }
    else [self.sidePanelController showRightPanelAnimated:YES];
}

-(void)reasonsMatches:(NSArray *)reasonArray {
    for(int i = 0; i < [reasonsArray count]; i++) {
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, yOrigin, self.view.frame.size.width, 20)];
        [scrollView addSubview:container];
        
        UIView *dot = [[UIView alloc]initWithFrame:CGRectMake(14, 8, 4, 4)];
        //        [dot setCenter:CGPointMake(dot.frame.origin.x, container.center.y)];
        [dot.layer setCornerRadius:dot.frame.size.height/2];
        [dot setBackgroundColor:[BaseView colorWithHexString:@"85BEFA"]];
        [container addSubview:dot];
        
        UILabel *reasonText = [[UILabel alloc]initWithFrame:CGRectMake(dot.frame.size.width + dot.frame.origin.x + 9, 0, container.frame.size.width - (dot.frame.size.width + dot.frame.origin.x), container.frame.size.height)];
        [reasonText setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
        [reasonText setTextColor:[BaseView colorWithHexString:@"6D6D6D"]];
        [reasonText setText:[reasonsArray objectAtIndex:i]];
        [container addSubview:reasonText];
        
        yOrigin += container.frame.size.height;
    }
}

-(void)matchWhat:(NSArray *)array {
    NSArray *whatArray = [NSArray arrayWithObjects:@"Football", @"Leg Work", nil];
    
    for(int i = 0; i < [whatArray count]; i++) {
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, yOrigin, self.view.frame.size.width, 20)];
        [scrollView addSubview:container];
        
        UIView *dot = [[UIView alloc]initWithFrame:CGRectMake(14, 8, 4, 4)];
        //        [dot setCenter:CGPointMake(dot.frame.origin.x, container.center.y)];
        [dot.layer setCornerRadius:dot.frame.size.height/2];
        [dot setBackgroundColor:[BaseView colorWithHexString:@"85BEFA"]];
        [container addSubview:dot];
        
        UILabel *reasonText = [[UILabel alloc]initWithFrame:CGRectMake(dot.frame.size.width + dot.frame.origin.x + 9, 0, container.frame.size.width - (dot.frame.size.width + dot.frame.origin.x), container.frame.size.height)];
        [reasonText setFont:[UIFont fontWithName:AVENIR_BOOK size:11]];
        [reasonText setTextColor:[BaseView colorWithHexString:@"6D6D6D"]];
        [reasonText setText:[whatArray objectAtIndex:i]];
        [container addSubview:reasonText];
        
        yOrigin += container.frame.size.height;
    }
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    //    NSLog(@"LOOOOOOG -- %d", [dataArray count]);
    return [dataArray count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
    //    UILabel *label = nil;
    NSLog(@"INDEX -- %d", (int)index);
    
    //create new view if no view is available for recycling
    if (view == nil) {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 238.0f, 411.0f)];
        [view.layer setCornerRadius:2.0];
        [view setUserInteractionEnabled:YES];
        [view setClipsToBounds:YES];
        
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 411)];
        [scrollView setBackgroundColor:[UIColor whiteColor]];
        [scrollView setShowsVerticalScrollIndicator:NO];
        [scrollView setDelegate:self];
        [view addSubview:scrollView];
        
        UIImageView *userImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 172)];
        //        [userImage setImage:[UIImage imageNamed:@"dummy2"]];
        [userImage setContentMode:UIViewContentModeScaleAspectFill];
        [userImage setTag:1];
        [scrollView addSubview:userImage];
        
        UILabel *userName = [[UILabel alloc]initWithFrame:CGRectMake(0, userImage.frame.size.height, view.frame.size.width, 26)]; 
        [userName setText:[NSString stringWithFormat:@"%@", @"Lionel Messi"]];
        [userName setFont:[UIFont fontWithName:AVENIR_BOOK size:13]];
        [userName setTextColor:[UIColor blackColor]];
        [userName setTag:3];
        [userName setTextAlignment:NSTextAlignmentCenter];
        [scrollView addSubview:userName];
        
        UILabel *age = [[UILabel alloc]initWithFrame:CGRectMake(0, userName.frame.size.height + userName.frame.origin.y, view.frame.size.width, 10)];
        [age setTextAlignment:NSTextAlignmentCenter];
        [age setText:[NSString stringWithFormat:@"%@ %@", @"34", @"Male"]];
        [age setFont:[UIFont fontWithName:AVENIR_BOOK size:9]];
        [age setTag:4];
        [age setTextColor:[BaseView colorWithHexString:@"A2A2A2"]];
        [scrollView addSubview:age];
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, age.frame.size.height + age.frame.origin.y + 9, view.frame.size.width, 2)];
        [border setBackgroundColor:[BaseView colorWithHexString:@"EEEEEE"]];
        [scrollView addSubview:border];
        
        UILabel *meetNowLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, border.frame.size.height + border.frame.origin.y + 11, view.frame.size.width, 12)];
        [meetNowLabel setText:@"Would you like to meet now?"];
        [meetNowLabel setTextColor:[UIColor blackColor]];
        [meetNowLabel setTextAlignment:NSTextAlignmentCenter];
        [meetNowLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:11]];
        [scrollView addSubview:meetNowLabel];
        
        yOrigin = meetNowLabel.frame.size.height + meetNowLabel.frame.origin.y + 12;
        [self reasonsMatches:@[]];
        
        UILabel *whereLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, yOrigin + 6, view.frame.size.width - 28, 15)];
        [whereLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"WHERE?"]];
        [whereLabel setTextColor:[BaseView colorWithHexString:@"03248D"]];
        [whereLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
        [scrollView addSubview:whereLabel];
        
        UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, whereLabel.frame.size.height + whereLabel.frame.origin.y + 5, self.view.frame.size.width, 12)];
        [scrollView addSubview:container];
        
        UIView *dot = [[UIView alloc]initWithFrame:CGRectMake(14, 4, 4, 4)];
        //        [dot setCenter:CGPointMake(dot.frame.origin.x, container.center.y)];
        [dot.layer setCornerRadius:dot.frame.size.height/2];
        [dot setBackgroundColor:[BaseView colorWithHexString:@"85BEFA"]];
        [container addSubview:dot];
        
        UILabel *reasonText = [[UILabel alloc]initWithFrame:CGRectMake(dot.frame.size.width + dot.frame.origin.x + 9, 0, container.frame.size.width - (dot.frame.size.width + dot.frame.origin.x), container.frame.size.height)];
        [reasonText setFont:[UIFont fontWithName:AVENIR_BOOK size:12]];
        [reasonText setTextColor:[BaseView colorWithHexString:@"6D6D6D"]];
        [reasonText setText:[NSString stringWithFormat:@"%@", @"Fitness Pro Gym"]];
        [container addSubview:reasonText];
        
        UILabel *whatLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, container.frame.size.height + container.frame.origin.y + 14, view.frame.size.width - 28, 9)];
        [whatLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"FOR WHAT?"]];
        [whatLabel setTextColor:[BaseView colorWithHexString:@"03248D"]];
        [whatLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
        [scrollView addSubview:whatLabel];
        
        yOrigin = whatLabel.frame.size.height + whatLabel.frame.origin.y + 2;
        [self matchWhat:@[]];
        //        [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, yOrigin + 10)];
        
        
    } else {
        //get a reference to the label in the recycled view
        //        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    //    label.text = [dataArray[index] stringValue];
    UIImageView *userImage = (UIImageView *)[view viewWithTag:1];
    
    [SDWebImageDownloader.sharedDownloader downloadImageWithURL:[NSURL URLWithString:@"http://www.idmantv.az/img/panel/news_ru/d156dh2g9lenrrmqvkgsh9f7d2Lionel%20Messi.jpg"]
                                                        options:0
                                                       progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                                           
                                                           
                                                       } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                                                           NSLog(@"DUN DUN DUN DUN");
                                                           if(image && finished){
                                                               [userImage setImage:image];
                                                           }
                                                       }];
    
    
    return view;
}

- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform {
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * carousel.itemWidth);
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    //customize carousel display
    switch (option) {
        case iCarouselOptionWrap: {
            //normally you would hard-code this to YES or NO
            return NO;
        }
            
        case iCarouselOptionSpacing: {
            //add a bit of spacing between the item views
            return value * 4.8f;
        }
            
        case iCarouselOptionFadeMax: {
            if (carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
            
        default: {
            return value;
        }
    }
}

#pragma mark - MeetNowViewDelegate methods
-(IBAction)onMessageButtonTap:(id)sender {
    SendMessageViewController *messagesView = [[SendMessageViewController alloc]init];
    [self.navigationController pushViewController:messagesView animated:YES];
}

-(IBAction)onDeleteButtonTap:(id)sender {
    if (meetNowView.carousel.numberOfItems > 0) {
        NSInteger index = meetNowView.carousel.currentItemIndex;
        [meetNowView.carousel removeItemAtIndex:index animated:YES];
        [dataArray removeObjectAtIndex:index];
    }
}

@end
