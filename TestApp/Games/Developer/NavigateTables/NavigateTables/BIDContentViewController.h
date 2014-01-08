//
//  BIDContentDetailViewController.h
//  NavigateTables
//
//  Created by EventHorizon on 14/04/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDSecondLevelViewController.h"


@class BIDContentDetailViewController;

@interface BIDContentViewController : BIDSecondLevelViewController

@property (copy,nonatomic) NSArray *courses;
@property (strong,nonatomic) BIDContentDetailViewController *detailController;

@end
