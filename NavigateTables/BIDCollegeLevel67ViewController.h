//
//  BIDCollegeLevel67ViewController.h
//  NavigateTables
//
//  Created by EventHorizon on 07/01/2014.
//  Copyright (c) 2014 EventHorizon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDSecondLevelViewController.h"

@class BIDCollegeLevel67ViewController;

@interface BIDCollegeLevel67ViewController : BIDSecondLevelViewController

@property (copy,nonatomic) NSArray *colleges;
@property (strong,nonatomic) BIDCollegeLevel67ViewController *detailController;


@end