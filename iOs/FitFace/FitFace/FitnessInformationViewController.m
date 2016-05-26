//
//  FitnessInformationViewController.m
//  fitface
//
//  Created by LLDM 0037 on 3/18/16.
//  Copyright © 2016 Gabriel. All rights reserved.
//

#import "FitnessInformationViewController.h"

@interface FitnessInformationViewController ()

@end

@implementation FitnessInformationViewController

-(void)loadView {
    fitnessInformationView = [[FitnessInformationView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [fitnessInformationView setBaseViewDelegate:self];
    [fitnessInformationView setFitnessInformationDelegate:self];
    
    [fitnessInformationView setupLayout];
    [self setView:fitnessInformationView];
    
    [self.navigationItem setTitle:@"Fitness Information"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    sportsList = [NSArray arrayWithObjects:@"FOOTBALL", @"SOCCER", @"BASEBALL", @"BASKETBALL", @"HOCKEY", @"SWIMMING", @"WRESTLING", nil];
    
    choices = [NSMutableArray arrayWithObjects:@"PRACTICE", @"PLAY", @"FOLLOW", nil];
    
    trainingList = [NSArray arrayWithObjects: @"HEAVY WEIGTHS", @"MEDIUM WEIGTHS", @"LIGHT WEIGTHS", @"HIGH INTENSITY",
                             @"PURE CARDIO", @"IMPROVE HEALTH", @"CUTTING/SHREDDING", nil];
    
    martialArtsList = [NSArray arrayWithObjects:@"KARATE", @"TAEKWONDO", @"JUJITSU", @"MUAY TAI", nil];
//    [blockedUsersView blockedList:@[]];
    
    gymsArray = [[NSMutableArray alloc]initWithObjects:@"add", nil];
    outdoorsArray = [[NSMutableArray alloc]initWithObjects:@"add", nil];
    sportsArray = [[NSMutableArray alloc]initWithObjects:@"add", nil];
    trainingArray = [[NSMutableArray alloc]initWithObjects:@"add", nil];;
    martialArtsArray = [[NSMutableArray alloc]initWithObjects:@"add", nil];;
    involvementArray = [[NSMutableArray alloc]initWithObjects:@"add", nil];;
}

-(void)viewWillAppear:(BOOL)animated {
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            [btn setHidden:YES];
        }
    }
    
    self.navigationController.navigationBar.barTintColor = [BaseView colorWithHexString:THEME_COLOR];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

-(IBAction)onBackButtonTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - FitnessInformationViewDelegate methods
-(void)onCategoriesMatchTap:(UIGestureRecognizer *)sender {
    UIView *view = sender.view;
    if([[view.subviews objectAtIndex:0] isHidden]) {
        [[view.subviews objectAtIndex:0]setHidden:NO];
        
    } else
        [[view.subviews objectAtIndex:0]setHidden:YES];
}

-(void)onTrainingMatchTap:(UIGestureRecognizer *)sender {
    UIView *view = sender.view;
    if([[view.subviews objectAtIndex:0] isHidden]) {
        [[view.subviews objectAtIndex:0]setHidden:NO];
        
    } else
        [[view.subviews objectAtIndex:0]setHidden:YES];
    
}

-(void)onMartialArtsMatchTap:(UIGestureRecognizer *)sender; {
    UIView *view = sender.view;
    if([[view.subviews objectAtIndex:0] isHidden]) {
        [[view.subviews objectAtIndex:0]setHidden:NO];
        
    } else
        [[view.subviews objectAtIndex:0]setHidden:YES];
    
}

-(void)onCommunityMatchTap:(UIGestureRecognizer *)sender; {
    UIView *view = sender.view;
    if([[view.subviews objectAtIndex:0] isHidden]) {
        [[view.subviews objectAtIndex:0]setHidden:NO];
        
    } else
        [[view.subviews objectAtIndex:0]setHidden:YES];
    
}

-(IBAction)onCommunityInvolvementTap:(id)sender {
    CommunityViewController *communityView = [[CommunityViewController alloc]init];
    UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:communityView];
    [self presentViewController:navigation animated:YES completion:nil];
}

-(void)onDeleteButtonTap:(id)sender {
    UIButton *buttonTapped = (UIButton *)sender;
    NSLog(@"BUTTON TAPPED -- %d", (int)buttonTapped.tag);
    UITableViewCell *cell = (UITableViewCell *)buttonTapped.superview;
    NSIndexPath *path = [fitnessInformationView.tableView indexPathForCell:cell];
    
    if(path.section == 0) {
        [gymsArray removeObjectAtIndex:path.row];
        [fitnessInformationView.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
        
    } else if(path.section == 1) {
        [outdoorsArray removeObjectAtIndex:path.row];
        [fitnessInformationView.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
        
    } else if(path.section == 2) {
        [trainingArray removeObjectAtIndex:path.row];
        [fitnessInformationView.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
        
    } else if(path.section == 3) {
        [sportsArray removeObjectAtIndex:path.row];
        [fitnessInformationView.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
        
    } else if(path.section == 4) {
        [martialArtsArray removeObjectAtIndex:path.row];
        [fitnessInformationView.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
        
    } else if(path.section == 5) {
        [involvementArray removeObjectAtIndex:path.row];
        [fitnessInformationView.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
        
    }
    NSLog(@"ARRAY -- %@", sportsArray);
}

-(void)onHeaderButtonTap:(UITapGestureRecognizer *)gesture {
    UIView *tappedView = (UIView *)gesture.view;
    if([tappedView.subviews.lastObject isHidden]) {
        [tappedView.subviews.lastObject setHidden:NO];
        
    } else {
        [tappedView.subviews.lastObject setHidden:YES];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return [gymsArray count];
        
    } else if(section == 1) {
        return [outdoorsArray count];
        
    } else if(section == 2) {
        return [trainingArray count];
        
    } else if(section == 3) {
        return [sportsArray count];
        
    } else if(section == 4) {
        return [martialArtsArray count];
        
    } else if(section == 5) {
        return [involvementArray count];
    } else {
        return 0;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 6) {
        return 60;
    } else
        return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 18;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [NSString stringWithFormat:@"%d%d", (int)indexPath.section, (int)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSLog(@"ARRAY HERE -- %@", sportsArray);
    
    if (indexPath.section == 0) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//            NSLog(@"ROW: %d", indexPath.row);
//            if([[sportsArray objectAtIndex:indexPath.row] isEqualToString:@"add"]) {
                NSLog(@"ADD");
                UIImageView *addIcon = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [addIcon setImage:[UIImage imageNamed:@"ic_add"]];
                [addIcon setTag:1];
                [cell addSubview:addIcon];
                
                UILabel *addLabel = [[UILabel alloc]initWithFrame:CGRectMake(21, 0, cell.frame.size.width - 64, cell.frame.size.height - 2)];
                [addLabel setText:@"Add"];
                [addLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
                [addLabel setTextColor:[BaseView colorWithHexString:@"292929"]];
                [cell addSubview:addLabel];
                
                UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, cell.frame.size.height - 3, cell.frame.size.width - 58, 1)];
                [border setBackgroundColor:[BaseView colorWithHexString:@"F3F3F3"]];
                [cell addSubview: border];
                
//            } 
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
    } else if (indexPath.section == 1) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            if([[outdoorsArray objectAtIndex:indexPath.row] isEqualToString:@"add"]) {
                UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [icon setImage:[UIImage imageNamed:@"ic_add"]];
                [cell addSubview:icon];
                
                UILabel *addLabel = [[UILabel alloc]initWithFrame:CGRectMake(21, 0, cell.frame.size.width - 64, cell.frame.size.height - 2)];
                [addLabel setText:@"Add"];
                [addLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
                [addLabel setTextColor:[BaseView colorWithHexString:@"292929"]];
                [cell addSubview:addLabel];
                
                UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, cell.frame.size.height - 3, cell.frame.size.width - 58, 1)];
                [border setBackgroundColor:[BaseView colorWithHexString:@"F3F3F3"]];
                [cell addSubview: border];
                
            } else {
                UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [button setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
                [cell addSubview:button];
                [button setTag:[[NSString stringWithFormat:@"%d%d", (int)indexPath.section, (int)indexPath.row]integerValue]];
                [button addTarget:self action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
                
            }
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        
    } else if (indexPath.section == 2) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            if([[trainingArray objectAtIndex:indexPath.row] isEqualToString:@"add"]) {
                UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [icon setImage:[UIImage imageNamed:@"ic_add"]];
                [cell addSubview:icon];
                
                UILabel *addLabel = [[UILabel alloc]initWithFrame:CGRectMake(21, 0, cell.frame.size.width - 64, cell.frame.size.height - 2)];
                [addLabel setText:@"Add"];
                [addLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
                [addLabel setTextColor:[BaseView colorWithHexString:@"292929"]];
                [cell addSubview:addLabel];
                
                UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, cell.frame.size.height - 3, cell.frame.size.width - 58, 1)];
                [border setBackgroundColor:[BaseView colorWithHexString:@"F3F3F3"]];
                [cell addSubview: border];
                
            } else {
                UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [button setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
                [button setTag:[[NSString stringWithFormat:@"%d%d", (int)indexPath.section, (int)indexPath.row]integerValue]];
                [button addTarget:self action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:button];
                
            }
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
    } else if (indexPath.section == 3) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            if([[sportsArray objectAtIndex:indexPath.row] isEqualToString:@"add"]) {
                UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [icon setImage:[UIImage imageNamed:@"ic_add"]];
                [cell addSubview:icon];
                
                UILabel *addLabel = [[UILabel alloc]initWithFrame:CGRectMake(21, 0, cell.frame.size.width - 64, cell.frame.size.height - 2)];
                [addLabel setText:@"Add"];
                [addLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
                [addLabel setTextColor:[BaseView colorWithHexString:@"292929"]];
                [cell addSubview:addLabel];
                
                UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, cell.frame.size.height - 3, cell.frame.size.width - 58, 1)];
                [border setBackgroundColor:[BaseView colorWithHexString:@"F3F3F3"]];
                [cell addSubview: border];
                
            } else {
                UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [button setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
                [button setTag:[[NSString stringWithFormat:@"%d%d", (int)indexPath.section, (int)indexPath.row]integerValue]];
                [button addTarget:self action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:button];
                
            }
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    } else if (indexPath.section == 4) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            if([[martialArtsArray objectAtIndex:indexPath.row] isEqualToString:@"add"]) {
                UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [icon setImage:[UIImage imageNamed:@"ic_add"]];
                [cell addSubview:icon];
                
                UILabel *addLabel = [[UILabel alloc]initWithFrame:CGRectMake(21, 0, cell.frame.size.width - 64, cell.frame.size.height - 2)];
                [addLabel setText:@"Add"];
                [addLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
                [addLabel setTextColor:[BaseView colorWithHexString:@"292929"]];
                [cell addSubview:addLabel];
                
                UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, cell.frame.size.height - 3, cell.frame.size.width - 58, 1)];
                [border setBackgroundColor:[BaseView colorWithHexString:@"F3F3F3"]];
                [cell addSubview: border];
                
            } else {
                UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [button setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
                [cell addSubview:button];
                [button setTag:[[NSString stringWithFormat:@"%d%d", (int)indexPath.section, (int)indexPath.row]integerValue]];
                [button addTarget:self action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
                
            }
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        
    } else if (indexPath.section == 5) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            if([[involvementArray objectAtIndex:indexPath.row] isEqualToString:@"add"]) {
                UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [icon setImage:[UIImage imageNamed:@"ic_add"]];
                [cell addSubview:icon];
                
                UILabel *addLabel = [[UILabel alloc]initWithFrame:CGRectMake(21, 0, cell.frame.size.width - 64, cell.frame.size.height - 2)];
                [addLabel setText:@"Add"];
                [addLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
                [addLabel setTextColor:[BaseView colorWithHexString:@"292929"]];
                [cell addSubview:addLabel];
                
                UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, cell.frame.size.height - 3, cell.frame.size.width - 58, 1)];
                [border setBackgroundColor:[BaseView colorWithHexString:@"F3F3F3"]];
                [cell addSubview: border];
                
            } else {
                UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
                [button setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
                [button setTag:[[NSString stringWithFormat:@"%d%d", (int)indexPath.section, (int)indexPath.row]integerValue]];
                [button addTarget:self action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:button];
                
            }
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
    } 
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedPath = indexPath;
    
    if(indexPath.section == 0) {
        if(indexPath.row == [gymsArray count] - 1) {
            NSString *tempObj = @"add";
            [gymsArray replaceObjectAtIndex:indexPath.row withObject:@"object"];
            [gymsArray addObject:tempObj];
            NSLog(@"ARRAYs: %@", gymsArray);
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            [self clearSubviews:cell];
            [self modifyCell:cell];
            
            NSIndexPath *path = [NSIndexPath indexPathForRow:[gymsArray count] - 1 inSection:indexPath.section];
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
            [tableView endUpdates];
            
            
//            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
    } else if(indexPath.section == 1) {
        if(indexPath.row == [outdoorsArray count] - 1) {
            NSString *tempObj = @"add";
            [outdoorsArray replaceObjectAtIndex:indexPath.row withObject:@"object"];
            [outdoorsArray addObject:tempObj];
            NSLog(@"ARRAYs: %@", sportsArray);
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            ////            [[cell viewWithTag:1] removeFromSuperview];
            [self clearSubviews:cell];
            [self modifyCell:cell];
            
            NSIndexPath *path = [NSIndexPath indexPathForRow:[outdoorsArray count] - 1 inSection:indexPath.section];
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
            [tableView endUpdates];
            
//            [trainingArray insertObject:@"object" atIndex:0];
//            NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
//            [tableView beginUpdates];
//            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
//            [tableView endUpdates];
            
        }
    } else if(indexPath.section == 2) {
        if(indexPath.row == [trainingArray count] - 1) {
            
            NSString *tempObj = @"add";
            [trainingArray replaceObjectAtIndex:indexPath.row withObject:@"object"];
            [trainingArray addObject:tempObj];
            NSLog(@"ARRAYs: %@", sportsArray);
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            ////            [[cell viewWithTag:1] removeFromSuperview];
            [self clearSubviews:cell];
            [self modifyCell:cell];
            
            NSIndexPath *path = [NSIndexPath indexPathForRow:[trainingArray count] - 1 inSection:indexPath.section];
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
            [tableView endUpdates];
            
//            [martialArtsArray insertObject:@"object" atIndex:0];
//            NSIndexPath *path = [NSIndexPath indexPathForRow:[martialArtsArray count] - 1 inSection:indexPath.section];
//            [tableView beginUpdates];
//            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
//            [tableView endUpdates];
            
        }
    } else if(indexPath.section == 3) {
        if(indexPath.row == [sportsArray count] - 1) {
        
            NSString *tempObj = @"add";
            [sportsArray replaceObjectAtIndex:indexPath.row withObject:@"object"];
            [sportsArray addObject:tempObj];
            NSLog(@"ARRAYs: %@", sportsArray);
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            ////            [[cell viewWithTag:1] removeFromSuperview];
            [self clearSubviews:cell];
            [self modifyCell:cell];
            
            NSIndexPath *path = [NSIndexPath indexPathForRow:[sportsArray count] - 1 inSection:indexPath.section];
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
            [tableView endUpdates];
            
            //            [martialArtsArray insertObject:@"object" atIndex:0];
            //            NSIndexPath *path = [NSIndexPath indexPathForRow:[martialArtsArray count] - 1 inSection:indexPath.section];
            //            [tableView beginUpdates];
            //            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
            //            [tableView endUpdates];
        
        }
    } else if(indexPath.section == 4) {
        if(indexPath.row == [martialArtsArray count] - 1) {
            NSLog(@"PATH -- %@", indexPath);
            NSString *tempObj = @"add";
            [martialArtsArray replaceObjectAtIndex:indexPath.row withObject:@"object"];
            [martialArtsArray addObject:tempObj];
            NSLog(@"ARRAYs: %@", sportsArray);
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            ////            [[cell viewWithTag:1] removeFromSuperview];
            [self clearSubviews:cell];
            [self modifyCell:cell];
            
            NSIndexPath *path = [NSIndexPath indexPathForRow:[martialArtsArray count] - 1 inSection:indexPath.section];
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
            [tableView endUpdates];
            
            //            [trainingArray insertObject:@"object" atIndex:0];
            //            NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
            //            [tableView beginUpdates];
            //            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
            //            [tableView endUpdates];
            
        }
    } else if(indexPath.section == 5) {
        if(indexPath.row == [involvementArray count] - 1) {
            
            NSString *tempObj = @"add";
            [involvementArray replaceObjectAtIndex:indexPath.row withObject:@"object"];
            [involvementArray addObject:tempObj];
            NSLog(@"ARRAYs: %@", sportsArray);
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            ////            [[cell viewWithTag:1] removeFromSuperview];
            [self clearSubviews:cell];
            [self modifyCell:cell];
            
            NSIndexPath *path = [NSIndexPath indexPathForRow:[involvementArray count] - 1 inSection:indexPath.section];
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
            [tableView endUpdates];
            
            //            [martialArtsArray insertObject:@"object" atIndex:0];
            //            NSIndexPath *path = [NSIndexPath indexPathForRow:[martialArtsArray count] - 1 inSection:indexPath.section];
            //            [tableView beginUpdates];
            //            [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
            //            [tableView endUpdates];
            
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *headerLabel;
    if(section == 0) {
        headerLabel = @"GYMS";
        
    } else if(section == 1) {
        headerLabel = @"OUTDOORS";
        
    } else if(section == 2) {
        headerLabel = @"WORKOUTS";
        
    } else if(section == 3) {
        headerLabel = @"SPORTS";
        
    } else if(section == 4) {
        headerLabel = @"MARTIAL ARTS";
        
    } else if(section == 5) {
        headerLabel = @"COMMUNITY INVOLVEMENT";
        
    } else {
        headerLabel = nil;
    }
    
    return headerLabel;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)];
    
    if(section == 6) {
        UIButton *updateButton = [[UIButton alloc]initWithFrame:CGRectMake(16, 10, headerView.frame.size.width - 32, 46)];
        [updateButton setBackgroundColor:[BaseView colorWithHexString:@"C3C4C4"]];
        [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [updateButton.titleLabel setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
        
        [headerView addSubview:updateButton];
        
    } else {
        UILabel *categoriesLabel = [[UILabel alloc]initWithFrame:CGRectMake(17, 6, headerView.frame.size.width - 134, headerView.frame.size.height)];
        [categoriesLabel setAttributedText:[BaseView setCharacterSpacingWithString:[tableView.dataSource tableView:tableView titleForHeaderInSection:section]]];
        [categoriesLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
        [categoriesLabel setTextColor:[BaseView colorWithHexString:@"5D77AC"]];
        [headerView addSubview:categoriesLabel];
        
        UILabel *matchLabel = [[UILabel alloc]initWithFrame:CGRectMake(headerView.frame.size.width - 128, 6, 90, headerView.frame.size.height)];
        [matchLabel setAttributedText:[BaseView setCharacterSpacingWithString:@"MATCH ME THESE"]];
        [matchLabel setFont:[UIFont fontWithName:AVENIR_HEAVY size:8]];
        [matchLabel setTextColor:[BaseView colorWithHexString:@"B5B5B5"]];
        [headerView addSubview:matchLabel];
        
        UIView *buttonBorder = [[UIView alloc]initWithFrame:CGRectMake(headerView.frame.size.width - 34, 6, 22, headerView.frame.size.height)];
        [buttonBorder.layer setCornerRadius:2.0];
        [buttonBorder.layer setBorderWidth:1.0];
        [buttonBorder.layer setBorderColor:[BaseView colorWithHexString:@"C8C7C8"].CGColor];
        [headerView addSubview:buttonBorder];
        
        UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onHeaderButtonTap:)];
        [buttonBorder addGestureRecognizer:tapped];
        
        UIView *selection = [[UIView alloc]initWithFrame:CGRectMake(3, 3, buttonBorder.frame.size.width - 6, buttonBorder.frame.size.height - 6)];
        [selection setBackgroundColor:[BaseView colorWithHexString:THEME_COLOR]];
        [selection.layer setCornerRadius:2.0];
        [buttonBorder addSubview:selection];
        [selection setHidden:YES];
        
    }
//    [headerView setBackgroundColor:[BaseView colorWithHexString:@"E7F3FE"]];
    
    
    return headerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)];
    [footerView setBackgroundColor:[UIColor whiteColor]];
    return footerView;
}

-(void)clearSubviews:(UITableViewCell *)cell {
    for(UIView *view in cell.subviews) {
        [view removeFromSuperview];
    }
}

-(void)modifyCell:(UITableViewCell *)cell {
    if(selectedPath.section == 0 || selectedPath.section == 1) {
        UILabel *category = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, cell.frame.size.width - 78, cell.frame.size.height - 2)];
        [category setText:@"- - -"];
        [category setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
        [category setTag:1];
        [cell addSubview:category];
        
        UIImageView *choicesIcon = [[UIImageView alloc]initWithFrame:CGRectMake(category.frame.size.width + category.frame.origin.x, 22, 11, 6)];
        [choicesIcon setImage:[UIImage imageNamed:@"drop"]];
        [cell addSubview:choicesIcon];
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, cell.frame.size.height - 3, 260, 1)];
        [border setBackgroundColor:[BaseView colorWithHexString:@"F3F3F3"]];
        [cell addSubview:border];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(16, category.frame.origin.y, border.frame.size.width, category.frame.size.height)];
//        [button setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
//        //    [button setTag:[[NSString stringWithFormat:@"%d%d", (int)indexPath.section, (int)indexPath.row]integerValue]];
//        [button addTarget:self action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:button];
        
    } else {
        UILabel *category = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, 116, cell.frame.size.height - 2)];
        [category setText:@"- - -"];
        [category setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];
        [category setTag:1];
        [cell addSubview:category];
        
        UIImageView *choicesIcon = [[UIImageView alloc]initWithFrame:CGRectMake(category.frame.size.width + category.frame.origin.x, 22, 11, 6)];
        [choicesIcon setImage:[UIImage imageNamed:@"drop"]];
        [cell addSubview:choicesIcon];
        
        UIView *border = [[UIView alloc]initWithFrame:CGRectMake(16, cell.frame.size.height - 3, 134, 1)];
        [border setBackgroundColor:[BaseView colorWithHexString:@"F3F3F3"]];
        [cell addSubview:border];
        
        UIButton *sportsButton = [[UIButton alloc]initWithFrame:CGRectMake(16, category.frame.origin.y, border.frame.size.width, category.frame.size.height)];
        [sportsButton addTarget:self action:@selector(onCategoryButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:sportsButton];
        
        UILabel *type = [[UILabel alloc]initWithFrame:CGRectMake(border.frame.origin.x + border.frame.size.width + 18, 2, 90, cell.frame.size.height - 2)];
        [type setText:@"- - -"];
        [type setFont:[UIFont fontWithName:AVENIR_BOOK size:10]];\
        [type setTag:2];
        [cell addSubview:type];
        
        border = [[UIView alloc]initWithFrame:CGRectMake(choicesIcon.frame.size.width + choicesIcon.frame.origin.x + 16, cell.frame.size.height - 3, 110, 1)];
        [border setBackgroundColor:[BaseView colorWithHexString:@"F3F3F3"]];
        [cell addSubview:border];
        
        UIButton *typeButton = [[UIButton alloc]initWithFrame:CGRectMake(border.frame.origin.x, type.frame.origin.y, border.frame.size.width, type.frame.size.height + 2)];
        [typeButton addTarget:self action:@selector(onChoicesButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:typeButton];
        
        choicesIcon = [[UIImageView alloc]initWithFrame:CGRectMake(type.frame.size.width + type.frame.origin.x, 22, 11, 6)];
        [choicesIcon setImage:[UIImage imageNamed:@"drop"]];
        [cell addSubview:choicesIcon];border = [[UIView alloc]initWithFrame:CGRectMake(16, cell.frame.size.height - 3, 134, 1)];
        
    }
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(cell.frame.size.width - 30, 16, 11, 14)];
    [button setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    //    [button setTag:[[NSString stringWithFormat:@"%d%d", (int)indexPath.section, (int)indexPath.row]integerValue]];
    [button addTarget:self action:@selector(onDeleteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:button];
    
}

-(void)onCategoryButtonTap:(id)sender {
    UITableViewCell *cell = (UITableViewCell *) ((UIButton *)sender).superview;
    NSIndexPath *path = [fitnessInformationView.tableView indexPathForCell:cell];
    NSLog(@"PATH -- %@", [fitnessInformationView.tableView indexPathForCell:cell]);
    UIActionSheet *actionSheet;
    
    if(path.section == 0) {
        
    } else if(path.section == 1) {
        
    } else if(path.section == 2) {
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"Types of Training:"
                                                                 delegate:self
                                                        cancelButtonTitle:nil
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:nil];
        
        for (NSString *title in trainingList) {
            [actionSheet addButtonWithTitle:title];
        }
        
        actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
        
        [actionSheet showInView:self.view];
        
    } else if(path.section == 3) {
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose Sports:"
                                                                 delegate:self
                                                        cancelButtonTitle:nil
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:nil];
        
        for (NSString *title in sportsList) {
            [actionSheet addButtonWithTitle:title];
        }
        
        actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
        
        [actionSheet showInView:self.view];
    } else if(path.section == 4) {
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"Martial Arts:"
                                                                 delegate:self
                                                        cancelButtonTitle:nil
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:nil];
        
        for (NSString *title in martialArtsList) {
            [actionSheet addButtonWithTitle:title];
        }
        
        actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
        
        [actionSheet showInView:self.view];
        
    } else if(path.section == 5) {
        
    }
    
    selectedLabel = (UILabel *)[cell viewWithTag:1];
    selectedPath = path;
    [actionSheet setTag:0];
    
}

