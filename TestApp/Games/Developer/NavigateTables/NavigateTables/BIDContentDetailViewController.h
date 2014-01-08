
/***************************************/

//
//  BIDContentViewController.h
//  NavigateTables
//
//  Created by EventHorizon on 14/04/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDSecondLevelViewController.h"
#import <sqlite3.h>

@interface BIDContentDetailViewController :UIViewController{

//@property (weak,readonly,nonatomic) UILabel *label;
//@property (copy,nonatomic) NSString *message;

/* test */
//@property (weak,readonly,nonatomic) UILabel *aLabel;
//@property (copy,nonatomic) NSString *courseList;

    
    IBOutlet UIScrollView *scrolldown;

//-(IBAction)collegeButtonPressed:(UIButton *)sender;
    
    IBOutlet UILabel *heading;
    IBOutlet UILabel *year_1;
    IBOutlet UILabel *year_2;
    IBOutlet UILabel *year_3;
    
    IBOutlet UILabel *college_1;
    IBOutlet UILabel *college_2;
    IBOutlet UILabel *college_3;
    IBOutlet UILabel *college_4;
    IBOutlet UILabel *college_5;
    IBOutlet UILabel *college_6;
    IBOutlet UILabel *college_7;
    IBOutlet UILabel *college_8;
    
    
    IBOutlet UILabel *points1_2012;
    IBOutlet UILabel *points2_2012;
    IBOutlet UILabel *points3_2012;
    IBOutlet UILabel *points4_2012;
    IBOutlet UILabel *points5_2012;
    IBOutlet UILabel *points6_2012;
    IBOutlet UILabel *points7_2012;
    IBOutlet UILabel *points8_2012;

    IBOutlet UILabel *points1_2011;
    IBOutlet UILabel *points2_2011;
    IBOutlet UILabel *points3_2011;
    IBOutlet UILabel *points4_2011;
    IBOutlet UILabel *points5_2011;
    IBOutlet UILabel *points6_2011;
    IBOutlet UILabel *points7_2011;
    IBOutlet UILabel *points8_2011;
    
    IBOutlet UILabel *points1_2010;
    IBOutlet UILabel *points2_2010;
    IBOutlet UILabel *points3_2010;
    IBOutlet UILabel *points4_2010;
    IBOutlet UILabel *points5_2010;
    IBOutlet UILabel *points6_2010;
    IBOutlet UILabel *points7_2010;
    IBOutlet UILabel *points8_2010;
    
}

@end










