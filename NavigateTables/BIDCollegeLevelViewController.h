//
//  BIDCollegeLevelViewController.h
//  NavigateTables
//
//  Created by EventHorizon on 23/04/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDSecondLevelViewController.h"

@class BIDCollegeLevelViewController;

@interface BIDCollegeLevelViewController : BIDSecondLevelViewController

@property (copy,nonatomic) NSArray *colleges;
@property (strong,nonatomic) BIDCollegeLevelViewController *detailController;


@end