-(void)onChoicesButtonTap:(id)sender {
    UITableViewCell *cell = (UITableViewCell *) ((UIButton *)sender).superview;
    NSIndexPath *path = [fitnessInformationView.tableView indexPathForCell:cell];
    NSLog(@"PATH -- %@", [fitnessInformationView.tableView indexPathForCell:cell]);
    UIActionSheet *actionSheet;
    
    if(path.section == 0) {
        
    } else if(path.section == 1) {
        
    } else if(path.section == 2) {
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose:"
                                                  delegate:self
                                         cancelButtonTitle:nil
                                    destructiveButtonTitle:nil
                                         otherButtonTitles:nil];
        
        for (NSString *title in choices) {
            [actionSheet addButtonWithTitle:title];
        }
        
        actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
        
        [actionSheet showInView:self.view];
        
    } else if(path.section == 3) {
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose:"
                                                  delegate:self
                                         cancelButtonTitle:nil
                                    destructiveButtonTitle:nil
                                         otherButtonTitles:nil];
        
        for (NSString *title in choices) {
            [actionSheet addButtonWithTitle:title];
        }
        
        actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
        
        [actionSheet showInView:self.view];
    } else if(path.section == 4) {
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose:"
                                                  delegate:self
                                         cancelButtonTitle:nil
                                    destructiveButtonTitle:nil
                                         otherButtonTitles:nil];
        
        for (NSString *title in choices) {
            [actionSheet addButtonWithTitle:title];
        }
        
        actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
        
        [actionSheet showInView:self.view];
        
    } else if(path.section == 5) {
        
    }
    
    selectedLabel = (UILabel *)[cell viewWithTag:2];
    selectedPath = path;
    [actionSheet setTag:1];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(actionSheet.tag == 0) {
        if(buttonIndex != actionSheet.cancelButtonIndex) {
            NSLog(@"LOG");
            
            if(selectedPath.section == 0) {
                
            } else if(selectedPath.section == 1) {
                
            } else if(selectedPath.section == 2) {
                [selectedLabel setText:[trainingList objectAtIndex:buttonIndex]];
                
            } else if(selectedPath.section == 3) {
                [selectedLabel setText:[sportsList objectAtIndex:buttonIndex]];
                
            } else if(selectedPath.section == 4) {
                [selectedLabel setText:[martialArtsList objectAtIndex:buttonIndex]];
                
            } else if(selectedPath.section == 5) {
                
            }
        }
        
    } else {
        [selectedLabel setText:[choices objectAtIndex:buttonIndex]];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

@end
